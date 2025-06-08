import 'package:ramen_recommendation/api/google_places_api_client.dart';
import 'package:ramen_recommendation/repositories/implements/places_repository.dart';
import 'package:ramen_recommendation/repositories/interfaces/places_repository_interface.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ramen_recommendation/services/tflite_service.dart';
import 'package:ramen_recommendation/services/image_picker_service.dart';
import 'package:ramen_recommendation/services/database_service.dart';

part 'service_providers.g.dart';

@riverpod
TFLiteService tfliteService(ref) => TFLiteService();

@riverpod
ImagePickerService imagePickerService(ref) => ImagePickerService();

@riverpod
DatabaseService databaseService(ref) => DatabaseService();

@riverpod
GooglePlacesApiClient googlePlacesApiClient(ref) =>
    GooglePlacesApiClient();

@riverpod
PlacesRepositoryInterface placeDetailsRepository(ref) =>
    PlacesRepository(ref.watch(googlePlacesApiClientProvider));
