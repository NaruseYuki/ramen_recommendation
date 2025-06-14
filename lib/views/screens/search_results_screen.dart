import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:ramen_recommendation/viewmodels/search_results_viewmodel.dart';
import 'package:ramen_recommendation/views/screens/place_detail_screen.dart';

class SearchResultsScreen extends ConsumerStatefulWidget {
  final String ramenType;
  const SearchResultsScreen({super.key, required this.ramenType});

  @override
  ConsumerState<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends ConsumerState<SearchResultsScreen> {
  @override
  void initState() {
    super.initState();
    // 一度だけ初期処理を実行
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(searchResultsViewModelProvider.notifier).searchRamenPlaces(widget.ramenType);
    });
  }

  @override
  Widget build(BuildContext context) {
    final locationState = ref.watch(searchResultsViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('周辺の${widget.ramenType}の検索結果'),
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
            title: Text(place.displayName.text ?? '店舗名がありません'),
            subtitle: Text(place.address ?? '住所情報がありません'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlaceDetailScreen(placeId: place.id),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
