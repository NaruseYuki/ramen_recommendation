import 'package:ramen_recommendation/services/image_picker_service.dart';
import 'package:ramen_recommendation/services/tflite_service.dart';
import 'package:ramen_recommendation/api/google_places_api_client.dart';
import 'package:ramen_recommendation/repositories/implements/places_repository.dart';
import 'package:ramen_recommendation/services/database_service.dart';
import 'package:ramen_recommendation/viewmodels/favorite_places_viewmodel.dart';
import 'package:ramen_recommendation/viewmodels/image_classification_viewmodel.dart';
import 'package:ramen_recommendation/viewmodels/location_viewmodel.dart';

class AppInitializer {
  final TFLiteService tfliteService;
  final ImagePickerService imagePickerService;
  final GooglePlacesApiClient googlePlacesApiClient;
  final PlacesRepository placesRepository;
  final DatabaseService databaseService;

  late final ImageClassificationViewModelProvider
      imageClassificationViewModelProvider;
  late final LocationViewModelProvider locationViewModelProvider;
  late final FavoritePlacesViewModelProvider favoritePlacesViewModelProvider;

  AppInitializer({
    required this.tfliteService,
    required this.imagePickerService,
    required this.googlePlacesApiClient,
    required this.placesRepository,
    required this.databaseService,
  });

  /// アプリの初期化処理
  Future<void> initialize() async {
    // モデルのロード
    await tfliteService.loadModel();

    // ViewModel の初期化
    imageClassificationViewModelProvider =
        ImageClassificationViewModelProvider(tfliteService, imagePickerService);
    locationViewModelProvider = LocationViewModelProvider(placesRepository);
    favoritePlacesViewModelProvider =
        FavoritePlacesViewModelProvider(databaseService);
  }
}
