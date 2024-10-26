import 'dart:async';

import 'package:logger/logger.dart';

Future<T> useCaseExceptionLogger<T>({
  required Logger logger,
  required Future<T> Function() action,
  FutureOr<T> Function(Object e, StackTrace s)? onError,
}) async {
  try {
    return await action();
  } catch (e, s) {
    if (onError != null) {
      return await onError(e, s);
    }
    logger.e(
      'Failed to execute use case',
      error: e,
      stackTrace: s,
    );
    rethrow;
  }
}

void main() async {
  var logger = Logger(); // Loggerのインスタンス生成

  await useCaseExceptionLogger<int>(
    logger: logger,
    action: () async {
      // エラーを発生させるサンプルアクション
      throw Exception('Sample exception');
    },
    onError: (e, s) async {
      logger.w('Handled error: $e');
      return -1; // エラー時に返す値
    },
  );
}
