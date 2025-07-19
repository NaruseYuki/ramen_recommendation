// lib/models/ramen_state.dart
// lib/models/ramen_state.dart
import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart'; // Freezedのインポート
import 'package:ramen_recommendation/api/responses/get_place_details_response.dart';

import '../errors/app_error_code.dart';

part 'ramen_state.freezed.dart';

@Freezed(genericArgumentFactories: true) // ジェネリック型を使用するためのアノテーション
abstract class RamenState<T> with _$RamenState<T> {
  const RamenState._(); // プライベートなコンストラクタを定義

  const factory RamenState({
    File? imageFile,
    String? result,
    @Default(false) bool isLoading, // デフォルト値: false
    AppErrorCode? error,
    @Default([]) List<T> places, // デフォルト値: 空のリスト
    @Default({}) Set<String> favoritePlaceIds, // デフォルト値: 空のセット
    @Default({}) Map<String, GetPlaceDetailsResponse> detail, // デフォルト値: 空のマップ
  }) = _RamenState; // プライベートな具象クラス名 (_RamenState) を指定

    RamenState initialize() {
      return RamenState(
        imageFile: null,
        result: null,
        isLoading: false,
        error: null,
        places: [],
        favoritePlaceIds: {},
        detail: {},
      );
  }
}
