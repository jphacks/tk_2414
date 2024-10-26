import 'dart:developer' as developer;
import 'dart:io';

import 'package:fair_edu_mobile/domain/model/exception/exception.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final loggerDefaultOutput = ConsoleOutput();
final loggerDefaultPrinter = CustomLoggerPrinter();

/// Extends 'LogOutput' to correctly display console colors on macOS systems.
///
/// The behavior is determined by the application's run mode (Release or Debug)
/// and the operating platform (iOS or non-iOS).
class ConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    if (!kDebugMode) return;
    if (!Platform.isIOS) {
      event.lines.forEach(debugPrint);
    } else {
      event.lines.forEach(developer.log);
    }
  }
}

class CustomLoggerPrinter extends PrettyPrinter {
  CustomLoggerPrinter({
    String? debugLabel,
    Map<String, dynamic>? meta,
    super.dateTimeFormat = DateTimeFormat.none,
    super.methodCount = 0,
    super.errorMethodCount = 6,
    super.noBoxingByDefault = true,
    super.printEmojis = false,
    super.excludeBox = const {
      Level.fatal: false,
    },
  })  : _meta = meta,
        _debugLabel = debugLabel;

  final String? _debugLabel;
  final Map<String, dynamic>? _meta;

  @override
  List<String> log(LogEvent event) {
    final originalMessage = stringifyMessage(event.message);

    final logMessages = (_debugLabel == null
            ? [originalMessage]
            : [originalMessage].map((log) => '[$_debugLabel] $log').toList())
        .join('\n');
    return super.log(
      LogEvent(
        event.level,
        logMessages,
        time: event.time,
        error: event.error,
        stackTrace: event.stackTrace,
      ),
    );
  }
}

class CustomLogger extends Logger {
  CustomLogger({
    super.filter,
    super.level,
    LogOutput? output,
    LogPrinter? printer,
    String? debugLabel,
    Map<String, dynamic>? meta,
  })  : _debugLabel = debugLabel,
        _meta = meta,
        super(
          output: output ?? loggerDefaultOutput,
          printer: printer ??
              CustomLoggerPrinter(
                debugLabel: debugLabel,
                meta: meta,
              ),
        );

  final String? _debugLabel;
  final Map<String, dynamic>? _meta;

  @override
  void log(
    Level level,
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    final information = <String>[
      'level: ${level.name}',
      if (_debugLabel != null) 'label: $_debugLabel',
      if (_meta != null && _meta.isNotEmpty)
        for (final entry in _meta.entries) '${entry.key}: ${entry.value}',
      'message: $message',
    ];

    // ログを標準出力に出力
    if (level >= Level.warning) {
      if (error != null && stackTrace != null) {
        developer.log(
          'Error: $error\nStackTrace: $stackTrace\nDetails: ${information.join('\n')}',
          level: level.index,
        );
      } else {
        developer.log(
          'Message: $message\nDetails: ${information.join('\n')}',
          level: level.index,
        );
      }
    }

    super.log(level, message, time: time, error: error, stackTrace: stackTrace);
  }
}

extension on Level {
  bool operator >=(Level other) => value >= other.value;
}

extension LoggerEx on Logger {
  void exception(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    final isFatal = error is! BaseException || error.isFatal;
    log(
      isFatal ? Level.error : Level.warning,
      message,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
