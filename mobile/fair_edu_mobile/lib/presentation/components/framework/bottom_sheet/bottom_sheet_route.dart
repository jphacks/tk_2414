import 'package:flutter/material.dart';

class CustomModalBottomSheetRoute<T> extends PopupRoute<T> {
  CustomModalBottomSheetRoute({
    this.builder,
    this.theme,
    this.barrierLabel,
    this.backgroundColor,
    this.isPersistent,
    this.elevation,
    this.shape,
    this.removeTop = true,
    this.clipBehavior,
    this.modalBarrierColor,
    this.isDismissible = true,
    this.enableDrag = true,
    required this.isScrollControlled,
    super.settings,
    this.enterBottomSheetDuration = const Duration(milliseconds: 200),
    this.exitBottomSheetDuration = const Duration(milliseconds: 150),
    this.viewInsets,
    this.showDragHandle,
  });

  final bool? isPersistent;
  final WidgetBuilder? builder;
  final ThemeData? theme;
  final bool isScrollControlled;
  final Color? backgroundColor;
  final double? elevation;
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final Color? modalBarrierColor;
  final bool isDismissible;
  final bool enableDrag;
  // final String name;
  final Duration enterBottomSheetDuration;
  final Duration exitBottomSheetDuration;
  // remove safearea from top
  final bool removeTop;

  final EdgeInsetsGeometry? viewInsets;
  final bool? showDragHandle;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 700);

  @override
  bool get barrierDismissible => isDismissible;

  @override
  final String? barrierLabel;

  @override
  Color get barrierColor => modalBarrierColor ?? Colors.black54;

  AnimationController? _animationController;

  @override
  AnimationController createAnimationController() {
    assert(_animationController == null);
    _animationController =
        BottomSheet.createAnimationController(navigator!.overlay!);
    _animationController!.duration = enterBottomSheetDuration;
    _animationController!.reverseDuration = exitBottomSheetDuration;
    return _animationController!;
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final sheetTheme =
        theme?.bottomSheetTheme ?? Theme.of(context).bottomSheetTheme;
    // By definition, the bottom sheet is aligned to the bottom of the page
    // and isn't exposed to the top padding of the MediaQuery.
    Widget bottomSheet = MediaQuery.removePadding(
      context: context,
      removeTop: removeTop,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: _CustomModalBottomSheet<T>(
          route: this,
          backgroundColor: backgroundColor ??
              sheetTheme.modalBackgroundColor ??
              sheetTheme.backgroundColor,
          elevation:
              elevation ?? sheetTheme.modalElevation ?? sheetTheme.elevation,
          shape: shape,
          clipBehavior: clipBehavior,
          isScrollControlled: isScrollControlled,
          enableDrag: enableDrag,
          viewInsets: viewInsets,
          showDragHandle: showDragHandle,
        ),
      ),
    );
    if (theme != null) bottomSheet = Theme(data: theme!, child: bottomSheet);
    return bottomSheet;
  }
}

class _CustomModalBottomSheet<T> extends StatelessWidget {
  const _CustomModalBottomSheet({
    super.key,
    this.route,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.clipBehavior,
    this.isScrollControlled = false,
    this.enableDrag = true,
    this.isPersistent = false,
    this.viewInsets,
    this.showDragHandle,
  });

  final bool isPersistent;
  final CustomModalBottomSheetRoute<T>? route;
  final bool isScrollControlled;
  final Color? backgroundColor;
  final double? elevation;
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final bool enableDrag;
  final EdgeInsetsGeometry? viewInsets;
  final bool? showDragHandle;

