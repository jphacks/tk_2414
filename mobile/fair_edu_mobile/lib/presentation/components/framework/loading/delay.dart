import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoadingDelayDisplay extends HookConsumerWidget {
  const LoadingDelayDisplay({
    super.key,
    this.delay = const Duration(milliseconds: 500),
    required this.isLoading,
    required this.loading,
    required this.childBuilder,
  });

  final Duration delay;
  final bool isLoading;
  final Widget loading;
  final WidgetBuilder childBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shouldShowLoading = useState(isLoading);

    Timer? timer;
    useEffect(
      () {
        if (timer?.isActive ?? false) {
          timer?.cancel();
        }
        if (isLoading) {
          if (!shouldShowLoading.value) {
            shouldShowLoading.value = true;
          }
          return null;
        }
        timer = Timer(delay, () {
          shouldShowLoading.value = false;
        });
        return timer?.cancel;
      },
      [delay, isLoading],
    );

    return shouldShowLoading.value ? loading : childBuilder(context);
  }
}
