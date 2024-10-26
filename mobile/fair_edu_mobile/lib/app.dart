import 'package:fair_edu_mobile/presentation/components/theme/theme.dart';
import 'package:fair_edu_mobile/presentation/components/theme/theme_data.dart';
import 'package:fair_edu_mobile/presentation/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FairEduApp extends ConsumerWidget {
  const FairEduApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MediaQuery(
      // 全体でtextScaleFactorを固定にする
      data: MediaQuery.of(context).copyWith(
        textScaler: TextScaler.noScaling,
      ),
      child: AppTheme(
        data: AppThemeData.light(),
        child: Builder(
          builder: (context) {
            return MaterialApp.router(
              theme: AppTheme.of(context).materialThemeData,
              debugShowCheckedModeBanner: false,
              routeInformationParser: router.routeInformationParser,
              routeInformationProvider: router.routeInformationProvider,
              routerDelegate: router.routerDelegate,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('ja'),
              ],
            );
          },
        ),
      ),
    );
  }
}
