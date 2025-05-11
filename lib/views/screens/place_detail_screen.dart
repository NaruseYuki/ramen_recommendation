// lib/views/screens/place_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:ramen_recommendation/api/responses/get_place_details_response.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceDetailScreen extends StatelessWidget {
  final GetPlaceDetailsResponse details;

  const PlaceDetailScreen({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(details.name),
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
      list.add(_buildRating());
    }
    if (details.weekdayDescriptions.isNotEmpty) {
      list.add(_buildOpeningHoursSection());
    }

    if (details.reviews.isNotEmpty) {
      list.add(_buildReviewsSection());
    }

    if (details.website != null) {
      list.add(_buildWebsiteButton(context));
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

  Widget _buildRating() {
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

  Widget _buildOpeningHoursSection() {
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

  Widget _buildWebsiteButton(BuildContext context) {
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

  Widget _buildReviewsSection() {
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
