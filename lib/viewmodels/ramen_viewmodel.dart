// lib/viewmodels/ramen_viewmodel.dart
import 'dart:io';
import 'package:ramen_recommendation/models/requests/get_place_details_request.dart';
import 'package:ramen_recommendation/models/requests/search_ramen_places_request.dart';
import 'package:ramen_recommendation/repositories/interfaces/places_repository_interface.dart';
import 'package:ramen_recommendation/services/image_picker_service.dart';
import 'package:ramen_recommendation/services/tflite_service.dart';
import 'package:ramen_recommendation/services/database_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ramen_recommendation/models/ramen_state.dart';
import '../errors/app_error_code.dart';

part 'ramen_viewmodel.g.dart';

@riverpod
class RamenViewModel extends _$RamenViewModel {
  final _imagePickerService = ImagePickerService();
  final _tfliteService = TFLiteService();
  late DatabaseService _databaseService;

  // PlacesRepositoryInterface を注入
  late final PlacesRepositoryInterface _placesRepository;

  @override
  RamenState build(PlacesRepositoryInterface placesRepository) {
    _placesRepository = placesRepository; // 外部からリポジトリを注入
    _loadFavoriteShops();
    return RamenState();
  }

  set databaseService(DatabaseService service) {
    _databaseService = service;
  }

  /// モデルのロード
  Future<void> loadModel() async {
    try {
      await _tfliteService.loadModel();
    } catch (e) {
      state = state.copyWith(error: e as AppErrorCode);
    }
  }

  /// ギャラリーから画像を選択
  Future<void> pickImageFromGallery() async {
    try {
      final imageFile = await _imagePickerService.pickImageFromGallery();
      if (imageFile != null) {
        state = state.copyWith(imageFile: imageFile);
        classifyImage(imageFile);
      }
    } catch (e) {
      state = state.copyWith(error: e as AppErrorCode);
    }
  }

  /// カメラで画像を撮影
  Future<void> pickImageFromCamera() async {
    try {
      final imageFile = await _imagePickerService.pickImageFromCamera();
      if (imageFile != null) {
        state = state.copyWith(imageFile: imageFile);
        classifyImage(imageFile);
      }
    } catch (e) {
      state = state.copyWith(error: e as AppErrorCode);
    }
  }

  /// 画像分類を実行
  Future<void> classifyImage(File imageFile) async {
    try {
      state = state.copyWith(isLoading: true);
      final result = await _tfliteService.classifyImage(imageFile);
      state = state.copyWith(result: result, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e as AppErrorCode, isLoading: false);
    }
  }

  /// ラーメン店を検索
  Future<bool> searchRamenPlaces() async {
    state = state.copyWith(isLoading: true);
    if (state.result == null) {
      state = state.copyWith(
          error: AppErrorCode.commonInvalidParameter(), isLoading: false);
      return false;
    }

    try {
      final position = await _getCurrentLocation();
      if (position == null) {
        state = state.copyWith(
            error: AppErrorCode.mapPermissionDenied(), isLoading: false);
        return false;
      }

      final places = await _placesRepository.searchRamenPlaces(
          request: SearchRamenPlacesRequest(
              position: position, keyword: state.result ?? ''));
      state = state.copyWith(places: places, isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
          error: AppErrorCode.mapUnknownError(), isLoading: false);
      return false;
    }
  }

  /// 現在地を取得する（Geolocator を使用して実装）
  Future<Position?> _getCurrentLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('位置情報サービスが無効です。設定から有効にしてください。');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('位置情報の権限が拒否されました。');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('位置情報の権限が永久に拒否されています。設定から権限を許可してください。');
    }

    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 10,
        ),
      );
      return position;
    } catch (e) {
      return Future.error('現在地の取得に失敗しました: $e');
    }
  }

  /// お気に入りの状態を更新する
  void toggleFavorite(Map<String, dynamic> place) {
    final placeId = place['id'] as String;
    if (state.favoritePlaceIds.contains(placeId)) {
      _databaseService.removeFavoriteShop(placeId);
      state = state.copyWith(
        favoritePlaceIds: Set.from(state.favoritePlaceIds)..remove(placeId),
      );
    } else {
      _databaseService.addFavoriteShop(place);
      state = state.copyWith(
        favoritePlaceIds: Set.from(state.favoritePlaceIds)..add(placeId),
      );
    }
  }

  /// お気に入りをロードする
  Future<void> _loadFavoriteShops() async {
    try {
      final shops = await _databaseService.getFavoriteShops();
      state = state.copyWith(
        favoritePlaceIds:
            shops.map((shop) => shop['place_id'] as String).toSet(),
      );
    } catch (e) {
      state = state.copyWith(error: AppErrorCode.databaseUnknownError());
    }
  }

  void dispose() {
    _tfliteService.dispose();
  }

  /// Place Details API を呼び出す
  Future<Map<String, dynamic>?> fetchPlaceDetails(String placeId) async {
    try {
      state = state.copyWith(isLoading: true);
      final details = await _placesRepository.getPlaceDetails(
          request: GetPlaceDetailsRequest(placeId: placeId));
      state = state.copyWith(isLoading: false);
      return details;
    } catch (e) {
      state = state.copyWith(
          error: AppErrorCode.mapUnknownError(), isLoading: false);
      return null;
    }
  }
}
