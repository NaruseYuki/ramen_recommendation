import 'package:freezed_annotation/freezed_annotation.dart';

part 'ramen_place.freezed.dart';
part 'ramen_place.g.dart'; // JSONシリアライズ/デシリアライズ用に追加


@freezed
abstract class RamenPlace with _$RamenPlace {
  const factory RamenPlace({
    required String id,
    required String name,
    required String address,
    required double latitude,
    required double longitude,
  }) = _RamenPlace;
  factory RamenPlace.fromJson(Map<String, dynamic> json) => _$RamenPlaceFromJson(json);
}