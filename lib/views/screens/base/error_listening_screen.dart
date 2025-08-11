import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_recommendation/api/providers/service_providers.dart';
import 'package:ramen_recommendation/errors/app_error_code.dart';

bool _hasSetupListener = false;

mixin ErrorListeningMixin<T extends ConsumerStatefulWidget>
    on ConsumerState<T> {
  void setupErrorListener(WidgetRef ref) {
    if (_hasSetupListener) return;
    _hasSetupListener = true;

    ref.listenManual<AppErrorCode?>(
      errorMessageProvider,
      (prev, next) async {
        if (next != null && context.mounted) {
          await showError(context, next.toString());
        }
      },
    );
  }

  Future<void> showError(BuildContext context, String message) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
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
