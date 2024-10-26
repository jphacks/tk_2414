import 'dart:math';
import 'dart:ui';

import 'package:fair_edu_mobile/presentation/components/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CompactTextButton extends HookConsumerWidget {
  const CompactTextButton({
    super.key,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.statesController,
    this.isSemanticButton = true,
    this.iconAlignment = IconAlignment.start,
    required this.child,
  });

  factory CompactTextButton.icon({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    WidgetStatesController? statesController,
    IconAlignment iconAlignment = IconAlignment.start,
    Widget? icon,
    required Widget label,
  }) {
    if (icon == null) {
      return CompactTextButton(
        key: key,
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        clipBehavior: clipBehavior ?? Clip.none,
        statesController: statesController,
        child: label,
      );
    }
    return _CompactTextButtonWithIcon(
      key: key,
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      style: style,
      focusNode: focusNode,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      statesController: statesController,
      iconAlignment: iconAlignment,
      icon: icon,
      label: label,
    );
  }

  final VoidCallback? onPressed;

  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;

  final ButtonStyle? style;

  final Clip clipBehavior;
  final FocusNode? focusNode;

  final bool autofocus;
  final WidgetStatesController? statesController;

  final bool? isSemanticButton;
  final IconAlignment iconAlignment;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      style: Theme.of(context)
          .textButtonTheme
          .style
          ?.copyWith(
            minimumSize: const WidgetStatePropertyAll<Size>(
              Size.zero,
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(
                vertical: spacingUnit / 2,
                horizontal: spacingUnit,
              ),
            ),
            iconSize: const WidgetStatePropertyAll(spacingUnit * 2.25),
          )
          .merge(style),
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      focusNode: focusNode,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      statesController: statesController,
      isSemanticButton: isSemanticButton,
      iconAlignment: iconAlignment,
      child: child,
    );
  }
}

class _CompactTextButtonWithIcon extends CompactTextButton {
  _CompactTextButtonWithIcon({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    super.statesController,
    super.iconAlignment,
    required Widget icon,
    required Widget label,
  }) : super(
          autofocus: autofocus ?? false,
          clipBehavior: clipBehavior ?? Clip.none,
          child: _CompactTextButtonWithIconChild(
            icon: icon,
            label: label,
            iconAlignment: iconAlignment,
          ),
        );
}

class _CompactTextButtonWithIconChild extends StatelessWidget {
  const _CompactTextButtonWithIconChild({
    required this.label,
    required this.icon,
    required this.iconAlignment,
  });

  final Widget label;
  final Widget icon;
  final IconAlignment iconAlignment;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    final double scale = MediaQuery.textScalerOf(context).textScaleFactor;
    final double gap = scale <= 1 ? 8 : lerpDouble(8, 4, min(scale - 1, 1))!;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: iconAlignment == IconAlignment.start
          ? <Widget>[icon, SizedBox(width: gap), Flexible(child: label)]
          : <Widget>[Flexible(child: label), SizedBox(width: gap), icon],
    );
  }
}
