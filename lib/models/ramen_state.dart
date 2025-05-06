// lib/models/ramen_state.dart
import 'dart:io';
import '../errors/app_error_code.dart';

class RamenState {
  File? imageFile;
  String? result;
  bool isLoading;
  AppErrorCode? error;
  List<Map<String, dynamic>> places;
  Set<String> favoritePlaceIds;

  RamenState({
    this.imageFile,
    this.result,
    this.isLoading = false,
    this.error,
    this.places = const [],
    this.favoritePlaceIds = const {},
  });

  RamenState copyWith({
    File? imageFile,
    String? result,
    bool? isLoading,
    AppErrorCode? error,
    List<Map<String, dynamic>>? places,
    Set<String>? favoritePlaceIds,
  }) {
    return RamenState(
      imageFile: imageFile ?? this.imageFile,
      result: result ?? this.result,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      places: places ?? this.places,
      favoritePlaceIds: favoritePlaceIds ?? this.favoritePlaceIds,
    );
  }
}