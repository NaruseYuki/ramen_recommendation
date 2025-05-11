// lib/views/screens/favorite_places_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:ramen_recommendation/viewmodels/ramen_viewmodel.dart';
import 'package:ramen_recommendation/views/screens/home_screen.dart';
import 'package:ramen_recommendation/views/screens/place_detail_screen.dart'; // 詳細画面

class FavoritePlacesScreen extends ConsumerWidget {
  const FavoritePlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(provider);
    final viewModel = ref.read(provider.notifier);
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    viewModel.loadFavoriteShops().then(
        //失敗時はスナックバーを表示
        (value) {
      if (value == false) {
        scaffoldMessenger.showSnackBar(
          const SnackBar(content: Text('お気に入りのラーメン店の取得に失敗しました')),
        );
      }
    });

    final List<RamenPlace> favoritePlaces = state.places as List<RamenPlace>;

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context, favoritePlaces, viewModel),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('お気に入りラーメン'),
    );
  }

  Widget _buildBody(BuildContext context, List<RamenPlace> favoritePlaces,
      RamenViewModel viewModel) {
    if (favoritePlaces.isEmpty) {
      return const Center(
        child: Text('お気に入りのラーメン店はありません'),
      );
    }

    return ListView.builder(
      itemCount: favoritePlaces.length,
      itemBuilder: (context, index) {
        return _buildPlaceCard(context, favoritePlaces[index], viewModel);
      },
    );
  }

  Widget _buildPlaceCard(
      BuildContext context, RamenPlace ramenPlace, RamenViewModel viewModel) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(ramenPlace.name),
        subtitle: Text(ramenPlace.address),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => viewModel.toggleFavorite(ramenPlace), // お気に入りから削除
        ),
        onTap: () =>
            _fetchAndNavigateToPlaceDetail(context, ramenPlace, viewModel),
      ),
    );
  }

  /// 店の詳細情報を取得して詳細画面に遷移
  Future<void> _fetchAndNavigateToPlaceDetail(
      BuildContext context, RamenPlace place, RamenViewModel viewModel) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final navigation = Navigator.of(context);

    try {
      // 店の詳細情報を取得
      final placeDetails = await viewModel.fetchPlaceDetails(place.id);

      if (placeDetails != null) {
        // 詳細画面に遷移
        navigation.push(
          MaterialPageRoute(
            builder: (context) => PlaceDetailScreen(details: placeDetails),
          ),
        );
      } else {
        // 詳細情報が取得できなかった場合
        scaffoldMessenger.showSnackBar(
          const SnackBar(content: Text('詳細情報の取得に失敗しました')),
        );
      }
    } catch (e) {
      // エラーが発生した場合
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('エラーが発生しました')),
      );
    }
  }
}
