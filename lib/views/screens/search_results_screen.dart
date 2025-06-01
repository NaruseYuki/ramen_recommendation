import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/app_initializer.dart';
import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:ramen_recommendation/viewmodels/app_viewmodel.dart'; // AppViewModelをインポート
import 'package:ramen_recommendation/views/screens/place_detail_screen.dart';

class SearchResultsScreen extends ConsumerWidget {
  final String ramenType;
  final AppInitializer appInitializer;

  const SearchResultsScreen({
    super.key,
    required this.ramenType,
    required this.appInitializer,
  });

  /// ラーメン店の詳細情報を取得して画面遷移
  Future<void> _navigateToPlaceDetails(BuildContext context,
      AppViewModel appViewModel, String placeId) async { // AppViewModelを使用
    final scaffold = ScaffoldMessenger.of(context);
    final navigation = Navigator.of(context);

    try {
      final placeDetails = await appViewModel.fetchPlaceDetails(placeId); // AppViewModel経由で呼び出し
      if (placeDetails != null) {
        navigation.push(
          MaterialPageRoute(
            builder: (context) => PlaceDetailScreen(
              details: placeDetails,
              appInitializer: appInitializer,
            ),
          ),
        );
      } else {
        scaffold.showSnackBar(
          const SnackBar(content: Text('詳細情報の取得に失敗しました')),
        );
      }
    } catch (e) {
      scaffold.showSnackBar(
        const SnackBar(content: Text('エラーが発生しました')),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 結合された状態を監視
    final appViewModel = ref.read(appInitializer.appViewModelProvider.notifier); // AppViewModelを取得
    final appState = ref.watch(appInitializer.appViewModelProvider);
    final locationState = appState.locationState; // 個々の状態にアクセス

    return Scaffold(
        appBar: AppBar(
          title: Text('周辺の$ramenTypeの検索結果'),
        ),
        body: locationState.isLoading
            ? const Center(child: CircularProgressIndicator())
            : locationState.places.isEmpty
            ? const Center(child: Text('ラーメン店が見つかりませんでした'))
            : ListView.builder(
          itemCount: locationState.places.length,
          itemBuilder: (context, index) {
            final place = locationState.places[index];
            return ListTile(
              title: Text(place.name),
              subtitle: Text(place.address),
              onTap: () => _navigateToPlaceDetails(
                  context, appViewModel, place.id), // AppViewModelを渡す
            );
          },
        )
    );
  }
}