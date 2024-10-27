import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SegmentCard extends HookConsumerWidget {
  const SegmentCard({
    super.key,
    required this.webViewController,
    required this.screenWidth,
    required this.svgHeight,
    required this.audioUrl,
    required this.onSelect,
    required this.isSelected,
    required this.hasMessage,
  });

  final WebViewController webViewController;
  final double screenWidth;
  final double svgHeight;
  final Uri audioUrl;
  final VoidCallback onSelect;
  final bool isSelected;
  final bool hasMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: [
          Container(
            width: screenWidth,
            height: svgHeight,
            // 背景色を isSelected に応じて変更
            color: isSelected ? Colors.grey[200] : Colors.transparent,
            child: WebViewWidget(
              controller: webViewController,
            ),
          ),
          // Positioned(
          //   top: 12,
          //   right: 12,
          //   child: hasMessage
          //       ? IconButton(
          //           onPressed: () {
          //             onSelect();
          //           },
          //           icon: const PhosphorIcon(
          //             PhosphorIconsBold.chat,
          //             size: 24,
          //           ),
          //         )
          //       : const SizedBox(
          //           width: 24,
          //         ),
          // ),
        ],
      ),
    );
  }
}
