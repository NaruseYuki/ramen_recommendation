import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ramen_recommendation/errors/app_error_code.dart';

import '../../repositories/result.dart';

class CustomInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final response = err.response;
    AppErrorCode? appErrorCode;

    if (response != null) {
      switch (response.statusCode) {
        case 401:
        // トークンの期限切れ → リフレッシュ or ログアウト
        // TODO: authRepository.refreshToken() や navigationService.logoutUser() の実装
          log("Error: アクセストークンが無効または期限切れです。");
          appErrorCode = AppErrorCode.commonAuthenticationError();
          break;
        case 403:
        // 権限なし
          log("Error: アクセス権限がありません");
          appErrorCode = AppErrorCode.commonPermissionDenied();
          break;
        case 404:
        // リソースが見つからない
          log("Error: リソースが見つかりません");
          appErrorCode = AppErrorCode.commonNotFound();
          break;
        case 500:
        // サーバーエラー
          log("Error: サーバーエラーが発生しました");
          appErrorCode = AppErrorCode.commonSystemError();
          break;
        case 503:
        // サービス利用不可
          log("Error: サービスが一時的に利用できません");
          appErrorCode = AppErrorCode.commonServiceUnavailable();
          break;
        default:
        // その他のエラー
          log("Error: 通信エラーが発生しました: ${response.statusCode}");
          appErrorCode = AppErrorCode.commonNetworkError();
      }
    } else {
      // ネットワーク接続がない、またはリクエストがタイムアウトした場合
      if (err.type == DioExceptionType.connectionTimeout ||
          err.type == DioExceptionType.sendTimeout ||
          err.type == DioExceptionType.receiveTimeout) {
        appErrorCode = AppErrorCode.commonTimeoutError();
      } else if (err.type == DioExceptionType.unknown) {
        appErrorCode = AppErrorCode.commonNetworkError();
      } else {
        appErrorCode = AppErrorCode.commonSystemError();
      }
    }
    // Failureオブジェクトとしてエラーを伝播
    return handler.resolve(Response(
      requestOptions: err.requestOptions,
      data: Failure(appErrorCode),
      statusCode: err.response?.statusCode ?? 500,
    ));
  }
}