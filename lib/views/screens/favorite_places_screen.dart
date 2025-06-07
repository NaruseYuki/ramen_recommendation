// lib/views/screens/favorite_places_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:ramen_recommendation/viewmodels/favorite_places_viewmodel.dart';
import 'package:ramen_recommendation/views/screens/place_detail_screen.dart';

class FavoritePlacesScreen extends ConsumerWidget {
  const FavoritePlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(favoritePlacesViewModelProvider);
    final viewModel = ref.read(favoritePlacesViewModelProvider.notifier);

    // 初回のみロード（buildごとに呼ばれないようFuture.microtaskでラップ）
    Future.microtask(() => viewModel.loadFavoriteShops());

    return Scaffold(
      appBar: AppBar(
        title: const Text('お気に入り店舗'),
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.places.isEmpty
              ? const Center(child: Text('お気に入り店舗はありません'))
              : ListView.builder(
                  itemCount: state.places.length,
                  itemBuilder: (context, index) {
                    final place = state.places[index] as RamenPlace;
                    final isFavorite =
                        state.favoritePlaceIds.contains(place.id);
                    return ListTile(
                      title: Text(place.name),
                      subtitle: Text(place.address),
                      trailing: IconButton(
                        icon: Icon(
                          isFavorite ? Icons.star : Icons.star_border,
                          color: isFavorite ? Colors.amber : null,
                        ),
                        onPressed: () async {
                          await viewModel.toggleFavorite(place);
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PlaceDetailScreen(placeId: place.id),
                          ),
                        );
                      },
                    );
                  },
                ),
    );
  }
}
