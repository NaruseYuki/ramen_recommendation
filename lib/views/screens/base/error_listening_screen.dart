// lib/views/base/error_listening_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/api/providers/service_providers.dart';

import '../../../errors/app_error_code.dart'; // errorMessageProviderをインポート

abstract class ErrorListeningScreen<T extends ConsumerStatefulWidget> extends ConsumerState<T> {
  @override
  void initState() {
    super.initState();

    // 共通のエラー状態の購読
    ref.listen<AppErrorCode?>(errorMessageProvider, (prev, next) {
      if (next != null) {
        showError('${next.errorCode}\n${next.message}');;
        // エラー表示後にプロバイダーの値をクリア
        ref.read(errorMessageProvider.notifier).state = null;
      }
    });
  }

  // エラー表示の具体的な実装（SnackBarまたはDialog）
  void showError(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('エラー'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}