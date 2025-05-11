import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:ramen_recommendation/views/screens/home_screen.dart';
import 'package:ramen_recommendation/views/screens/place_detail_screen.dart';

class SearchResultsScreen extends ConsumerWidget {
  final String ramenType;

  const SearchResultsScreen({super.key, required this.ramenType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(provider);
    final viewModel = ref.read(provider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('付近の${ramenType.split(' ')[1]}の検索結果'),
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.places.isEmpty
              ? const Center(child: Text('ラーメン店が見つかりませんでした'))
              : ListView.builder(
                  itemCount: state.places.length,
                  itemBuilder: (context, index) {
                    final place = state.places[index] as RamenPlace;
                    return ListTile(
                        title: Text(place.name),
                        subtitle: Text(place.address),
                        onTap: () async {
                          final placeId = place.id;
                          final navigation = Navigator.of(context);
                          final scaffold = ScaffoldMessenger.of(context);
                          // 非同期処理を実行
                          final placeDetails =
                              await viewModel.fetchPlaceDetails(placeId);
                          // 詳細情報を取得したら画面遷移
                          if (placeDetails != null) {
                            final route = MaterialPageRoute(
                              builder: (context) =>
                                  PlaceDetailScreen(details: placeDetails),
                            );
                            navigation.push(route);
                          } else {
                            scaffold.showSnackBar(
                              const SnackBar(content: Text('詳細情報の取得に失敗しました')),
                            );
                          }
                        });
                  },
                ),
    );
  }
}
