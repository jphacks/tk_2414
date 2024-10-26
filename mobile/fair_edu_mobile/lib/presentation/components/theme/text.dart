import 'package:fair_edu_mobile/presentation/components/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_fonts/google_fonts.dart';

part 'text.freezed.dart';

extension FontWeightEx on FontWeight {
  static const regular = FontWeight.normal;
  static const medium = FontWeight.w500;
  static const bold = FontWeight.bold;
}

extension TextStyleFontWeightX on TextStyle {
  TextStyle withFontWeight({
    FontWeight fontWeight = FontWeightEx.regular,
  }) {
    return copyWith(
      fontWeight: fontWeight,
      fontFamily: GoogleFonts.notoSansJp(fontWeight: fontWeight).fontFamily,
      fontFamilyFallback: [
        GoogleFonts.notoSansJp(fontWeight: fontWeight).fontFamily,
      ].whereType<String>().toList(),
    );
  }
}

@Freezed(toJson: false)
class AppTextThemeData with _$AppTextThemeData {
  const AppTextThemeData._();

  const factory AppTextThemeData({
    // Label
    required TextStyle labelXs,
    required TextStyle labelSm,
    required TextStyle labelMd,
    required TextStyle labelLg,
    required TextStyle labelXl,
    // Body
    required TextStyle bodyXs,
    required TextStyle bodySm,
    required TextStyle bodyMd,
    // Title
    required TextStyle titleXs,
    required TextStyle titleSm,
    required TextStyle titleMd,
  }) = _AppTextThemeData;

  factory AppTextThemeData.withColor(AppColorThemeData colorTheme) {
    final normal = TextStyle(
      color: colorTheme.textPrimary,
    ).withFontWeight(fontWeight: FontWeightEx.regular);
    return AppTextThemeData(
      //Label
      labelXs: normal
          .withFontWeight(
            fontWeight: FontWeightEx.medium,
          )
          .copyWith(
            fontSize: 10,
            height: 16 / 10,
          ),
      labelSm: normal
          .withFontWeight(
            fontWeight: FontWeightEx.bold,
          )
          .copyWith(
            fontSize: 10,
            height: 16 / 10,
          ),
      labelMd: normal
          .withFontWeight(
            fontWeight: FontWeightEx.bold,
          )
          .copyWith(
            fontSize: 12,
            height: 16 / 12,
          ),
      labelLg: normal
          .withFontWeight(
            fontWeight: FontWeightEx.medium,
          )
          .copyWith(
            fontSize: 14,
            height: 20 / 14,
          ),
      labelXl: normal
          .withFontWeight(
            fontWeight: FontWeightEx.bold,
          )
          .copyWith(
            fontSize: 14,
            height: 20 / 14,
          ),
      //Body
      bodyXs: normal
          .withFontWeight(
            fontWeight: FontWeightEx.medium,
          )
          .copyWith(
            fontSize: 10,
            height: 16 / 10,
          ),
      bodySm: normal
          .withFontWeight(
            fontWeight: FontWeightEx.medium,
          )
          .copyWith(
            fontSize: 12,
            height: 16 / 12,
          ),
      bodyMd: normal
          .withFontWeight(
            fontWeight: FontWeightEx.medium,
          )
          .copyWith(
            fontSize: 14,
            height: 20 / 14,
          ),
      //Title
      titleXs: normal
          .withFontWeight(
            fontWeight: FontWeightEx.bold,
          )
          .copyWith(
            fontSize: 14,
          ),
      titleSm: normal
          .withFontWeight(
            fontWeight: FontWeightEx.bold,
          )
          .copyWith(
            fontSize: 16,
          ),
      titleMd: normal
          .withFontWeight(
            fontWeight: FontWeightEx.bold,
          )
          .copyWith(
            fontSize: 18,
          ),
    );
  }
}
