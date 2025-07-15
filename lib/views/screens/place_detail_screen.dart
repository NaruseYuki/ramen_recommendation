// lib/views/screens/place_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:ramen_recommendation/models/review.dart';
import 'package:ramen_recommendation/viewmodels/place_detail_viewmodel.dart';
import 'package:ramen_recommendation/views/screens/base/error_listening_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../api/providers/service_providers.dart';
import '../../errors/app_error_code.dart';

class PlaceDetailScreen extends ConsumerStatefulWidget {
  final String placeId;
  const PlaceDetailScreen({super.key, required this.placeId});

  @override
  ConsumerState<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

// ErrorListeningPageを継承
class _PlaceDetailScreenState extends ErrorListeningScreen<PlaceDetailScreen> {
  late PlaceDetailViewModel placeDetailViewmodel;
  @override
  void initState() {
    super.initState(); // ErrorListeningPageのinitStateを呼び出す
    WidgetsBinding.instance.addPostFrameCallback((_) {
      placeDetailViewmodel = ref.read(placeDetailViewModelProvider.notifier);
      placeDetailViewmodel.fetchInitialData(widget.placeId);
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

    // 店舗情報取得失敗のチェックは残す（エラーではないため）
    if (!state.detail.containsKey(widget.placeId)) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text('place_detail.info_not_found'.tr())),
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
              final result =
              await placeDetailViewmodel.toggleFavorite(RamenPlace(
                id: detail.id,
                displayName: DisplayName(text: detail.name),
                address: detail.address,
                location: Location(
                    latitude: detail.latitude, longitude: detail.longitude),
              ));
              if (result) { // UI更新が成功した場合のみSnack barを表示
                scaffoldMessenger.showSnackBar(
                  SnackBar(
                    content: Text(
                      isFavorite
                          ? 'favorite.remove_success'.tr()
                          : 'favorite.add_success'.tr(),
                    ),
                  ),
                );
              }
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
              // _launchMapでエラーが発生した場合もerrorMessageProviderに設定される
              _launchMap(details.name);
            },
            child: Text('place_detail.open_map'.tr()),
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
        Text(
          'place_detail.opening_hours'.tr(),
          style: const TextStyle(fontWeight: FontWeight.bold),
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
              child: Text('place_detail.website'.tr()),
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
        Text(
          'place_detail.reviews'.tr(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        ...details.reviews.map((review) => _buildReviewTile(review)).toList(),
        if (details.reviews.isEmpty) Text('place_detail.no_reviews'.tr()),
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

  // launchUrlエラーハンドリングの追加 (errorMessageProviderに設定)
  Future<void> _launchMap(String name) async {
    final url = Uri.parse('https://www.google.com/maps?q=$name');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      ref.read(errorMessageProvider.notifier).state = AppErrorCode.mapUnknownError(); // エラーをerrorMessageProviderに設定
    }
  }

  // launchUrlエラーハンドリングの追加 (errorMessageProviderに設定)
  Future<void> _launchWebsite(String websiteUri) async {
    final url = Uri.parse(websiteUri);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      ref.read(errorMessageProvider.notifier).state = AppErrorCode.commonSystemError(); // ウェブサイトオープン失敗を一般的なシステムエラーとする
    }
  }
}