import 'package:fair_edu_mobile/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:time_machine/time_machine.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent),
  );

  await Future.wait<dynamic>(
    [
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge),
      _initializeLocale(),
      TimeMachine.initialize({
        'rootBundle': rootBundle,
      }),
      _initializeFirebase(widgetsBinding),
    ],
  );

  runApp(
    ProviderScope(
      observers: const [],
      overrides: [],
      child: const FairEduApp(),
    ),
  );
}

Future<void> _initializeLocale() async {
  await initializeDateFormatting('ja_JP');
  Intl.defaultLocale = 'ja_JP';
}

/// Firebase周りの初期化
Future<void> _initializeFirebase(WidgetsBinding widgetsBinding) async {
  // Firebaseの初期化を行う
}
