// lib/views/screens/place_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/api/responses/get_place_details_response.dart';
import 'package:ramen_recommendation/app_initializer.dart';
import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:ramen_recommendation/models/review.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceDetailScreen extends ConsumerStatefulWidget {
  final GetPlaceDetailsResponse details;
  final AppInitializer appInitializer;

  const PlaceDetailScreen({
    super.key,
    required this.details,
    required this.appInitializer,
  });

  @override
  ConsumerState<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends ConsumerState<PlaceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final favoritePlacesViewModel = ref
        .read(widget.appInitializer.favoritePlacesViewModelProvider.notifier);
    final favoriteState =
        ref.watch(widget.appInitializer.favoritePlacesViewModelProvider);

    final isFavorite =
        favoriteState.places.any((place) => place.id == widget.details.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.details.name),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_border,
              color: isFavorite ? Colors.amber : Colors.white,
            ),
            onPressed: () async {
              final result =
                  await favoritePlacesViewModel.toggleFavorite(RamenPlace(
                id: widget.details.id,
                name: widget.details.name,
                address: widget.details.address,
                latitude: widget.details.latitude,
                longitude: widget.details.longitude,
              ));
              scaffoldMessenger.showSnackBar(
                SnackBar(
                  content: Text(
                    result
                        ? (isFavorite ? 'お気に入りから削除しました' : 'お気に入りに追加しました')
                        : 'お気に入りの更新に失敗しました',
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildPlaceDetails(context),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPlaceDetails(BuildContext context) {
    List<Widget> list = [
      Text(
        widget.details.name,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 8),
      Text(
        widget.details.address,
        style: const TextStyle(fontSize: 16),
      ),
      const SizedBox(height: 16),
    ];

    if (widget.details.rating != null) {
      list.add(_buildRating());
    }
    if (widget.details.weekdayDescriptions.isNotEmpty) {
      list.add(_buildOpeningHoursSection());
    }

    if (widget.details.reviews.isNotEmpty) {
      list.add(_buildReviewsSection());
    }

    if (widget.details.website != null) {
      list.add(_buildWebsiteButton(context));
    }

    list.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              _launchMap(widget.details.latitude, widget.details.longitude);
            },
            child: const Text('地図アプリで開く'),
          ),
        ),
      ),
    );
    return list;
  }

  Widget _buildRating() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber),
            Text(
              '${widget.details.rating} (${widget.details.userRatingsTotal ?? 0}件の評価)',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildOpeningHoursSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '営業時間',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ...widget.details.weekdayDescriptions
            .map((text) => Text(text))
            .toList(),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildWebsiteButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _launchWebsite(widget.details.website!),
              child: const Text('ウェブサイト'),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildReviewsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '口コミ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ...widget.details.reviews
            .map((review) => _buildReviewTile(review))
            .toList(),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildReviewTile(Review review) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.person),
              const SizedBox(width: 8),
              Text(
                review.authorName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(review.text),
          if (review.rating != null)
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                Text('${review.rating}'),
              ],
            ),
        ],
      ),
    );
  }

  Future<void> _launchMap(double latitude, double longitude) async {
    final url = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw '地図アプリを開けません';
    }
  }

  Future<void> _launchWebsite(String websiteUri) async {
    final url = Uri.parse(websiteUri);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'ウェブサイトを開けません';
    }
  }
}
