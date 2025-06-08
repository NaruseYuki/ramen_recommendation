// lib/views/screens/place_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:ramen_recommendation/models/review.dart';
import 'package:ramen_recommendation/viewmodels/place_detail_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceDetailScreen extends ConsumerStatefulWidget {
  final String placeId;
  const PlaceDetailScreen({super.key, required this.placeId});

  @override
  ConsumerState<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends ConsumerState<PlaceDetailScreen> {
  late PlaceDetailViewModel placeDetailViewmodel;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
       placeDetailViewmodel = ref.read(placeDetailViewModelProvider.notifier);
       placeDetailViewmodel.fetchPlaceDetails(widget.placeId);

    });
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final state = ref.watch(placeDetailViewModelProvider);

    if (state.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (state.error != null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text('エラー: ${state.error}')),
      );
    }

    if (!state.detail.containsKey(widget.placeId)) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('店舗情報が取得できませんでした')),
      );
    }

    final detail = state.detail[widget.placeId]!;
    final isFavorite = state.favoritePlaceIds.contains(detail.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(detail.name),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_border,
              color: isFavorite ? Colors.amber : Colors.white,
            ),
            onPressed: () async {
              final result = await placeDetailViewmodel.toggleFavorite(RamenPlace(
                id: detail.id,
                name: detail.name,
                address: detail.address,
                latitude: detail.latitude,
                longitude: detail.longitude,
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
            children: _buildPlaceDetails(context, detail),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPlaceDetails(BuildContext context, details) {
    List<Widget> list = [
      Text(
        details.name,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 8),
      Text(
        details.address,
        style: const TextStyle(fontSize: 16),
      ),
      const SizedBox(height: 16),
    ];

    if (details.rating != null) {
      list.add(_buildRating(details));
    }
    if (details.weekdayDescriptions.isNotEmpty) {
      list.add(_buildOpeningHoursSection(details));
    }

    if (details.reviews.isNotEmpty) {
      list.add(_buildReviewsSection(details));
    }

    if (details.website != null) {
      list.add(_buildWebsiteButton(context, details));
    }

    list.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              _launchMap(details.latitude, details.longitude);
            },
            child: const Text('地図アプリで開く'),
          ),
        ),
      ),
    );
    return list;
  }

  Widget _buildRating(details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber),
            Text(
              '${details.rating} (${details.userRatingsTotal ?? 0}件の評価)',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildOpeningHoursSection(details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '営業時間',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ...details.weekdayDescriptions.map((text) => Text(text)).toList(),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildWebsiteButton(BuildContext context, details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _launchWebsite(details.website!),
              child: const Text('ウェブサイト'),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildReviewsSection(details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '口コミ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ...details.reviews.map((review) => _buildReviewTile(review)).toList(),
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
