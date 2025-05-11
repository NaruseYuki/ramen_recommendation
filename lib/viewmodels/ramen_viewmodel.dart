// lib/viewmodels/ramen_viewmodel.dart
import 'package:ramen_recommendation/api/responses/get_place_details_response.dart';
import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:ramen_recommendation/viewmodels/image_classification_viewmodel.dart';
import 'package:ramen_recommendation/viewmodels/favorite_places_viewmodel.dart';
import 'package:ramen_recommendation/viewmodels/location_viewmodel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

@riverpod
class RamenViewModel {
  final ImageClassificationViewModel _imageClassificationViewModel;
  final FavoritePlacesViewModel _favoritePlacesViewModel;
  final LocationViewModel _locationViewModel;

  RamenViewModel(
    this._imageClassificationViewModel,
    this._favoritePlacesViewModel,
    this._locationViewModel,
  );

  /// ギャラリーから画像を選択
  Future<void> pickImageFromGallery() async {
    await _imageClassificationViewModel.pickImageFromGallery();
  }

  /// カメラで画像を撮影
  Future<void> pickImageFromCamera() async {
    await _imageClassificationViewModel.pickImageFromCamera();
  }

  /// お気に入りの状態を更新
  void toggleFavorite(RamenPlace place) {
    _favoritePlacesViewModel.toggleFavorite(place);
  }

  /// お気に入りをロード
  Future<void> loadFavoriteShops() async {
    await _favoritePlacesViewModel.loadFavoriteShops();
  }

  /// 現在地を取得
  Future<void> getCurrentLocation() async {
    await _locationViewModel.getCurrentLocation();
  }

  /// ラーメン店を検索
  Future<bool> searchRamenPlaces(String keyword) async {
    return await _locationViewModel.searchRamenPlaces(keyword);
  }

  /// Place Details API を呼び出す
  Future<GetPlaceDetailsResponse?> fetchPlaceDetails(String placeId) async {
    return await _locationViewModel.fetchPlaceDetails(placeId);
  }
}
