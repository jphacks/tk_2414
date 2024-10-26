import 'package:fair_edu_mobile/presentation/components/framework/bottom_sheet/bottom_sheet_route.dart';
import 'package:fair_edu_mobile/presentation/components/framework/bottom_sheet/drag_handle.dart';
import 'package:fair_edu_mobile/presentation/components/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ActionBottomSheet<T> extends HookConsumerWidget {
  const ActionBottomSheet({
    super.key,
    required this.actions,
  });

  final List<Widget> actions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DragHandle(
              size: Size(double.infinity, 24),
            ),
            Material(
              type: MaterialType.transparency,
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return actions[index];
                },
                itemCount: actions.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(
                  bottom: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<T?> showActionBottomSheet<T>({
  required BuildContext context,
  required List<Widget> actions,
  Color? backgroundColor,
  Color? barrierColor,
  // elevation があると、 M3 では色が tintColor と合成されてしまう
  double elevation = 0,
}) {
  return showCustomModalBottomSheet<T>(
    context: context,
    enterBottomSheetDuration: const Duration(milliseconds: 200),
    exitBottomSheetDuration: const Duration(milliseconds: 150),
    isScrollControlled: false,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadiusUnit * 2),
    ),
    viewInsets: const EdgeInsets.only(
      bottom: 40,
      left: 16,
      right: 16,
    ),
    clipBehavior: Clip.antiAlias,
    showDragHandle: false,
    backgroundColor: backgroundColor,
    barrierColor: barrierColor,
    elevation: elevation,
    builder: (_) {
      return ActionBottomSheet(
        actions: actions,
      );
    },
  );
}
