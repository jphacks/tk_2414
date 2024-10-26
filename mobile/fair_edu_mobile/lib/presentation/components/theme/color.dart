import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'color.freezed.dart';

@Freezed(toJson: false)
class AppColorThemeData with _$AppColorThemeData {
  const AppColorThemeData._();

  const factory AppColorThemeData({
    // Text
    required Color textPrimary,
    required Color textSecondary,
    // Theme color
    required Color primary,
    required Color primaryDim,
    required Color primaryContainer,
    required Color onPrimary,
    // Background
    required Color background,
    required Color surface,
    required Color surfaceDim,
    // Outline
    required Color outline,
    required Color outlineVariant,
    // Info
    required Color success,
    required Color info,
    required Color warning,
    required Color error,
  }) = _AppColorThemeData;

  factory AppColorThemeData.light() {
    return const AppColorThemeData(
      textPrimary: Color(0xff454647),
      textSecondary: Color(0xff909498),
      primary: Color(0xff007AFF),
      primaryDim: Color(0xff172EA9),
      primaryContainer: Color(0xffD4D9F7),
      onPrimary: Color(0xffFFFFFF),
      background: Color(0xffF7F7F7),
      surface: Color(0xffFDFDFD),
      surfaceDim: Color(0xffECECEC),
      outline: Color(0xffE8EAED),
      outlineVariant: Color(0xffD3D6D9),
      success: Color(0xff4DB678),
      info: Color(0xff3C43EE),
      warning: Color(0xffDFDA53),
      error: Color(0xffD13B3B),
    );
  }
}
