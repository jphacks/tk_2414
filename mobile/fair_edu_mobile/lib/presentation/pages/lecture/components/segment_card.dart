import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const Gap(12),
              IconButton(
                onPressed: () {},
                icon: const PhosphorIcon(
                  PhosphorIconsBold.speakerHigh,
                  size: 24,
                ),
              ),
            ],
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
            width: screenWidth,
            height: svgHeight,
            // 背景色を isSelected に応じて変更
            color: isSelected ? Colors.grey[200] : Colors.transparent,
            child: WebViewWidget(
              controller: webViewController,
            ),
          ),
          Column(
            children: [
              const Gap(12),
              hasMessage
                  ? IconButton(
                      onPressed: () {
                        onSelect();
                      },
                      icon: const PhosphorIcon(
                        PhosphorIconsBold.chat,
                        size: 24,
                      ),
                    )
                  : const SizedBox(
                      width: 24,
                    )
            ],
          ),
        ],
      ),
    );
  }
}
