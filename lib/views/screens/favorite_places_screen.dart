// lib/views/screens/favorite_places_screen.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/models/ramen_place.dart' show RamenPlace;
import 'package:ramen_recommendation/viewmodels/favorite_places_viewmodel.dart';
import 'package:ramen_recommendation/views/screens/base/common/loading.dart';
import 'package:ramen_recommendation/views/screens/base/error_listening_screen.dart';

import 'base/common/custom_list_view.dart';

class FavoritePlacesScreen extends ConsumerStatefulWidget {
  const FavoritePlacesScreen({super.key});

  @override
  ConsumerState<FavoritePlacesScreen> createState() =>
      _FavoritePlacesScreenState();
}

// ErrorListeningPageを継承
class _FavoritePlacesScreenState extends ConsumerState<FavoritePlacesScreen>
    with ErrorListeningMixin<FavoritePlacesScreen>, WidgetsBindingObserver {
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
    setupErrorListener(ref);
    final state = ref.watch(favoritePlacesViewModelProvider);

    return Scaffold(
        backgroundColor: Colors.white,
        body: state.isLoading
            ? LoadingWidget()
            : state.places.isEmpty
                ? Center(child: Text('favorite.empty'.tr()))
                : customListView(state, (RamenPlace place) {
                    ref
                        .read(favoritePlacesViewModelProvider.notifier)
                        .toggleFavorite(place);
                  }));
  }
}
