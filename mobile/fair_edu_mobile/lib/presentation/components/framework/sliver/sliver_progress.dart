import 'package:fair_edu_mobile/presentation/components/framework/loading/progress.dart';
import 'package:fair_edu_mobile/presentation/components/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SliverFillRemainingProgress extends HookConsumerWidget {
  const SliverFillRemainingProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SliverMainAxisGroup(
      slivers: [
        SliverGap(spacingUnit * 2),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: CustomProgressIndicator(),
          ),
        ),
        SliverGap(spacingUnit * 2),
      ],
    );
  }
}
