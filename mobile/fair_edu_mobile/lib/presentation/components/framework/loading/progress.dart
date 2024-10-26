import 'package:fair_edu_mobile/presentation/components/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomProgressIndicator extends ConsumerWidget {
  const CustomProgressIndicator({
    super.key,
    this.color,
    this.size = 24,
  });

  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return LoadingAnimationWidget.staggeredDotsWave(
      color: color ?? appTheme.colorTheme.primary,
      size: size,
    );
  }
}

class CustomProgressIndicatorInsideButton extends ConsumerWidget {
  const CustomProgressIndicatorInsideButton({
    super.key,
    this.color,
    this.size = 20,
  });

  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return CustomProgressIndicator(
      color: color ?? appTheme.colorTheme.primary,
      size: size,
    );
  }
}
