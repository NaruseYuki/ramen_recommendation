// lib/views/base/error_listening_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/api/providers/service_providers.dart';
import 'package:ramen_recommendation/errors/app_error_code.dart';
abstract class ErrorListeningScreen<T extends ConsumerStatefulWidget> extends ConsumerState<T> {

  @override
  Widget build(BuildContext context) {
    // build メソッド内で ref.listen を使用することで、
    ref.listen<AppErrorCode?>(errorMessageProvider, (prev, next) async {
      if (next != null) {
        await showError(next.toString());
        ref.read(errorMessageProvider.notifier).state = null;
      }
    });

    // この基底クラス自体はUIを表示しないため、空のウィジェットを返します。
    return const SizedBox.shrink();
  }

  Future<void> showError(String message) async {
    await showDialog(
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