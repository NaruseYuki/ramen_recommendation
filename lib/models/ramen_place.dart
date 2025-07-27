import 'package:freezed_annotation/freezed_annotation.dart';

part 'ramen_place.freezed.dart';
part 'ramen_place.g.dart'; // JSONシリアライズ/デシリアライズ用に追加

@freezed
abstract class RamenPlace with _$RamenPlace {
  const factory RamenPlace({
    required String id,
    @JsonKey(name: 'displayName') required DisplayName displayName,
    @JsonKey(name: 'formattedAddress') required String address,
    @JsonKey(name: 'location') required Location location,
    @JsonKey(name: 'photos') List<Photo>? photos,
  }) = _RamenPlace;

  factory RamenPlace.fromJson(Map<String, dynamic> json) =>
      _$RamenPlaceFromJson(json);
}

@freezed
abstract class DisplayName with _$DisplayName {
  const factory DisplayName({required String text}) = _DisplayName;

  factory DisplayName.fromJson(Map<String, dynamic> json) =>
      _$DisplayNameFromJson(json);
}

@freezed
abstract class Location with _$Location {
  const factory Location({
    required double latitude,
    required double longitude,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@freezed
abstract class Photo with _$Photo {
  const factory Photo(
      {required String name,
      required int widthPx,
      required int heightPx,
      List<AuthorAttribution>? authorAttributions}) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}

@freezed
abstract class AuthorAttribution with _$AuthorAttribution {
  const factory AuthorAttribution(
      {required String displayName,
      String? uri,
      String? photoUri}) = _AuthorAttribution;

  factory AuthorAttribution.fromJson(Map<String, dynamic> json) =>
      _$AuthorAttributionFromJson(json);
}
