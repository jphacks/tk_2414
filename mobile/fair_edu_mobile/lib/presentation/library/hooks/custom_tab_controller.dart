import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomTabController extends TabController {
  CustomTabController({
    required super.length,
    required super.vsync,
    super.initialIndex,
    super.animationDuration,
    this.curve,
  });

  final Curve? curve;

  @override
  void animateTo(int value, {Duration? duration, Curve curve = Curves.ease}) {
    super.animateTo(
      value,
      duration: duration,
      curve: this.curve ?? curve,
    );
  }
}

/// Creates a [CustomTabController] that will be disposed automatically.
///
/// See also:
/// - [CustomTabController]
CustomTabController useCustomTabController({
  required int initialLength,
  TickerProvider? vsync,
  int initialIndex = 0,
  Duration? animationDuration,
  Curve? curve,
  List<Object?>? keys,
}) {
  vsync ??= useSingleTickerProvider(keys: keys);

  return use(
    _CustomTabControllerHook(
      vsync: vsync,
      length: initialLength,
      initialIndex: initialIndex,
      animationDuration: animationDuration,
      curve: curve,
      keys: keys,
    ),
  );
}

class _CustomTabControllerHook extends Hook<CustomTabController> {
  const _CustomTabControllerHook({
    required this.length,
    required this.vsync,
    required this.initialIndex,
    this.animationDuration,
    this.curve,
    super.keys,
  });

  final int length;
  final TickerProvider vsync;
  final int initialIndex;
  final Duration? animationDuration;
  final Curve? curve;

  @override
  HookState<CustomTabController, Hook<CustomTabController>> createState() =>
      _CustomTabControllerHookState();
}

class _CustomTabControllerHookState
    extends HookState<CustomTabController, _CustomTabControllerHook> {
  late final controller = CustomTabController(
    length: hook.length,
    initialIndex: hook.initialIndex,
    vsync: hook.vsync,
    animationDuration: hook.animationDuration,
    curve: hook.curve,
  );

  @override
  CustomTabController build(BuildContext context) => controller;

  @override
  void dispose() => controller.dispose();

  @override
  String get debugLabel => 'useCustomTabController';
}
