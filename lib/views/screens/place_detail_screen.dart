// lib/views/screens/place_detail_screen.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/api/responses/get_place_details_response.dart';
import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:ramen_recommendation/models/review.dart';
import 'package:ramen_recommendation/utils/color.dart';
import 'package:ramen_recommendation/viewmodels/place_detail_viewmodel.dart';
import 'package:ramen_recommendation/views/screens/base/common/loading.dart';
import 'package:ramen_recommendation/views/screens/base/error_listening_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../api/providers/service_providers.dart';
import '../../errors/app_error_code.dart';

class PlaceDetailScreen extends ConsumerStatefulWidget {
  final String placeId;

  const PlaceDetailScreen({super.key, required this.placeId});

  @override
  ConsumerState<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

// ErrorListeningPageを継承
class _PlaceDetailScreenState extends ConsumerState<PlaceDetailScreen>
    with ErrorListeningMixin<PlaceDetailScreen>, WidgetsBindingObserver {
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
    setupErrorListener(ref);
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final state = ref.watch(placeDetailViewModelProvider);

    if (state.isLoading) {
      return const Scaffold(body: LoadingWidget());
    }

    final detail = state.detail[widget.placeId]!;
    final isFavorite = state.favoritePlaceIds.contains(detail.id);

    return Scaffold(
      backgroundColor: AppColor.background,
      body: !state.detail.containsKey(widget.placeId)
          ? Center(child: Text('place_detail.info_not_found'.tr()))
          : Column(
              // body直下にColumnを配置
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0), // 全体のパディング
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          detail.name, // 店名を固定タイトルとして表示
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      favoriteButton(isFavorite, detail, scaffoldMessenger),
                    ],
                  ),
                ),
                // --- 固定するヘッダー部分終わり ---
                // --- スクロール可能なコンテンツ部分 ---
                Expanded(
                  // 残りのスペースを埋めるためにExpandedでラップ
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    // 必要に応じて左右のパディングを設定
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8), // 固定部分との間にスペース
                        Text(
                          detail.address,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        if (detail.rating != null) _buildRating(detail),
                        Text(
                          'place_detail.opening_hours'.tr(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        if (detail.weekdayDescriptions.isNotEmpty)
                          _buildOpeningHoursSection(detail),
                        const SizedBox(height: 16),
                        if (detail.reviews.isNotEmpty)
                          Text(
                            'place_detail.reviews'.tr(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        _buildReviewsSection(detail),
                      ],
                    ),
                  ),
                ),
                // --- スクロール可能なコンテンツ部分終わり ---
              ],
            ),
      bottomNavigationBar: _buildActionButtons(
        context,
        detail,
        ref,
      ),
    );
  }

  IconButton favoriteButton(bool isFavorite, GetPlaceDetailsResponse detail,
      ScaffoldMessengerState scaffoldMessenger) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.star : Icons.star_border,
        color: isFavorite ? Colors.amber : null,
      ),
      onPressed: () async {
        final result = await placeDetailViewmodel.toggleFavorite(RamenPlace(
          id: detail.id,
          displayName: DisplayName(text: detail.name),
          address: detail.address,
          location:
              Location(latitude: detail.latitude, longitude: detail.longitude),
        ));
        if (result) {
          scaffoldMessenger.showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 1),
              content: Text(
                isFavorite
                    ? 'favorite.remove_success'.tr()
                    : 'favorite.add_success'.tr(),
              ),
            ),
          );
        }
      },
    );
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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white, // 背景色を薄くする
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(8.0), // 内側のパディングを追加
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...details.weekdayDescriptions.map((text) => Text(text)).toList(),
        ],
      ),
    );
  }

  Widget _buildReviewsSection(details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        color: Colors.white,
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

  Future<void> _launchMap(String name) async {
    final url = Uri.parse('https://www.google.com/maps?q=$name');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      ref.read(errorMessageProvider.notifier).state =
          AppErrorCode.mapUnknownError(); // エラーをerrorMessageProviderに設定
    }
  }

  // launchUrlエラーハンドリングの追加 (errorMessageProviderに設定)
  Future<void> _launchWebsite(String websiteUri) async {
    final url = Uri.parse(websiteUri);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      ref.read(errorMessageProvider.notifier).state =
          AppErrorCode.commonSystemError(); // ウェブサイトオープン失敗を一般的なシステムエラーとする
    }
  }

  Widget _buildActionButtons(
      BuildContext context, dynamic details, WidgetRef ref) {
    return Container(
      color: AppColor.background, // フッターの背景色を設定
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0), // 上下のパディングを調整
      child: SafeArea(
        // ノッチなどのセーフエリアを考慮
        child: Column(
          mainAxisSize: MainAxisSize.min, // Columnが子要素のサイズに合わせて最小限のスペースを取るようにする
          children: [
            // Googleマップを開くボタン
            SizedBox(
              width: double.infinity, // 幅を親いっぱいに広げる
              child: ElevatedButton(
                onPressed: () {
                  _launchMap(details.name);
                },
                child: Text('place_detail.open_map'.tr()),
              ),
            ),
            // ウェブサイトURLがある場合のみ表示
            if (details.website != null) ...[
              const SizedBox(height: 8), // ボタン間のスペース
              SizedBox(
                width: double.infinity, // 幅を親いっぱいに広げる
                child: ElevatedButton(
                  onPressed: () => _launchWebsite(details.website!),
                  child: Text('place_detail.website'.tr()),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
