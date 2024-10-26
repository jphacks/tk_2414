// import 'dart:developer' as developer;
// import 'dart:io';


// import 'package:flutter/foundation.dart';


// final loggerDefaultOutput = ConsoleOutput();
// final loggerDefaultPrinter = CustomLoggerPrinter();

// /// Extends 'LogOutput' to correctly display console colors on macOS systems.
// ///
// /// The behavior is determined by the application's run mode (Release or Debug)
// /// and the operating platform (iOS or non-iOS).
// ///
// /// For more information, see: https://github.com/simc/logger/issues/1#issuecomment-1582076726
// class ConsoleOutput extends LogOutput {
//   @override
//   void output(OutputEvent event) {
//     if (!kDebugMode) return;
//     if (!Platform.isIOS) {
//       event.lines.forEach(debugPrint);
//     } else {
//       event.lines.forEach(developer.log);
//     }
//   }
// }

// class CustomLoggerPrinter extends PrettyPrinter {
//   CustomLoggerPrinter({
//     String? debugLabel,
//     Map<String, dynamic>? meta,
//     super.dateTimeFormat = DateTimeFormat.none,
//     super.methodCount = 0,
//     super.errorMethodCount = 6,
//     super.noBoxingByDefault = true,
//     super.printEmojis = false,
//     super.excludeBox = const {
//       Level.fatal: false,
//     },
//   })  : _meta = meta,
//         _debugLabel = debugLabel;

//   final String? _debugLabel;
//   // ignore: unused_field
//   final Map<String, dynamic>? _meta;

//   @override
//   List<String> log(LogEvent event) {
//     final originalMessage = stringifyMessage(event.message);

//     final logMessages = (_debugLabel == null
//             ? [originalMessage]
//             : [originalMessage].map((log) => '[$_debugLabel] $log').toList())
//         .join('\n');
//     return super.log(
//       LogEvent(
//         event.level,
//         logMessages,
//         time: event.time,
//         error: event.error,
//         stackTrace: event.stackTrace,
//       ),
//     );
//   }
// }

// class CustomLogger extends Logger {
//   CustomLogger({
//     super.filter,
//     super.level,
//     LogOutput? output,
//     LogPrinter? printer,
//     String? debugLabel,
//     Map<String, dynamic>? meta,
//   })  : _debugLabel = debugLabel,
//         _meta = meta,
//         super(
//           output: output ?? loggerDefaultOutput,
//           printer: printer ??
//               CustomLoggerPrinter(
//                 debugLabel: debugLabel,
//                 meta: meta,
//               ),
//         );

//   // ignore: unused_field
//   final String? _debugLabel;
//   // ignore: unused_field
//   final Map<String, dynamic>? _meta;

//   @override
//   void log(
//     Level level,
//     dynamic message, {
//     DateTime? time,
//     Object? error,
//     StackTrace? stackTrace,
//   }) {
//     final information = <String>[
//       'level: ${level.name}',
//       if (_debugLabel != null) 'label: $_debugLabel',
//       if (_meta != null && _meta.isNotEmpty)
//         for (final entry in _meta.entries) '${entry.key}: ${entry.value}',
//       'message: $message',
//     ];
//     try {
//       if (level >= Level.warning) {
//         // Firebase が初期化されていない場合は何もしない
//         if (Firebase.apps.isEmpty) return;
//         final isCrash = level >= Level.error;
//         if (isCrash) {
//           FirebaseCrashlytics.instance.recordError(
//             error,
//             stackTrace,
//             printDetails: false,
//             fatal: true,
//             information: information,
//           );
//         } else {
//           FirebaseCrashlytics.instance.log(
//             [
//               error.toString(),
//               stackTrace.toString(),
//               ...information,
//             ].join('\n'),
//           );
//         }
//       }
//     } catch (e) {
//       developer.log('Failed to record error to Firebase Crashlytics: $e');
//     }
//     super.log(level, message, time: time, error: error, stackTrace: stackTrace);
//   }
// }

// extension on Level {
//   bool operator >=(Level other) => value >= other.value;
// }

// extension LoggerEx on Logger {
//   void exception(
//     dynamic message, {
//     DateTime? time,
//     Object? error,
//     StackTrace? stackTrace,
//   }) {
//     // 不明なエラーが発生した場合は致命的なエラーとして扱う
//     final isFatal = error is! BaseException || error.isFatal;
//     log(
//       isFatal ? Level.error : Level.warning,
//       message,
//       time: time,
//       error: error,
//       stackTrace: stackTrace,
//     );
//   }
// }
