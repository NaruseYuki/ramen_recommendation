import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:ramen_recommendation/errors/app_error_code.dart';

import '../../repositories/result.dart';

class CustomInterceptor extends Interceptor {
  static PackageInfo? _packageInfo;
  static String? _androidCertHash;
  static const MethodChannel _platform =
      MethodChannel('ramen_recommendation/android_cert');

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
      appErrorCode = switch (err.type) {
        DioExceptionType.connectionTimeout ||
        DioExceptionType.sendTimeout ||
        DioExceptionType.receiveTimeout =>
          AppErrorCode.commonTimeoutError(),
        DioExceptionType.unknown => AppErrorCode.commonNetworkError(),
        _ => AppErrorCode.commonSystemError(),
      };
    }
    // Failureオブジェクトとしてエラーを伝播
    return handler.resolve(Response(
      requestOptions: err.requestOptions,
      data: Failure(appErrorCode),
      statusCode: err.response?.statusCode ?? 500,
    ));
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    _packageInfo ??= await PackageInfo.fromPlatform();

    if (Platform.isAndroid) {
      options.headers['X-Android-Package'] = _packageInfo?.packageName;
      options.headers['X-Android-Cert'] = await _getAndroidCertHash();
    } else if (Platform.isIOS) {
      options.headers['X-iOS-Package'] = _packageInfo?.packageName;
    }

    super.onRequest(options, handler);
  }

  Future<String> _getAndroidCertHash() async {
    if (_androidCertHash != null) {
      return _androidCertHash!;
    }
    try {
      // ネイティブコードで実装したメソッドを呼び出す
      final String? result = await _platform.invokeMethod('getAndroidCertHash');
      _androidCertHash = result;
      return result ?? '';
    } on PlatformException catch (e) {
      _androidCertHash = '';
      return '';
    }
  }
}
