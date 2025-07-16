// lib/views/screens/favorite_places_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:ramen_recommendation/viewmodels/favorite_places_viewmodel.dart';
import 'package:ramen_recommendation/views/screens/base/error_listening_screen.dart';
import 'package:ramen_recommendation/views/screens/place_detail_screen.dart';
import 'package:easy_localization/easy_localization.dart';

class FavoritePlacesScreen extends ConsumerStatefulWidget {
  const FavoritePlacesScreen({super.key});

  @override
  ConsumerState<FavoritePlacesScreen> createState() =>
      _FavoritePlacesScreenState();
}

// ErrorListeningPageを継承
class _FavoritePlacesScreenState extends ErrorListeningScreen<FavoritePlacesScreen> {
  late FavoritePlacesViewModel favoritePlacesViewModel;

  @override
  void initState() {
    super.initState(); // ErrorListeningPageのinitStateを呼び出す
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
                  // ViewModelでエラーがerrorMessageProviderに設定されるため、ここでは結果のboolean値のみを確認
                  final result = await favoritePlacesViewModel.toggleFavorite(place);
                  if (result) {
                    scaffoldMessenger.showSnackBar(
                      SnackBar(
                        content: Text(
                          isFavorite
                              ? 'favorite.remove_success'.tr()
                              : 'favorite.add_success'.tr(),
                        ),
                      ),
                    );
                  }
                }
            ),
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.green,
                isScrollControlled: true, // 全画面のボトムシートにする場合
                useSafeArea: true, // セーフエリアを考慮する場合
                showDragHandle: true,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: PlaceDetailScreen(placeId: place.id),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}