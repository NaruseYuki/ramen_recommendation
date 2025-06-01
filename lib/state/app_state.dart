// lib/models/app_state.dart
import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:ramen_recommendation/state/ramen_state.dart';
import 'dart:io';
import '../errors/app_error_code.dart';

class AppState {
  final RamenState imageClassificationState;
  final RamenState locationState;
  final RamenState favoritePlacesState;

  AppState({
    required this.imageClassificationState,
    required this.locationState,
    required this.favoritePlacesState,
  });

  factory AppState.initial() {
    return AppState(
      imageClassificationState: RamenState(),
      locationState: RamenState(),
      favoritePlacesState: RamenState(),
    );
  }

  AppState copyWith({
    RamenState? imageClassificationState,
    RamenState? locationState,
    RamenState? favoritePlacesState,
  }) {
    return AppState(
      imageClassificationState: imageClassificationState ?? this.imageClassificationState,
      locationState: locationState ?? this.locationState,
      favoritePlacesState: favoritePlacesState ?? this.favoritePlacesState,
    );
  }
}