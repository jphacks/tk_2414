import 'package:fair_edu_mobile/presentation/components/theme/constants.dart';
import 'package:flutter/material.dart';

class CustomPopupMenuItem<T> extends PopupMenuEntry<T> {
  const CustomPopupMenuItem({
    super.key,
    this.value,
    this.onTap,
    this.enabled = true,
    this.height = kMinInteractiveDimension,
    this.padding,
    this.textStyle,
    required this.child,
    this.customBackgroundColor,
  });

  final T? value;
  final VoidCallback? onTap;
  final bool enabled;
  @override
  final double height;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final Widget child;
  final Color? customBackgroundColor;

  @override
  bool represents(T? value) => value == this.value;

  @override
  CustomPopupMenuItemState<T, CustomPopupMenuItem<T>> createState() =>
      CustomPopupMenuItemState<T, CustomPopupMenuItem<T>>();
}

class CustomPopupMenuItemState<T, W extends CustomPopupMenuItem<T>>
    extends State<W> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle? style = widget.textStyle ?? theme.textTheme.bodyLarge;

    Widget item = AnimatedDefaultTextStyle(
      style: style!,
      duration: kThemeChangeDuration,
      child: Container(
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 8.0,
        ),
        color: widget.customBackgroundColor,
        child: widget.child,
      ),
    );

    if (!widget.enabled) {
      item = IconTheme.merge(
        data: IconThemeData(
          opacity: theme.brightness == Brightness.dark ? 0.5 : 0.38,
        ),
        child: item,
      );
    }

    return MergeSemantics(
      child: Semantics(
        enabled: widget.enabled,
        button: true,
        child: Padding(
          padding: widget.padding ??
              const EdgeInsets.symmetric(
                horizontal: spacingUnit * 0.5,
              ),
          child: InkWell(
            borderRadius: BorderRadius.circular(borderRadiusUnit * 0.5),
            onTap: widget.enabled ? handleTap : null,
            child: Container(
              color: widget.customBackgroundColor ?? Colors.transparent,
              child: item,
            ),
          ),
        ),
      ),
    );
  }

  void handleTap() {
    Navigator.pop<T>(context, widget.value);
    widget.onTap?.call();
  }
}
