import 'package:fair_edu_mobile/presentation/components/theme/constants.dart';
import 'package:fair_edu_mobile/presentation/components/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.trailing,
    this.height = 56,
    this.backgroundColor,
  });

  final Widget? title;
  final Widget? leading;
  final Widget? trailing;
  final double height;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);

    return AppBar(
      leading: leading,
      title: title,
      actions: trailing != null ? [trailing!, const Gap(spacingUnit)] : null,
      centerTitle: false,
      automaticallyImplyLeading: false,
      titleSpacing: spacingUnit * 3,
      backgroundColor: backgroundColor ?? appTheme.colorTheme.surface,
      toolbarHeight: height,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class AppBarPopLeadingIconButton extends HookConsumerWidget {
  const AppBarPopLeadingIconButton({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: onPressed,
      icon: const PhosphorIcon(
        PhosphorIconsRegular.caretLeft,
      ),
    );
  }
}
