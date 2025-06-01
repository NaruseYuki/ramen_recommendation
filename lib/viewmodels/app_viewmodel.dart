// lib/viewmodels/app_viewmodel.dart
import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:ramen_recommendation/viewmodels/favorite_places_viewmodel.dart';
import 'package:ramen_recommendation/viewmodels/image_classification_viewmodel.dart';
import 'package:ramen_recommendation/viewmodels/location_viewmodel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:io';
import 'package:ramen_recommendation/api/responses/get_place_details_response.dart';

import '../state/app_state.dart';
import '../state/ramen_state.dart'; // RamenStateをインポート

part 'app_viewmodel.g.dart';

@riverpod
class AppViewModel extends _$AppViewModel {
  late final ImageClassificationViewModelProvider _imageClassificationProvider;
  late final LocationViewModelProvider _locationProvider;
  late final FavoritePlacesViewModelProvider _favoritePlacesProvider;

  late ImageClassificationViewModel _imageClassificationViewModel;
  late LocationViewModel _locationViewModel;
  late FavoritePlacesViewModel _favoritePlacesViewModel;

  @override
  AppState build(
      ImageClassificationViewModelProvider imageClassificationProvider,
      LocationViewModelProvider locationProvider,
      FavoritePlacesViewModelProvider favoritePlacesProvider,
      ) {
    _imageClassificationProvider = imageClassificationProvider;
    _locationProvider = locationProvider;
    _favoritePlacesProvider = favoritePlacesProvider;

    _imageClassificationViewModel = ref.read(_imageClassificationProvider.notifier);
    _locationViewModel = ref.read(_locationProvider.notifier);
    _favoritePlacesViewModel = ref.read(_favoritePlacesProvider.notifier);

    final RamenState imageClassificationState = _imageClassificationViewModel.state;
    final RamenState locationState = _locationViewModel.state;
    final RamenState favoritePlacesState = _favoritePlacesViewModel.state;

    return AppState(
      imageClassificationState: imageClassificationState,
      locationState: locationState,
      favoritePlacesState: favoritePlacesState,
    );
  }

  // --- 画像分類関連メソッド ---
  Future<void> loadModel() async {
    await _imageClassificationViewModel.loadModel();
    _updateImageClassificationState();
  }

  Future<void> pickImageFromGallery() async {
    await _imageClassificationViewModel.pickImageFromGallery();
    _updateImageClassificationState();
  }

  Future<void> pickImageFromCamera() async {
    await _imageClassificationViewModel.pickImageFromCamera();
    _updateImageClassificationState();
  }

  Future<void> classifyImage(File imageFile) async {
    await _imageClassificationViewModel.classifyImage(imageFile);
    _updateImageClassificationState();
  }

  void _updateImageClassificationState() {
    state = state.copyWith(imageClassificationState: _imageClassificationViewModel.state);
  }

  // --- 位置情報関連メソッド ---
  Future<bool> searchRamenPlaces(String keyword) async {
    final result = await _locationViewModel.searchRamenPlaces(keyword);
    _updateLocationState();
    return result;
  }

  Future<GetPlaceDetailsResponse?> fetchPlaceDetails(String placeId) async {
    final details = await _locationViewModel.fetchPlaceDetails(placeId);
    _updateLocationState();
    return details;
  }

  void _updateLocationState() {
    state = state.copyWith(locationState: _locationViewModel.state);
  }

  // --- お気に入り関連メソッド ---
  Future<bool> toggleFavorite(RamenPlace place) async {
    final result = await _favoritePlacesViewModel.toggleFavorite(place);
    _updateFavoritePlacesState();
    return result;
  }

  Future<bool> loadFavoriteShops() async {
    final result = await _favoritePlacesViewModel.loadFavoriteShops();
    _updateFavoritePlacesState();
    return result;
  }

  void _updateFavoritePlacesState() {
    state = state.copyWith(favoritePlacesState: _favoritePlacesViewModel.state);
  }
}