import 'package:fair_edu_mobile/presentation/components/theme/constants.dart';
import 'package:fair_edu_mobile/presentation/components/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SnackBarContentBase extends HookConsumerWidget {
  const SnackBarContentBase({
    super.key,
    this.leading,
    required this.title,
    this.trailing,
  });

  final Widget? leading;
  final Widget title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (leading != null) ...[
          leading!,
          const SizedBox(width: spacingUnit * 1.5),
        ],
        Expanded(
          child: title,
        ),
        if (trailing != null) ...[
          const SizedBox(width: spacingUnit * 1.5),
          trailing!,
        ],
      ],
    );
  }
}

class SnackBarContent extends HookConsumerWidget {
  const SnackBarContent({
    super.key,
    required this.iconData,
    required this.titleColor,
    required this.title,
    this.description,
  });

  final PhosphorIconData iconData;
  final Color titleColor;
  final String title;
  final String? description;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return SnackBarContentBase(
      leading: PhosphorIcon(
        iconData,
        color: titleColor,
        size: 30,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: appTheme.textTheme.bodySm.copyWith(
              color: titleColor,
            ),
          ),
          if (description != null) ...[
            const SizedBox(
              height: spacingUnit * 0.25,
            ),
            Text(
              description!,
              style: appTheme.textTheme.bodySm.copyWith(
                color: appTheme.colorTheme.textSecondary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class SnackBarContentSuccess extends HookConsumerWidget {
  const SnackBarContentSuccess({
    super.key,
    required this.title,
    this.description,
  });

  final String title;
  final String? description;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return SnackBarContent(
      iconData: PhosphorIconsRegular.checkCircle,
      titleColor: appTheme.colorTheme.success,
      title: title,
      description: description,
    );
  }
}

class SnackBarContentFailure extends HookConsumerWidget {
  const SnackBarContentFailure({
    super.key,
    required this.title,
    this.description,
  });

  final String title;
  final String? description;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return SnackBarContent(
      iconData: PhosphorIconsRegular.warningCircle,
      titleColor: appTheme.colorTheme.error,
      title: title,
      description: description,
    );
  }
}

class SnackBarContentInfo extends HookConsumerWidget {
  const SnackBarContentInfo({
    super.key,
    required this.title,
    this.description,
  });

  final String title;
  final String? description;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return SnackBarContent(
      iconData: PhosphorIconsRegular.info,
      titleColor: appTheme.colorTheme.info,
      title: title,
      description: description,
    );
  }
}
