import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_photo_request.freezed.dart';
part 'place_photo_request.g.dart';

// Place Photos APIのリクエストパラメータを保持するクラス
@freezed
abstract class PlacePhotoRequest with _$PlacePhotoRequest {
  const factory PlacePhotoRequest(
      {@Default(null) int? maxHeightPx,
      @Default(null) int? maxWidthPx,
      @Default(true) bool skipHttpRedirect}) = _PlacePhotoRequest;

  factory PlacePhotoRequest.fromJson(Map<String, dynamic> json) =>
      _$PlacePhotoRequestFromJson(json);
}
