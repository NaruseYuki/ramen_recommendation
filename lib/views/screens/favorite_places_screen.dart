// lib/views/screens/favorite_places_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/app_initializer.dart';
import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:ramen_recommendation/viewmodels/favorite_places_viewmodel.dart';
import 'package:ramen_recommendation/viewmodels/location_viewmodel.dart';
import 'package:ramen_recommendation/views/screens/place_detail_screen.dart';

class FavoritePlacesScreen extends ConsumerStatefulWidget {
  final AppInitializer appInitializer;

  const FavoritePlacesScreen({super.key, required this.appInitializer});

  @override
  ConsumerState<FavoritePlacesScreen> createState() =>
      _FavoritePlacesScreenState();
}

class _FavoritePlacesScreenState extends ConsumerState<FavoritePlacesScreen> {
  late final FavoritePlacesViewModel favoritePlacesViewModel;
  late final LocationViewModel locationViewModel;

  @override
  void initState() {
    super.initState();

    // 一度だけ初期化する処理を initState に移動
    favoritePlacesViewModel = ref
        .read(widget.appInitializer.favoritePlacesViewModelProvider.notifier);
    locationViewModel =
        ref.read(widget.appInitializer.locationViewModelProvider.notifier);

    // お気に入りのラーメン店をロード
    _loadFavoriteShops();
  }

  /// お気に入りのラーメン店をロード
  void _loadFavoriteShops() {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    favoritePlacesViewModel.loadFavoriteShops().then((value) {
      if (value == false) {
        scaffoldMessenger.showSnackBar(
          const SnackBar(content: Text('お気に入りのラーメン店の取得に失敗しました')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // 状態を監視
    final favoriteState =
        ref.watch(widget.appInitializer.favoritePlacesViewModelProvider);
    final locationState =
        ref.watch(widget.appInitializer.locationViewModelProvider);

    final List<RamenPlace> favoritePlaces =
        favoriteState.places as List<RamenPlace>;

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context, favoritePlaces),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('お気に入りラーメン'),
    );
  }

  Widget _buildBody(BuildContext context, List<RamenPlace> favoritePlaces) {
    if (favoritePlaces.isEmpty) {
      return const Center(
        child: Text('お気に入りのラーメン店はありません'),
      );
    }

    return ListView.builder(
      itemCount: favoritePlaces.length,
      itemBuilder: (context, index) {
        return _buildPlaceCard(context, favoritePlaces[index]);
      },
    );
  }

  Widget _buildPlaceCard(BuildContext context, RamenPlace ramenPlace) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(ramenPlace.name),
        subtitle: Text(ramenPlace.address),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => favoritePlacesViewModel.toggleFavorite(ramenPlace),
        ),
        onTap: () => _fetchAndNavigateToPlaceDetail(context, ramenPlace),
      ),
    );
  }

  /// 店の詳細情報を取得して詳細画面に遷移
  Future<void> _fetchAndNavigateToPlaceDetail(
      BuildContext context, RamenPlace place) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final navigation = Navigator.of(context);

    try {
      // 店の詳細情報を取得
      final placeDetails = await locationViewModel.fetchPlaceDetails(place.id);

      if (placeDetails != null) {
        // 詳細画面に遷移
        navigation.push(
          MaterialPageRoute(
            builder: (context) => PlaceDetailScreen(
                details: placeDetails, appInitializer: widget.appInitializer),
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
