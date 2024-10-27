import 'package:fair_edu_mobile/domain/model/enum/head_type.dart';
import 'package:fair_edu_mobile/presentation/components/theme/theme_data.dart';
import 'package:flutter/material.dart';

TextStyle getFontSize(HeadType type, AppThemeData appTheme) {
  switch (type) {
    case HeadType.h1:
      return appTheme.textTheme.labelMd.copyWith(
        fontSize: 14,
      );
    case HeadType.h2:
      return appTheme.textTheme.labelMd.copyWith(
        fontSize: 12,
      );
    case HeadType.h3:
      return appTheme.textTheme.bodyMd.copyWith(
        fontSize: 10,
      );
    case HeadType.h4:
      return appTheme.textTheme.bodyMd.copyWith(
        fontSize: 12,
      );
    case HeadType.h5:
      return const TextStyle(fontSize: 16);
    default:
      return const TextStyle(fontSize: 12);
  }
}
