import 'package:fair_edu_mobile/presentation/components/theme/constants.dart';
import 'package:fair_edu_mobile/presentation/components/theme/text.dart';
import 'package:fair_edu_mobile/presentation/components/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomCheckboxListTile extends HookConsumerWidget {
  const CustomCheckboxListTile({
    super.key,
    this.readOnly = false,
    required this.title,
    required this.value,
    this.onChanged,
  });

  final bool readOnly;
  final String title;
  final bool? value;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onChanged == null
          ? null
          : () {
              if (readOnly) {
                return;
              }
              onChanged?.call(!(value ?? false));
            },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            visualDensity: VisualDensity.compact,
            value: value ?? false,
            onChanged: onChanged == null
                ? null
                : (value) {
                    if (readOnly) {
                      return;
                    }
                    onChanged?.call(value);
                  },
          ),
          const Gap(spacingUnit / 2),
          Text(
            title,
            style: appTheme.textTheme.bodySm
                .copyWith(
                  height: 1,
                )
                .withFontWeight(fontWeight: FontWeightEx.regular),
          ),
        ],
      ),
    );
  }
}
