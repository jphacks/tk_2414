import 'package:fair_edu_mobile/presentation/components/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FormLabelText extends HookConsumerWidget {
  const FormLabelText({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return Text(
      label,
      style: appTheme.textTheme.labelMd.copyWith(
        color: appTheme.colorTheme.textPrimary,
      ),
    );
  }
}

class FormLabelSection extends HookConsumerWidget {
  const FormLabelSection({
    super.key,
    required this.label,
    this.actions,
  });

  final String label;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FormLabelText(
          label: label,
        ),
        const Spacer(),
        if (actions != null) ...actions!,
      ],
    );
  }
}
