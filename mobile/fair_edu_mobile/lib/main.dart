import 'package:fair_edu_mobile/app.dart';
import 'package:fair_edu_mobile/infrastructure/data/mock/fake.dart';
import 'package:fair_edu_mobile/infrastructure/provider.dart';
import 'package:fair_edu_mobile/infrastructure/repository/message.mock.dart';
import 'package:fair_edu_mobile/presentation/library/riverpod/observer.dart';
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

  // データベースの初期化
  // final _ = await _initializeDatabase();

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
      observers: const [
        LogProviderObserver(),
      ],
      overrides: [
        // Riverpodでデータベースを管理
        // databaseProvider.overrideWithValue(database),
        // lectureRepositoryProvider.overrideWithValue(
        //     MockLectureRepository(faker: defaultCustomFaker)),
        messageRepositoryProvider.overrideWithValue(
            MockMessageRepository(faker: defaultCustomFaker)),
      ],
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

// /// データベースの初期化処理
// Future<AppDatabase> _initializeDatabase() async {
//   final dbFolder =
//       await getApplicationDocumentsDirectory(); // データベースファイルを保存する場所を取得
//   final dbFile = File('${dbFolder.path}/fair_edu.db'); // データベースファイル名を設定
//   return AppDatabase(NativeDatabase(dbFile)); // NativeDatabaseを使ってデータベース接続
// }
