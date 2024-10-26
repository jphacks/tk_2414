import 'package:fair_edu_mobile/presentation/components/theme/constants.dart';
import 'package:fair_edu_mobile/presentation/components/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomIconDropdownMenu<T> extends HookConsumerWidget {
  const CustomIconDropdownMenu({
    super.key,
    this.readOnly = false,
    this.width,
    this.menuHeight,
    this.leadingIcon,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.enableFilter = false,
    this.enableSearch = true,
    this.textStyle,
    this.inputDecorationTheme,
    this.menuStyle,
    this.controller,
    this.initialSelection,
    this.onSelected,
    this.requestFocusOnTap,
    this.expandedInsets,
    this.searchCallback,
    this.title,
    required this.dropdownMenuEntries,
  });

  final bool readOnly;
  final double? width;
  final double? menuHeight;
  final Widget? leadingIcon;
  final Widget? label;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final bool enableFilter;
  final bool enableSearch;
  final TextStyle? textStyle;
  final InputDecorationTheme? inputDecorationTheme;
  final MenuStyle? menuStyle;
  final TextEditingController? controller;
  final T? initialSelection;
  final ValueChanged<T?>? onSelected;
  final bool? requestFocusOnTap;
  final List<DropdownMenuEntry<T>> dropdownMenuEntries;
  final EdgeInsets? expandedInsets;
  final SearchCallback<T>? searchCallback;
  final String? title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: [
          if (title != null)
            Row(
              children: [
                Text(
                  title!,
                  style: appTheme.textTheme.labelMd.copyWith(
                    color: appTheme.colorTheme.textPrimary,
                  ),
                ),
              ],
            ),
          const Gap(
            spacingUnit,
          ),
          Theme(
            data: Theme.of(context).copyWith(
              dropdownMenuTheme: Theme.of(context).dropdownMenuTheme.copyWith(
                    inputDecorationTheme: InputDecorationTheme(
                      constraints: BoxConstraints.tight(
                        const Size.fromHeight(spacingUnit * 4.5),
                      ),
                    ),
                    menuStyle: MenuStyle(
                      surfaceTintColor: WidgetStatePropertyAll(
                        appTheme.colorTheme.background,
                      ),
                      backgroundColor: WidgetStateProperty.all(
                        appTheme.colorTheme.background,
                      ),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(spacingUnit),
                        ),
                      ),
                      padding: const WidgetStatePropertyAll(
                        EdgeInsets.symmetric(
                          horizontal: spacingUnit,
                          vertical: spacingUnit,
                        ),
                      ),
                    ),
                  ),
            ),
            child: DropdownMenu<T>(
              key: key,
              enabled: !readOnly,
              width: width ?? constraints.maxWidth,
              menuHeight: menuHeight,
              leadingIcon: leadingIcon,
              trailingIcon: const PhosphorIcon(
                PhosphorIconsRegular.caretDown,
                size: spacingUnit * 2,
              ),
              selectedTrailingIcon: const PhosphorIcon(
                PhosphorIconsRegular.caretUp,
                size: spacingUnit * 2,
              ),
              label: label,
              hintText: hintText,
              helperText: helperText,
              errorText: errorText,
              enableFilter: enableFilter,
              enableSearch: enableSearch,
              textStyle: textStyle,
              inputDecorationTheme: inputDecorationTheme,
              menuStyle: menuStyle,
              controller: controller,
              initialSelection: initialSelection,
              onSelected: onSelected,
              requestFocusOnTap: requestFocusOnTap,
              expandedInsets: expandedInsets,
              searchCallback: searchCallback,
              dropdownMenuEntries: dropdownMenuEntries,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDropdownMenuEntry<T> extends DropdownMenuEntry<T> {
  CustomDropdownMenuEntry({
    required BuildContext context,
    super.labelWidget,
    super.leadingIcon,
    super.trailingIcon,
    super.enabled,
    ButtonStyle? style,
    required super.value,
    required super.label,
  }) : super(
          style: style ??
              ButtonStyle(
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(
                    vertical: spacingUnit,
                    horizontal: spacingUnit * 2,
                  ),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      borderRadiusUnit,
                    ),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(
                  AppTheme.of(context).colorTheme.background,
                ),
                textStyle: WidgetStateProperty.all(
                  AppTheme.of(context).textTheme.bodyMd.copyWith(
                        color: AppTheme.of(context).colorTheme.textPrimary,
                      ),
                ),
              ),
        );
}
