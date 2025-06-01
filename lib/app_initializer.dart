// lib/app_initializer.dart
import 'package:ramen_recommendation/services/image_picker_service.dart';
import 'package:ramen_recommendation/services/tflite_service.dart';
import 'package:ramen_recommendation/api/google_places_api_client.dart';
import 'package:ramen_recommendation/repositories/implements/places_repository.dart';
import 'package:ramen_recommendation/services/database_service.dart';
import 'package:ramen_recommendation/viewmodels/favorite_places_viewmodel.dart';
import 'package:ramen_recommendation/viewmodels/image_classification_viewmodel.dart';
import 'package:ramen_recommendation/viewmodels/location_viewmodel.dart';
import 'package:ramen_recommendation/viewmodels/app_viewmodel.dart'; // AppViewModelをインポート

class AppInitializer {
  final TFLiteService tfliteService;
  final ImagePickerService imagePickerService;
  final GooglePlacesApiClient googlePlacesApiClient;
  final PlacesRepository placesRepository;
  final DatabaseService databaseService;

  late final AppViewModelProvider appViewModelProvider; // AppViewModelProviderを使用

  AppInitializer({
    required this.tfliteService,
    required this.imagePickerService,
    required this.googlePlacesApiClient,
    required this.placesRepository,
    required this.databaseService,
  });

  /// アプリの初期化処理
  Future<void> initialize() async {
    // ViewModel の初期化
    // 各ViewModelのProviderオブジェクトを生成
    final imageClassificationProvider = ImageClassificationViewModelProvider(tfliteService, imagePickerService);
    final locationProvider = LocationViewModelProvider(placesRepository);
    final favoritePlacesProvider = FavoritePlacesViewModelProvider(databaseService);

    // AppViewModelProviderに各Providerオブジェクトを渡す
    appViewModelProvider = AppViewModelProvider(
      imageClassificationProvider,
      locationProvider,
      favoritePlacesProvider,
    );

    // モデルのロード
    await tfliteService.loadModel();
  }
}