import 'package:ramen_recommendation/errors/error_module.dart';

/// エラーカテゴリを定義するenum
enum ErrorCategory {
  invalid, // 不正な入力
  connection, // 接続エラー
  notFound, // データが見つからない
  undefined, // 未定義
  authentication, // 認証エラー
  input, // 入力値エラー
  network, // ネットワークエラー
  timeout, // タイムアウトエラー
  appPermissionDenied, // アプリ権限が拒否されたエラー
  httpPermission, // http権限エラー
  serviceUnavailable, // サービス利用不可
}

/// エラーコードを管理するクラス
class AppErrorCode {
  final ErrorModule module;
  final ErrorCategory category;
  final int code;

  AppErrorCode(this.module, this.category, this.code);

  String get errorCode =>
      '${module.name.toUpperCase()}-${category.name.toUpperCase()}-${code.toString().padLeft(3, '0')}';

  @override
  String toString() => "$errorCode\n$message" ;

  /// エラーコードに対応するエラーメッセージを取得
  String get message => ErrorMessageManager.getErrorMessage(this);

  /// エラーコードのファクトリーメソッド
  static AppErrorCode commonSystemError() =>
      AppErrorCode(ErrorModule.common, ErrorCategory.undefined, 1);
  static AppErrorCode commonNetworkError() =>
      AppErrorCode(ErrorModule.common, ErrorCategory.network, 2);
  static AppErrorCode commonInvalidParameter() =>
      AppErrorCode(ErrorModule.common, ErrorCategory.invalid, 3);
  static AppErrorCode commonTimeoutError() =>
      AppErrorCode(ErrorModule.common, ErrorCategory.timeout, 4);
  static AppErrorCode commonAuthenticationError() =>
      AppErrorCode(ErrorModule.common, ErrorCategory.authentication, 5);
  static AppErrorCode commonPermissionDenied() =>
      AppErrorCode(ErrorModule.common, ErrorCategory.httpPermission, 6);
  static AppErrorCode commonNotFound() =>
      AppErrorCode(ErrorModule.common, ErrorCategory.notFound, 7);
  static AppErrorCode commonServiceUnavailable() =>
      AppErrorCode(ErrorModule.common, ErrorCategory.serviceUnavailable, 8);
  static AppErrorCode imageInvalidFormat() =>
      AppErrorCode(ErrorModule.image, ErrorCategory.invalid, 1);
  static AppErrorCode imageFileSizeExceeded() =>
      AppErrorCode(ErrorModule.image, ErrorCategory.invalid, 2);
  static AppErrorCode imageUnknownError() =>
      AppErrorCode(ErrorModule.image, ErrorCategory.undefined, 1);
  static AppErrorCode tensorFlowLiteLoadFailed() =>
      AppErrorCode(ErrorModule.tensorFlowLite, ErrorCategory.connection, 1);
  static AppErrorCode tensorFlowLiteInvalidInput() =>
      AppErrorCode(ErrorModule.tensorFlowLite, ErrorCategory.invalid, 1);
  static AppErrorCode tensorFlowLiteUnknownError() =>
      AppErrorCode(ErrorModule.tensorFlowLite, ErrorCategory.undefined, 1);
  static AppErrorCode databaseConnectionFailed() =>
      AppErrorCode(ErrorModule.database, ErrorCategory.connection, 1);
  static AppErrorCode databaseInvalidQuery() =>
      AppErrorCode(ErrorModule.database, ErrorCategory.invalid, 1);
  static AppErrorCode databaseNotFound() =>
      AppErrorCode(ErrorModule.database, ErrorCategory.notFound, 1);
  static AppErrorCode databaseUnknownError() =>
      AppErrorCode(ErrorModule.database, ErrorCategory.undefined, 1);
  static AppErrorCode mapUnknownError() =>
      AppErrorCode(ErrorModule.map, ErrorCategory.undefined, 1);
  static AppErrorCode mapConnectionFailed() =>
      AppErrorCode(ErrorModule.map, ErrorCategory.connection, 1);
  static AppErrorCode mapPermissionDenied() =>
      AppErrorCode(ErrorModule.map, ErrorCategory.appPermissionDenied, 1);
  static AppErrorCode cameraPermissionDenied() =>
      AppErrorCode(ErrorModule.camera, ErrorCategory.appPermissionDenied, 2);
  static AppErrorCode galleryPermissionDenied() =>
      AppErrorCode(ErrorModule.gallery, ErrorCategory.appPermissionDenied, 3);
}

