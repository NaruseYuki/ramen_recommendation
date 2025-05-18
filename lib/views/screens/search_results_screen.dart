import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/app_initializer.dart';
import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:ramen_recommendation/viewmodels/location_viewmodel.dart';
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
      LocationViewModel locationViewModel, String placeId) async {
    final scaffold = ScaffoldMessenger.of(context);
    final navigation = Navigator.of(context);

    try {
      final placeDetails = await locationViewModel.fetchPlaceDetails(placeId);
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
    // build メソッド内で locationViewModel を初期化
    final locationViewModel =
        ref.read(appInitializer.locationViewModelProvider.notifier);
    final locationState = ref.watch(appInitializer.locationViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('付近の${ramenType.split(' ')[1]}の検索結果'),
      ),
      body: locationState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : locationState.places.isEmpty
              ? const Center(child: Text('ラーメン店が見つかりませんでした'))
              : ListView.builder(
                  itemCount: locationState.places.length,
                  itemBuilder: (context, index) {
                    final place = locationState.places[index] as RamenPlace;
                    return ListTile(
                      title: Text(place.name),
                      subtitle: Text(place.address),
                      onTap: () => _navigateToPlaceDetails(
                          context, locationViewModel, place.id),
                    );
                  },
                ),
    );
  }
}
