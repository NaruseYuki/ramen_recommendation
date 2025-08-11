// lib/viewmodels/favorite_places_viewmodel.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/api/providers/service_providers.dart';
import 'package:ramen_recommendation/errors/app_error_code.dart';
import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:ramen_recommendation/models/ramen_state.dart';
import 'package:ramen_recommendation/repositories/implements/database_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/result.dart';

part 'favorite_places_viewmodel.g.dart';

@riverpod
class FavoritePlacesViewModel extends _$FavoritePlacesViewModel {
  late final DatabaseService _databaseService;
  late final StateController<AppErrorCode?> _errorMessageController;

  @override
  RamenState build() {
    _databaseService = ref.watch(databaseServiceProvider);
    _errorMessageController = ref.read(errorMessageProvider.notifier);
    return RamenState();
  }

  /// お気に入り店舗一覧をロード
  Future<void> loadFavoriteShops() async {
    state = state.copyWith(isLoading: true);
    final result = await _databaseService.getFavorites();
    if (result is Success<List<RamenPlace>, AppErrorCode>) {
      // 成功した場合
      state = state.copyWith(
        isLoading: false,
        favoritePlaceIds: result.value.map((shop) => shop.id).toSet(),
        places: result.value,
      );
    } else if (result is Failure<List<RamenPlace>, AppErrorCode>) {
      // 失敗した場合
      state = state.copyWith(
        isLoading: false,
      );
      _errorMessageController.state = result.exception;
    } else {
      // 予期せぬ結果の場合
      state = state.copyWith(
        isLoading: false,
      );
      _errorMessageController.state = AppErrorCode.commonSystemError();
    }
  }

  /// お気に入り追加・削除
  Future<bool> toggleFavorite(RamenPlace place) async {
    final placeId = place.id;
    Result<bool, AppErrorCode> dbResult;

    if (state.favoritePlaceIds.contains(placeId)) {
      // 既にお気に入りであれば削除
      dbResult = await _databaseService.removeFavorite(placeId);
    } else {
      // お気に入りでなければ追加
      dbResult = await _databaseService.addFavorite(place);
    }
    if (dbResult is Success<bool, AppErrorCode>) {
      if (dbResult.value) {
        // DB操作が成功した場合、stateを更新
        if (state.favoritePlaceIds.contains(placeId)) {
          state = state.copyWith(
            favoritePlaceIds: Set.from(state.favoritePlaceIds)..remove(placeId),
          );
        } else {
          state = state.copyWith(
            favoritePlaceIds: Set.from(state.favoritePlaceIds)..add(placeId),
          );
        }
        return true;
      } else {
        // DB操作自体は成功したが、変更がなかった場合（例えば削除対象が見つからなかった場合など）
        _errorMessageController.state = AppErrorCode.databaseUnknownError();
        return false;
      }
    } else if (dbResult is Failure<bool, AppErrorCode>) {
      // DB操作が失敗した場合
      _errorMessageController.state = dbResult.exception;
      return false;
    } else {
      // 予期せぬ結果の場合
      _errorMessageController.state = AppErrorCode.commonSystemError();
      return false;
    }
  }
}
