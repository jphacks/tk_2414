import 'package:fair_edu_mobile/domain/model/entity/head_line.dart';
import 'package:fair_edu_mobile/presentation/components/theme/theme.dart';
import 'package:fair_edu_mobile/presentation/pages/lecture/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HeadLineCard extends HookConsumerWidget {
  const HeadLineCard({super.key, required this.headLine});

  final HeadLineEntity headLine;

  static const name = 'HeadLine';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);

    return SizedBox(
      height: headLine.type.isTitle ? 72 : 48,
      child: Center(
          child: Text(
        headLine.name,
        style: getFontSize(headLine.type, appTheme),
        textAlign: TextAlign.center,
      )),
    );
  }
}
