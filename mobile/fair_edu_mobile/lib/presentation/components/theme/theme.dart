import 'package:fair_edu_mobile/presentation/components/theme/theme_data.dart';
import 'package:flutter/widgets.dart';

class AppTheme extends StatelessWidget {
  const AppTheme({
    super.key,
    required this.data,
    required this.child,
  });

  final AppThemeData data;
  final Widget child;

  static AppThemeData of(BuildContext context) {
    final _InheritedAppTheme? inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<_InheritedAppTheme>();
    return inheritedTheme!.theme.data;
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedAppTheme(
      theme: this,
      child: child,
    );
  }
}

class _InheritedAppTheme extends InheritedWidget {
  const _InheritedAppTheme({
    required this.theme,
    required super.child,
  });

  final AppTheme theme;

  @override
  bool updateShouldNotify(_InheritedAppTheme oldWidget) {
    return theme.data != oldWidget.theme.data;
  }
}
