import 'package:flutter/material.dart';

class DragHandle extends StatelessWidget {
  const DragHandle({
    super.key,
    this.size,
    this.dragHandleSize,
    this.color,
  });

  final Size? size;
  final Size? dragHandleSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final handleSize = dragHandleSize ?? const Size(40, 4);

    return SizedBox(
      height: size?.height ?? kMinInteractiveDimension,
      width: size?.width ?? kMinInteractiveDimension,
      child: Center(
        child: Container(
          height: handleSize.height,
          width: handleSize.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(handleSize.height / 2),
            color: color ?? const Color(0xffDCDCDC),
          ),
        ),
      ),
    );
  }
}
