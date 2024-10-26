import 'package:fair_edu_mobile/presentation/components/theme/color.dart';
import 'package:fair_edu_mobile/presentation/components/theme/constants.dart';
import 'package:fair_edu_mobile/presentation/components/theme/text.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_data.freezed.dart';

@Freezed(toJson: false)
class AppThemeData with _$AppThemeData {
  const AppThemeData._();

  const factory AppThemeData({
    required ThemeMode mode,
    required ThemeData materialThemeData,
    required AppColorThemeData colorTheme,
    required AppTextThemeData textTheme,
  }) = _AppThemeData;

  factory AppThemeData.light() {
    const themeMode = ThemeMode.light;
    final colorTheme = AppColorThemeData.light();
    final textTheme = AppTextThemeData.withColor(colorTheme);

    final baseButtonStyle = ButtonStyle(
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      iconSize: const WidgetStatePropertyAll<double>(spacingUnit * 2),
      minimumSize: const WidgetStatePropertyAll<Size>(Size.zero),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadiusUnit,
          ),
        ),
      ),
      padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(
          horizontal: spacingUnit * 2,
          vertical: spacingUnit,
        ),
      ),
      overlayColor: WidgetStatePropertyAll<Color>(
        colorTheme.textSecondary.withOpacity(0.1),
      ),
    );

    final baseInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadiusUnit),
      borderSide: BorderSide(
        color: colorTheme.textSecondary,
        width: 1,
        strokeAlign: BorderSide.strokeAlignInside,
      ),
    );

    final inputDecorationTheme = InputDecorationTheme(
      isDense: true,
      filled: false,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: spacingUnit * 2,
        vertical: spacingUnit,
      ),
      outlineBorder: baseInputBorder.borderSide,
      enabledBorder: baseInputBorder,
      disabledBorder: baseInputBorder.copyWith(
        borderSide: baseInputBorder.borderSide.copyWith(
          color: colorTheme.textSecondary,
        ),
      ),
      errorBorder: baseInputBorder.copyWith(
        borderSide: baseInputBorder.borderSide.copyWith(
          color: colorTheme.error,
        ),
      ),
      focusedBorder: baseInputBorder.copyWith(
        borderSide: baseInputBorder.borderSide.copyWith(
          color: colorTheme.primary,
        ),
      ),
      focusedErrorBorder: baseInputBorder.copyWith(
        borderSide: baseInputBorder.borderSide.copyWith(
          color: colorTheme.error,
        ),
      ),
      hintStyle: textTheme.bodyMd.copyWith(
        color: colorTheme.textSecondary,
      ),
      labelStyle: textTheme.bodyMd.copyWith(
        color: colorTheme.textSecondary,
      ),
      errorStyle: textTheme.bodySm.copyWith(
        color: colorTheme.error,
      ),
    );

    final baseThemeData = ThemeData.light();

    final materialThemeData = baseThemeData.copyWith(
      scaffoldBackgroundColor: colorTheme.background,
      primaryColor: colorTheme.primary,
      colorScheme: ColorScheme.fromSeed(
        seedColor: colorTheme.primary,
        surface: colorTheme.surface,
        surfaceContainerHighest: colorTheme.surfaceDim,
        onPrimary: colorTheme.onPrimary,
        error: colorTheme.error,
      ),
      disabledColor: colorTheme.textSecondary,
      splashFactory: NoSplash.splashFactory,
      splashColor: colorTheme.primaryContainer.withOpacity(0.05),
      highlightColor: colorTheme.textSecondary.withOpacity(0.1),
      canvasColor: colorTheme.surface,
      appBarTheme: AppBarTheme(
        titleTextStyle: textTheme.titleMd,
        backgroundColor: colorTheme.surface,
        surfaceTintColor: colorTheme.surface,
      ),
      iconTheme: IconThemeData(
        color: colorTheme.textPrimary,
      ),
      textTheme: baseThemeData.textTheme.copyWith(
        bodyLarge: textTheme.bodyMd.copyWith(
          color: colorTheme.textPrimary,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorTheme.primary,
        foregroundColor: colorTheme.onPrimary,
        splashColor: colorTheme.primaryContainer.withOpacity(0.1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              borderRadiusUnit,
            ),
          ),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          minimumSize: const WidgetStatePropertyAll<Size>(
            Size.zero,
          ),
          foregroundColor: WidgetStatePropertyAll<Color>(
            colorTheme.textPrimary,
          ),
          backgroundColor: const WidgetStatePropertyAll<Color>(
            Colors.transparent,
          ),
          padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
            EdgeInsets.all(spacingUnit),
          ),
          shape: WidgetStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                borderRadiusUnit * 4,
              ),
            ),
          ),
          overlayColor: WidgetStatePropertyAll<Color>(
            colorTheme.primaryContainer.withOpacity(0.1),
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: baseButtonStyle.merge(
          ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith(
              (states) {
                if (states.any(
                  {
                    WidgetState.disabled,
                  }.contains,
                )) {
                  return colorTheme.outlineVariant;
                }
                return colorTheme.primary;
              },
            ),
            foregroundColor: WidgetStateProperty.resolveWith(
              (states) {
                if (states.any(
                  {
                    WidgetState.disabled,
                  }.contains,
                )) {
                  return colorTheme.onPrimary;
                }
                return colorTheme.onPrimary;
              },
            ),
            textStyle: WidgetStateProperty.resolveWith(
              (states) {
                final baseTextStyle = textTheme.labelXl;
                if (states.contains(WidgetState.disabled)) {
                  return baseTextStyle.copyWith(
                    color: colorTheme.onPrimary,
                  );
                } else {
                  return baseTextStyle.copyWith(color: colorTheme.onPrimary);
                }
              },
            ),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: baseButtonStyle.merge(
          ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll<Color>(
              Colors.transparent,
            ),
            foregroundColor: WidgetStatePropertyAll<Color>(
              colorTheme.textPrimary,
            ),
            textStyle: WidgetStatePropertyAll(
              textTheme.labelXl.copyWith(
                color: colorTheme.textPrimary,
              ),
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: baseButtonStyle.merge(
          ButtonStyle(
            side: WidgetStateProperty.resolveWith(
              (states) {
                if (states.any(
                  {
                    WidgetState.disabled,
                  }.contains,
                )) {
                  return BorderSide(
                    color: colorTheme.outline,
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignInside,
                  );
                }
                return BorderSide(
                  color: colorTheme.primary,
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignInside,
                );
              },
            ),
            backgroundColor: const WidgetStatePropertyAll<Color>(
              Colors.transparent,
            ),
            foregroundColor: WidgetStateProperty.resolveWith(
              (states) {
                if (states.any(
                  {
                    WidgetState.disabled,
                  }.contains,
                )) {
                  return colorTheme.textSecondary;
                }
                return colorTheme.primary;
              },
            ),
            textStyle: WidgetStatePropertyAll(
              textTheme.labelXl.copyWith(
                color: colorTheme.primary,
              ),
            ),
          ),
        ),
      ),
      inputDecorationTheme: inputDecorationTheme,
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: inputDecorationTheme,
        menuStyle: MenuStyle(
          surfaceTintColor: WidgetStatePropertyAll(colorTheme.background),
          backgroundColor: WidgetStateProperty.all(
            colorTheme.background,
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(spacingUnit),
            ),
          ),
        ),
      ),
      menuButtonTheme: MenuButtonThemeData(
        style: baseButtonStyle.merge(
          ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
            foregroundColor: WidgetStateProperty.resolveWith(
              (states) {
                if (states.any(
                  {
                    WidgetState.disabled,
                  }.contains,
                )) {
                  return colorTheme.textSecondary;
                }
                return colorTheme.textPrimary;
              },
            ),
            textStyle: WidgetStateProperty.resolveWith(
              (states) {
                final baseTextStyle = textTheme.labelXl;
                if (states.any(
                  {
                    WidgetState.disabled,
                  }.contains,
                )) {
                  return baseTextStyle.copyWith(
                    color: colorTheme.textSecondary,
                  );
                } else {
                  return baseTextStyle.copyWith(color: colorTheme.textPrimary);
                }
              },
            ),
            shape: WidgetStateProperty.resolveWith(
              (states) {
                return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    borderRadiusUnit / 2,
                  ),
                );
              },
            ),
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(
                horizontal: spacingUnit,
                vertical: 6,
              ),
            ),
          ),
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: colorTheme.surface,
        surfaceTintColor: colorTheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusUnit),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colorTheme.primary,
        selectionColor: colorTheme.primary.withOpacity(0.3),
        selectionHandleColor: colorTheme.primary,
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return colorTheme.textSecondary;
            }
            if (states.contains(WidgetState.selected)) {
              return colorTheme.primary;
            }
            return colorTheme.outlineVariant;
          },
        ),
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: colorTheme.surface,
        surfaceTintColor: colorTheme.surface,
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: colorTheme.surface,
      ),
      indicatorColor: colorTheme.primary,
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: Colors.transparent,
        backgroundColor: colorTheme.background,
        surfaceTintColor: colorTheme.background,
        shadowColor: colorTheme.primary,
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return textTheme.labelSm.copyWith(
                color: colorTheme.primary,
              );
            } else {
              return textTheme.labelSm.copyWith(
                color: colorTheme.textSecondary,
              );
            }
          },
        ),
        iconTheme: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return IconThemeData(color: colorTheme.primary);
            } else {
              return IconThemeData(color: colorTheme.textSecondary);
            }
          },
        ),
      ),
      listTileTheme: ListTileThemeData(
        dense: true,
        titleTextStyle: textTheme.bodySm,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: spacingUnit * 3,
        ),
        minVerticalPadding: 0,
        visualDensity: VisualDensity.compact,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        contentTextStyle: textTheme.labelSm.copyWith(
          color: colorTheme.textSecondary,
        ),
        backgroundColor: colorTheme.background,
        actionTextColor: colorTheme.textSecondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadiusUnit,
          ),
        ),
        elevation: 1,
      ),
      dialogTheme: DialogTheme(
        backgroundColor: colorTheme.background,
        surfaceTintColor: colorTheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadiusUnit * 2,
          ),
        ),
      ),
    );
    return AppThemeData(
      mode: themeMode,
      materialThemeData: materialThemeData,
      colorTheme: colorTheme,
      textTheme: textTheme,
    );
  }
}
