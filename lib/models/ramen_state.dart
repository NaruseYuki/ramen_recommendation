// lib/models/ramen_state.dart
import 'dart:io';
import 'package:ramen_recommendation/api/responses/get_place_details_response.dart';

import '../errors/app_error_code.dart';

class RamenState<T> {
  File? imageFile;
  String? result;
  bool isLoading;
  AppErrorCode? error;
  List<T> places; // ジェネリクス対応
  Set<String> favoritePlaceIds;
  Map<String, GetPlaceDetailsResponse> detail;

  RamenState(
      {this.imageFile,
      this.result,
      this.isLoading = false,
      this.error,
      this.places = const [],
      this.favoritePlaceIds = const {},
      this.detail = const {}});

  RamenState<T> copyWith({
    File? imageFile,
    String? result,
    bool? isLoading,
    AppErrorCode? error,
    List<T>? places,
    Set<String>? favoritePlaceIds,
    Map<String, GetPlaceDetailsResponse>? detail,
  }) {
    return RamenState<T>(
      imageFile: imageFile ?? this.imageFile,
      result: result ?? this.result,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      places: places ?? this.places,
      favoritePlaceIds: favoritePlaceIds ?? this.favoritePlaceIds,
      detail: detail ?? this.detail,
    );
  }
}
