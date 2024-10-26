import 'dart:async';

import 'package:fair_edu_mobile/helper/logger.dart';
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
    logger.exception(
      'Failed to execute use case',
      error: e,
      stackTrace: s,
    );
    rethrow;
  }
}
