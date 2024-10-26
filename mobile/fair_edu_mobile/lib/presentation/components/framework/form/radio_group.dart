import 'package:collection/collection.dart';
import 'package:fair_edu_mobile/presentation/components/framework/form/static.dart';
import 'package:fair_edu_mobile/presentation/components/theme/constants.dart';
import 'package:fair_edu_mobile/presentation/components/theme/text.dart';
import 'package:fair_edu_mobile/presentation/components/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BooleanRadioGroupForm extends HookConsumerWidget {
  const BooleanRadioGroupForm({
    super.key,
    this.readOnly = false,
    this.title,
    required this.initialValue,
    this.labelGetter,
    this.onChanged,
  });

  final bool readOnly;
  final String? title;
  final bool? initialValue;
  final ValueChanged<bool?>? onChanged;
  final String Function(bool)? labelGetter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = useState<bool?>(initialValue);

    useEffect(
      () {
        void listener() {
          onChanged?.call(formState.value);
        }

        formState.addListener(listener);

        return () {
          formState.removeListener(listener);
        };
      },
      [initialValue, onChanged],
    );

    return RadioGroupFormBase<bool>(
      title: title,
      readOnly: readOnly,
      formState: formState,
      children: [
        CustomRadioListTile(
          shrinkWrap: true,
          readOnly: readOnly,
          value: true,
          groupValue: formState.value,
          onChanged: (value) {
            formState.value = value;
          },
          title: labelGetter?.call(true) ?? 'あり',
        ),
        const Gap(spacingUnit * 3),
        CustomRadioListTile(
          shrinkWrap: true,
          readOnly: readOnly,
          value: false,
          groupValue: formState.value,
          onChanged: (value) {
            formState.value = value;
          },
          title: labelGetter?.call(false) ?? 'なし',
        ),
      ],
    );
  }
}

class EnumRadioGroupForm<T extends Enum> extends HookConsumerWidget {
  const EnumRadioGroupForm({
    super.key,
    this.readOnly = false,
    this.title,
    required this.candidates,
    required this.initialValue,
    this.labelGetter,
    this.onChanged,
  });

  final bool readOnly;
  final String? title;
  final Set<T> candidates;
  final T? initialValue;
  final String Function(T)? labelGetter;
  final ValueChanged<T?>? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = useState<T?>(initialValue);

    useEffect(
      () {
        void listener() {
          onChanged?.call(formState.value);
        }

        formState.addListener(listener);

        return () {
          formState.removeListener(listener);
        };
      },
      [initialValue, onChanged],
    );

    return RadioGroupFormBase<T>(
      readOnly: readOnly,
      title: title,
      formState: formState,
      children: candidates
          .mapIndexed(
            (i, e) => [
              if (i != 0) const Gap(spacingUnit * 2),
              CustomRadioListTile<T>(
                shrinkWrap: true,
                readOnly: readOnly,
                value: e,
                groupValue: formState.value,
                onChanged: (value) {
                  formState.value = value;
                },
                title: labelGetter?.call(e) ?? e.toString(),
              ),
            ],
          )
          .flattened
          .toList(),
    );
  }
}

class CustomRadioListTile<T> extends HookConsumerWidget {
  const CustomRadioListTile({
    super.key,
    this.readOnly = false,
    required this.title,
    required this.value,
    required this.groupValue,
    this.shrinkWrap = false,
    this.onChanged,
  });

  final bool readOnly;
  final String title;
  final T value;
  final T? groupValue;
  final bool shrinkWrap;
  final ValueChanged<T?>? onChanged;

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
              onChanged?.call(value);
            },
      child: Row(
        mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: SizedBox(
              height: spacingUnit * 2,
              width: spacingUnit * 2,
              child: Radio<T>(
                visualDensity: VisualDensity.compact,
                value: value,
                groupValue: groupValue,
                onChanged: (value) {
                  if (readOnly) {
                    return;
                  }
                  onChanged?.call(value);
                },
              ),
            ),
          ),
          const Gap(spacingUnit / 2),
          Text(
            title,
            style: appTheme.textTheme.bodyMd
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

class RadioGroupFormBase<T> extends HookConsumerWidget {
  const RadioGroupFormBase({
    super.key,
    this.readOnly = false,
    this.title,
    required this.children,
    required this.formState,
  });

  final bool readOnly;
  final String? title;
  final List<Widget> children;
  final ValueNotifier<T?> formState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return title == null
        ? Row(
            children: children,
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FormLabelText(
                    label: title!,
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: formState.value != null && !readOnly
                        ? Row(
                            children: [
                              const Gap(spacingUnit * 2),
                              GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  if (readOnly) {
                                    return;
                                  }
                                  formState.value = null;
                                },
                                child: Text(
                                  '選択を解除',
                                  style: appTheme.textTheme.bodyXs.copyWith(
                                    color: appTheme.colorTheme.textSecondary,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                  ),
                ],
              ),
              const Gap(spacingUnit),
              Wrap(
                spacing: spacingUnit * 1,
                children: children,
              ),
            ],
          );
  }
}
