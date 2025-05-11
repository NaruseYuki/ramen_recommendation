// lib/views/screens/favorite_places_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/viewmodels/ramen_viewmodel.dart';
import 'package:ramen_recommendation/views/screens/home_screen.dart';
import 'package:ramen_recommendation/views/screens/place_detail_screen.dart'; // 詳細画面

class FavoritePlacesScreen extends ConsumerWidget {
  const FavoritePlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(provider);
    final viewModel = ref.read(provider.notifier);

    final favoritePlaces = state.places
        .where((place) => state.favoritePlaceIds.contains(place['place_id']))
        .toList();

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

  Widget _buildBody(
      BuildContext context, List favoritePlaces, RamenViewModel viewModel) {
    if (favoritePlaces.isEmpty) {
      return const Center(
        child: Text('お気に入りのラーメン店はありません'),
      );
    }

    return ListView.builder(
      itemCount: favoritePlaces.length,
      itemBuilder: (context, index) {
        final place = favoritePlaces[index];
        return _buildPlaceCard(context, place, viewModel);
      },
    );
  }

  Widget _buildPlaceCard(BuildContext context, Map<String, dynamic> place,
      RamenViewModel viewModel) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(place['name']),
        subtitle: Text(place['vicinity'] ?? '住所不明'),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => viewModel.toggleFavorite(place), // お気に入りから削除
        ),
        onTap: () => _navigateToPlaceDetail(context, place),
      ),
    );
  }

  void _navigateToPlaceDetail(
      BuildContext context, Map<String, dynamic> place) {

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => PlaceDetailScreen(details: place), // 詳細画面へ遷移
    //   ),
    //

  }
}
