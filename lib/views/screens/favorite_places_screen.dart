// lib/views/screens/favorite_places_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:ramen_recommendation/viewmodels/favorite_places_viewmodel.dart';
import 'package:ramen_recommendation/views/screens/place_detail_screen.dart';
import 'package:easy_localization/easy_localization.dart';

class FavoritePlacesScreen extends ConsumerStatefulWidget {
  const FavoritePlacesScreen({super.key});

  @override
  ConsumerState<FavoritePlacesScreen> createState() =>
      _FavoritePlacesScreenState();
}

class _FavoritePlacesScreenState extends ConsumerState<FavoritePlacesScreen> {
  late FavoritePlacesViewModel favoritePlacesViewModel;

  @override
  void initState() {
    super.initState();
    // 初回のみ呼び出す
    WidgetsBinding.instance.addPostFrameCallback((_) {
      favoritePlacesViewModel =
          ref.read(favoritePlacesViewModelProvider.notifier);
      ref.read(favoritePlacesViewModelProvider.notifier).loadFavoriteShops();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(favoritePlacesViewModelProvider);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('favorite.title'.tr()),
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.places.isEmpty
              ? Center(child: Text('favorite.empty'.tr()))
              : ListView.builder(
                  itemCount: state.places.length,
                  itemBuilder: (context, index) {
                    final place = state.places[index] as RamenPlace;
                    final isFavorite =
                        state.favoritePlaceIds.contains(place.id);
                    return ListTile(
                      title: Text(place.displayName.text),
                      subtitle: Text(place.address ),
                      trailing: IconButton(
                        icon: Icon(
                          isFavorite ? Icons.star : Icons.star_border,
                          color: isFavorite ? Colors.amber : null,
                        ),
                        onPressed: () async {
                          final result = await favoritePlacesViewModel.toggleFavorite(place);
                          scaffoldMessenger.showSnackBar(
                            SnackBar(
                              content: Text(
                                result
                                    ? (isFavorite
                                    ? 'favorite.remove_success'.tr()
                                    : 'favorite.add_success'.tr())
                                    : 'favorite.update_failed'.tr(),
                              ),
                            ),
                          );
                        }
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
