import 'package:freezed_annotation/freezed_annotation.dart';

part 'ramen_place.freezed.dart';
part 'ramen_place.g.dart'; // JSONシリアライズ/デシリアライズ用に追加


@freezed
abstract class RamenPlace with _$RamenPlace {
  const factory RamenPlace({
    required String id,
    @JsonKey(name:'displayName') required DisplayName displayName,
    @JsonKey(name:'formattedAddress')required String address,
    @JsonKey(name:'location') required Location location,
  }) = _RamenPlace;
  factory RamenPlace.fromJson(Map<String, dynamic> json) => _$RamenPlaceFromJson(json);
}

@freezed
abstract  class DisplayName with _$DisplayName {
  const factory DisplayName({
    required String text
  }) = _DisplayName;

  factory DisplayName.fromJson(Map<String, dynamic> json) => _$DisplayNameFromJson(json);
}

@freezed
abstract class Location with _$Location {
  const factory Location({
    required double latitude,
    required double longitude,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}
