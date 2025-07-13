import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/repositories/implements/places_repository.dart';
import 'package:ramen_recommendation/repositories/interfaces/places_repository_interface.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ramen_recommendation/services/tflite_service.dart';
import 'package:ramen_recommendation/services/image_picker_service.dart';
import 'package:ramen_recommendation/services/database_service.dart';

import '../../errors/app_error_code.dart';
import '../google_places_api_client.dart';
import '../intercepter/custom_interceptor.dart';

part 'service_providers.g.dart';

@riverpod
TFLiteService tfliteService(ref) => TFLiteService();

@riverpod
ImagePickerService imagePickerService(ref) => ImagePickerService();

@riverpod
DatabaseService databaseService(ref) => DatabaseService();

@riverpod
PlacesRepositoryInterface placeDetailsRepository(Ref ref) {
  final dio = Dio();
  dio.interceptors.add(CustomInterceptor());//共通のエラーハンドリング
  return PlacesRepository(GooglePlacesApiClient(dio));
}

final errorMessageProvider = StateProvider<AppErrorCode?>((ref) => null);