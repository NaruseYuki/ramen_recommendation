// lib/views/screens/place_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class PlaceDetailScreen extends StatelessWidget {
  final Map<String, dynamic> details;

  const PlaceDetailScreen({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(details['displayName']['text'] ?? '名称不明'),
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
        details['displayName']['text'] ?? '名称不明',
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 8),
      Text(
        details['formattedAddress'] ?? '住所不明',
        style: const TextStyle(fontSize: 16),
      ),
      const SizedBox(height: 16),
    ];

    if (details['rating'] != null) {
      list.add(_buildRating());
    }
    if (details['currentOpeningHours']!= null) {
      list.add(_buildOpeningHoursSection());
    }

    if (details['reviews'].isNotEmpty) {
      list.add(_buildReviewsSection());
    }

    if (details['websiteUri'] != null) {
      list.add(_buildWebsiteButton(context));
    }

    list.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // 両端に隙間を追加
        child: SizedBox(
          width: double.infinity, // ボタンを横幅いっぱいに広げる
          child: ElevatedButton(
            onPressed: () {
              final location = details['location'];
              if (location != null) {
                _launchMap(location['latitude'], location['longitude']);
              }
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
              '${details['rating']} (${details['userRatingCount'] ?? '0'}件の評価)',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildOpeningHoursSection() {
    final openingHours = details['currentOpeningHours'];
    if (openingHours == null) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '営業時間',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        if (openingHours['weekdayDescriptions'] != null)
          ...openingHours['weekdayDescriptions']
              .map<Widget>((text) => Text(text))
              .toList(),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildWebsiteButton(BuildContext context) {
    final websiteUri = details['websiteUri'];
    if (websiteUri == null) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // 両端に隙間を追加
          child: SizedBox(
            width: double.infinity, // ボタンを横幅いっぱいに広げる
            child: ElevatedButton(
              onPressed: () => _launchWebsite(websiteUri),
              child: const Text('ウェブサイト'),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildReviewsSection() {
    final reviews = details['reviews'];
    if (reviews == null || reviews.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '口コミ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ..._buildReviews(reviews),
        const SizedBox(height: 16),
      ],
    );
  }

  List<Widget> _buildReviews(List<dynamic> reviews) {
    return reviews.map<Widget>((review) {
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
                  review['authorAttribution']['displayName'] ?? '名無し',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(review['originalText']['text'] ?? '口コミなし'),
            if (review['rating'] != null)
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  Text('${review['rating']}'),
                ],
              ),
          ],
        ),
      );
    }).toList();
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
