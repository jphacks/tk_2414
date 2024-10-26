import 'package:fair_edu_mobile/presentation/components/framework/loading/progress.dart';
import 'package:fair_edu_mobile/presentation/components/theme/constants.dart';
import 'package:fair_edu_mobile/presentation/components/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef VoidCallbackContext = void Function(BuildContext context);

class DialogContentBase extends HookConsumerWidget {
  const DialogContentBase({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: TextScaler.noScaling,
      ),
      child: Dialog(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.6,
            minWidth: MediaQuery.of(context).size.width * 0.75,
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: spacingUnit * 3,
              vertical: spacingUnit * 3,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class DialogContent extends HookConsumerWidget {
  const DialogContent({
    super.key,
    required this.title,
    this.description,
    this.body,
    this.dismissText = 'キャンセル',
    this.color,
    required this.onDismiss,
    required this.confirmText,
    required this.onConfirm,
    required this.isLoadingPredicate,
  });

  final String title;
  final String? description;
  final Widget? body;
  final String dismissText;
  final VoidCallbackContext onDismiss;
  final Color? color;
  final String confirmText;
  final VoidCallbackContext onConfirm;
  final bool Function(WidgetRef ref) isLoadingPredicate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return DialogContentBase(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: appTheme.textTheme.titleSm,
              ),
              if (description != null) ...[
                const Gap(spacingUnit * 1.5),
                Text(
                  description!,
                  style: appTheme.textTheme.bodySm.copyWith(
                    color: appTheme.colorTheme.textSecondary,
                  ),
                ),
              ],
            ],
          ),
          if (body != null) ...[
            const Gap(spacingUnit * 2),
            Expanded(
              child: body!,
            ),
          ],
          const Gap(spacingUnit * 2),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Consumer(
                builder: (context, ref, child) {
                  return OutlinedButton(
                    style:
                        Theme.of(context).outlinedButtonTheme.style?.copyWith(
                      side: WidgetStateProperty.resolveWith(
                        (states) {
                          if (states.any(
                            {
                              WidgetState.disabled,
                            }.contains,
                          )) {
                            return BorderSide(
                              color: appTheme.colorTheme.outlineVariant,
                              width: 1.5,
                            );
                          }
                          return BorderSide(
                            color: appTheme.colorTheme.outline,
                            width: 1.5,
                          );
                        },
                      ),
                      textStyle: WidgetStateProperty.resolveWith(
                        (states) {
                          if (states.any(
                            {
                              WidgetState.disabled,
                            }.contains,
                          )) {
                            return appTheme.textTheme.labelMd.copyWith(
                              color: appTheme.colorTheme.outlineVariant,
                            );
                          }
                          return appTheme.textTheme.labelMd.copyWith(
                            color: appTheme.colorTheme.outline,
                          );
                        },
                      ),
                      foregroundColor: WidgetStateProperty.resolveWith(
                        (states) {
                          if (states.any(
                            {
                              WidgetState.disabled,
                            }.contains,
                          )) {
                            return appTheme.colorTheme.textSecondary;
                          }
                          return appTheme.colorTheme.textPrimary;
                        },
                      ),
                    ),
                    onPressed: isLoadingPredicate(ref)
                        ? null
                        : () => onDismiss(context),
                    child: Text(dismissText),
                  );
                },
              ),
              const Gap(spacingUnit),
              Consumer(
                builder: (context, ref, child) {
                  return FilledButton.tonal(
                    style: Theme.of(context).filledButtonTheme.style?.copyWith(
                      backgroundColor: WidgetStateProperty.resolveWith(
                        (states) {
                          if (states.any(
                            {
                              WidgetState.disabled,
                            }.contains,
                          )) {
                            return appTheme.colorTheme.outlineVariant;
                          }
                          return color ?? appTheme.colorTheme.primary;
                        },
                      ),
                    ),
                    onPressed: isLoadingPredicate(ref)
                        ? null
                        : () => onConfirm(context),
                    child: isLoadingPredicate(ref)
                        ? Center(
                            child: CustomProgressIndicatorInsideButton(
                              color: color,
                            ),
                          )
                        : Text(
                            confirmText,
                            style: appTheme.textTheme.labelMd.copyWith(
                              color: appTheme.colorTheme.onPrimary,
                            ),
                          ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<T?> showCustomDialog<T>({
  required BuildContext context,
  bool barrierDismissible = false,
  required String title,
  String? description,
  Widget? body,
  String? dismissText,
  Color? color,
  required VoidCallbackContext onDismiss,
  required String confirmText,
  required VoidCallbackContext onConfirm,
  required bool Function(WidgetRef ref) isLoadingPredicate,
}) async {
  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) => DialogContent(
      title: title,
      description: description,
      body: body,
      dismissText: dismissText ?? 'キャンセル',
      color: color,
      onDismiss: onDismiss,
      confirmText: confirmText,
      onConfirm: onConfirm,
      isLoadingPredicate: isLoadingPredicate,
    ),
  );
}