  String _getRouteLabel(
    BuildContext context,
    MaterialLocalizations localizations,
  ) {
    if ((Theme.of(context).platform == TargetPlatform.android) ||
        (Theme.of(context).platform == TargetPlatform.fuchsia)) {
      return localizations.dialogLabel;
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    assert(debugCheckHasMaterialLocalizations(context));
    final sheetTheme = Theme.of(context).bottomSheetTheme;
    final mediaQuery = MediaQuery.of(context);
    final localizations = MaterialLocalizations.of(context);
    final routeLabel = _getRouteLabel(context, localizations);

    return AnimatedBuilder(
      animation: route!.animation!,
      builder: (context, child) {
        // Disable the initial animation when accessible navigation is on so
        // that the semantics are added to the tree at the correct time.
        final animationValue =
            mediaQuery.accessibleNavigation ? 1.0 : route!.animation!.value;
        return Semantics(
          scopesRoute: true,
          namesRoute: true,
          label: routeLabel,
          explicitChildNodes: true,
          child: ClipRect(
            child: CustomSingleChildLayout(
              delegate: _CustomModalBottomSheetLayout(
                animationValue,
                isScrollControlled,
              ),
              child: isPersistent == false
                  ? Padding(
                      padding: viewInsets ?? EdgeInsets.zero,
                      child: BottomSheet(
                        animationController: route!._animationController,
                        onClosing: () {
                          if (route!.isCurrent) {
                            Navigator.pop(context);
                          }
                        },
                        showDragHandle: showDragHandle ??
                            (enableDrag &&
                                (sheetTheme.showDragHandle ?? false)),
                        builder: route!.builder!,
                        backgroundColor: backgroundColor,
                        elevation: elevation,
                        shape: shape,
                        clipBehavior: clipBehavior,
                        enableDrag: enableDrag,
                      ),
                    )
                  : Scaffold(
                      bottomSheet: Padding(
                        padding: viewInsets ?? EdgeInsets.zero,
                        child: BottomSheet(
                          animationController: route!._animationController,
                          onClosing: () {
                            // if (route.isCurrent) {
                            //   Navigator.pop(context);
                            // }
                          },
                          showDragHandle: showDragHandle ??
                              (enableDrag &&
                                  (sheetTheme.showDragHandle ?? false)),
                          builder: route!.builder!,
                          backgroundColor: backgroundColor,
                          elevation: elevation,
                          shape: shape,
                          clipBehavior: clipBehavior,
                          enableDrag: enableDrag,
                        ),
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}

class _CustomModalBottomSheetLayout extends SingleChildLayoutDelegate {
  _CustomModalBottomSheetLayout(this.progress, this.isScrollControlled);

  final double progress;
  final bool isScrollControlled;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints(
      minWidth: constraints.maxWidth,
      maxWidth: constraints.maxWidth,
      minHeight: 0.0,
      maxHeight: isScrollControlled
          ? constraints.maxHeight
          : constraints.maxHeight * 9.0 / 16.0,
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(0.0, size.height - childSize.height * progress);
  }

  @override
  bool shouldRelayout(_CustomModalBottomSheetLayout oldDelegate) {
    return progress != oldDelegate.progress;
  }
}

Future<T?> showCustomModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? backgroundColor,
  String? barrierLabel,
  double? elevation,
  ShapeBorder? shape,
  Clip? clipBehavior,
  Color? barrierColor,
  bool isScrollControlled = false,
  bool useRootNavigator = true,
  bool isDismissible = true,
  bool enableDrag = true,
  RouteSettings? routeSettings,
  AnimationController? transitionAnimationController,
  EdgeInsetsGeometry? viewInsets,
  Duration? enterBottomSheetDuration,
  Duration? exitBottomSheetDuration,
  bool isPersistent = false,
  ThemeData? theme,
  bool? showDragHandle,
}) {
  assert(debugCheckHasMediaQuery(context));
  assert(debugCheckHasMaterialLocalizations(context));

  final navigator = Navigator.of(context, rootNavigator: useRootNavigator);
  final localizations = MaterialLocalizations.of(context);
  return navigator.push(
    CustomModalBottomSheetRoute<T>(
      builder: builder,
      isScrollControlled: isScrollControlled,
      barrierLabel: barrierLabel ?? localizations.scrimLabel,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      isDismissible: isDismissible,
      modalBarrierColor:
          barrierColor ?? Theme.of(context).bottomSheetTheme.modalBarrierColor,
      enableDrag: enableDrag,
      settings: routeSettings,
      viewInsets: viewInsets,
      enterBottomSheetDuration:
          enterBottomSheetDuration ?? const Duration(milliseconds: 200),
      exitBottomSheetDuration:
          exitBottomSheetDuration ?? const Duration(milliseconds: 150),
      isPersistent: isPersistent,
      theme: theme,
      showDragHandle: showDragHandle,
    ),
  );
}