/// エラーメッセージを管理するクラス
class ErrorMessageManager {
  static final Map<String, String> _errorMessageMap = {
    AppErrorCode.commonSystemError().errorCode: 'システムエラーが発生しました。',
    AppErrorCode.commonNetworkError().errorCode: 'ネットワークエラーが発生しました。',
    AppErrorCode.commonInvalidParameter().errorCode: '不正なパラメータが検出されました。',
    AppErrorCode.commonTimeoutError().errorCode: 'アクセスがタイムアウトしました。\nしばらくしてから再度お試しください。',
    AppErrorCode.imageInvalidFormat().errorCode:
        '画像ファイルの形式が不正です。\nサポートされている画像形式（JPEG、PNG）を使用してください。',
    AppErrorCode.imageFileSizeExceeded().errorCode:
        '画像ファイルのサイズが上限を超えています。\nファイルサイズを5MB以下にしてください。',
    AppErrorCode.imageUnknownError().errorCode:
        '画像処理中に不明なエラーが発生しました。\nしばらくしてから再度お試しください。',
    AppErrorCode.tensorFlowLiteLoadFailed().errorCode:
        'TensorFlow Liteモデルのロードに失敗しました。\nアプリを再起動してください。問題が解決しない場合は、アプリを再インストールしてください。',
    AppErrorCode.tensorFlowLiteInvalidInput().errorCode:
        'TensorFlow Liteモデルへの入力が無効です。\nアプリを再起動してください。',
    AppErrorCode.tensorFlowLiteUnknownError().errorCode:
        'TensorFlow Liteモデルの実行中に不明なエラーが発生しました。\nしばらくしてから再度お試しください。',
    AppErrorCode.databaseConnectionFailed().errorCode:
        'データベースへの接続に失敗しました。\nネットワーク接続を確認してください。',
    AppErrorCode.databaseInvalidQuery().errorCode:
        '無効なクエリが送信されました。\nアプリを再起動してください。問題が解決しない場合は、アプリを再インストールしてください。',
    AppErrorCode.databaseNotFound().errorCode:
        '該当するデータが見つかりませんでした。\n条件を変更して再度検索してください。',
    AppErrorCode.databaseUnknownError().errorCode:
        'データベース操作中に不明なエラーが発生しました。\nしばらくしてから再度お試しください。',
    AppErrorCode.mapConnectionFailed().errorCode:
        'Google Maps APIへの接続に失敗しました。\nネットワーク接続を確認してください。',
    AppErrorCode.mapPermissionDenied().errorCode:
        '位置情報の取得が許可されていません。\nアプリの設定で位置情報の利用を許可してください。',
    AppErrorCode.cameraPermissionDenied().errorCode:
        'カメラの使用が許可されていません。\nアプリの設定でカメラの利用を許可してください。',
    AppErrorCode.galleryPermissionDenied().errorCode:
        'ギャラリーの使用が許可されていません。\nアプリの設定でギャラリーの利用を許可してください。',
    AppErrorCode.mapUnknownError().errorCode:
        'お店の情報の取得に失敗しました。\nしばらくしてから再度お試しください。',
    AppErrorCode.commonAuthenticationError().errorCode://強制ログアウト
        '認証エラーが発生しました。\n再度ログインしてください。',
    AppErrorCode.commonPermissionDenied().errorCode:
        'アクセスが拒否されました。\nしばらくしてから再度お試しください。',
    AppErrorCode.commonNotFound().errorCode:
        'ページが見つかりませんでした。\nしばらくしてから再度お試しください。',
    AppErrorCode.commonServiceUnavailable().errorCode:
        'サービスが一時的に利用できません。\nしばらくしてから再度お試しください。',//強制ログアウト
  };

  /// エラーコードに対応するメッセージを取得
  static String getErrorMessage(AppErrorCode errorCode) {
    return _errorMessageMap[errorCode.errorCode] ?? _defaultErrorMessage;
  }

  /// デフォルトのエラーメッセージ
  static String get _defaultErrorMessage => '不明なエラーが発生しました。';
}
