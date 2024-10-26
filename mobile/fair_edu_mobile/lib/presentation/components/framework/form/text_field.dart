import 'dart:ui';

import 'package:fair_edu_mobile/presentation/components/theme/constants.dart';
import 'package:fair_edu_mobile/presentation/components/theme/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

class CustomTextFormField extends TextFormField {
  CustomTextFormField({
    super.key,
    super.controller,
    super.autocorrect,
    super.autofillHints,
    super.autovalidateMode,
    super.autofocus,
    super.buildCounter,
    super.canRequestFocus,
    super.clipBehavior,
    super.contentInsertionConfiguration,
    super.contextMenuBuilder = _defaultContextMenuBuilder,
    super.cursorColor,
    double? cursorHeight,
    super.cursorOpacityAnimates,
    super.cursorRadius,
    super.cursorWidth,
    super.decoration,
    super.dragStartBehavior,
    super.enableIMEPersonalizedLearning,
    super.enableInteractiveSelection,
    super.enableSuggestions,
    super.enabled,
    super.expands,
    super.focusNode,
    super.initialValue,
    super.inputFormatters,
    super.keyboardAppearance,
    super.keyboardType,
    super.magnifierConfiguration,
    super.maxLength,
    super.maxLengthEnforcement,
    super.maxLines,
    super.minLines,
    super.mouseCursor,
    super.obscureText,
    super.obscuringCharacter,
    super.onAppPrivateCommand,
    super.onChanged,
    super.onEditingComplete,
    super.onFieldSubmitted,
    super.onSaved,
    super.onTap,
    super.onTapOutside,
    super.readOnly,
    super.restorationId,
    super.scribbleEnabled,
    super.scrollController,
    super.scrollPadding = EdgeInsets.zero,
    super.scrollPhysics,
    super.selectionControls,
    super.selectionHeightStyle = BoxHeightStyle.strut,
    super.selectionWidthStyle,
    super.showCursor,
    super.smartDashesType,
    super.smartQuotesType,
    super.spellCheckConfiguration,
    super.strutStyle,
    TextStyle? style,
    super.textAlign,
    TextAlignVertical? textAlignVertical,
    super.textCapitalization,
    super.textDirection,
    super.textInputAction,
    super.toolbarOptions,
    super.undoController,
    super.validator,
  }) : super(
          textAlignVertical: textAlignVertical ?? TextAlignVertical.center,
          // bodyMd
          cursorHeight: cursorHeight ?? 18,
        );

  static Widget _defaultContextMenuBuilder(
    BuildContext context,
    EditableTextState editableTextState,
  ) {
    return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }
}

const _fullLengthCode = 65248;

extension JapaneseString on String {
  String alphanumericToHalfLength() {
    final regex = RegExp(r'^[Ａ-Ｚａ-ｚ０-９ ．]+$');
    final string = runes.map<String>((rune) {
      final char = String.fromCharCode(rune);
      return regex.hasMatch(char)
          ? String.fromCharCode(rune - _fullLengthCode)
          : char;
    });
    return string.join();
  }
}

class DecimalNumberFormatter extends TextInputFormatter {
  const DecimalNumberFormatter({
    this.min,
    this.max,
    this.decimalLength = 1,
    this.replaceLastIfExceeds = true,
  });
  final num? min;
  final num? max;
  final int decimalLength;
  final bool replaceLastIfExceeds;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (oldValue.text.isNotEmpty &&
        newValue.text.startsWith('0') &&
        !newValue.text.contains('.')) {
      return newValue.replaced(const TextRange(start: 0, end: 1), '');
    }

    if (!newValue.text.startsWith('.') &&
        newValue.text.contains('.') &&
        !oldValue.text.contains('.')) {
      return newValue;
    } else if (newValue.text.isEmpty) {
      return newValue;
    }

    final q = double.tryParse(newValue.text);
    if (q != null) {
      if (min != null && max != null) {
        if (!(q >= min! && q <= max!)) return oldValue;
      } else if (min != null) {
        if (!(q >= min!)) return oldValue;
      } else if (max != null) {
        if (!(q <= max!)) return oldValue;
      }

      final decimalDigital = newValue.text.split('.').last;
      if (newValue.text.contains('.') &&
          decimalDigital.length > decimalLength) {
        if (replaceLastIfExceeds) {
          final text = oldValue.text.replaceRange(
            oldValue.text.length - 1,
            oldValue.text.length,
            decimalDigital.characters.last,
          );
          return oldValue.copyWith(text: text);
        } else {
          return oldValue;
        }
      } else {
        return newValue;
      }
    } else {
      return oldValue;
    }
  }
}

class RegExpValidator extends TextFieldValidator {
  RegExpValidator(
    this.pattern, {
    required String errorText,
  }) : super(errorText);

  @override
  bool get ignoreEmptyValues => false;

  final RegExp pattern;

  @override
  bool isValid(String? value) => pattern.hasMatch(value!);
}

class CustomEmailValidator extends MultiValidator {
  CustomEmailValidator()
      : super([
          RequiredValidator(errorText: 'メールアドレスを入力してください'),
          EmailValidator(errorText: 'メールアドレスの形式が正しくありません'),
        ]);
}

class CustomPasswordValidator extends MultiValidator {
  CustomPasswordValidator()
      : super([
          RequiredValidator(errorText: 'パスワードを入力してください'),
          MinLengthValidator(
            6,
            errorText: 'パスワードは6文字以上で入力してください',
          ),
        ]);
}

class PhoneNumberValidator extends TextFieldValidator {
  PhoneNumberValidator({String errorText = '電話番号の形式が正しくありません'})
      : super(errorText);

  @override
  bool get ignoreEmptyValues => true;

  @override
  bool isValid(String? value) {
    if (value == null) return false;
    final parsed = PhoneNumber.parse(value, callerCountry: IsoCode.JP);
    return parsed.isValid();
  }
}

class TextFormFieldWithTitle extends ConsumerWidget {
  const TextFormFieldWithTitle({
    super.key,
    this.title,
    this.description,

    /// TextFormFiled
    this.controller,
    this.initialValue,
    this.focusNode,
    this.decoration = const InputDecoration(),
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.autofocus = false,
    this.readOnly = false,
    this.showCursor,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLengthEnforcement,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onTapAlwaysCalled = false,
    this.onTapOutside,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.cursorErrorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection,
    this.selectionControls,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.autovalidateMode,
    this.scrollController,
    this.restorationId,
    this.enableIMEPersonalizedLearning = true,
    this.mouseCursor,
    this.contextMenuBuilder = _defaultContextMenuBuilder,
    this.spellCheckConfiguration,
    this.magnifierConfiguration,
    this.undoController,
    this.onAppPrivateCommand,
    this.cursorOpacityAnimates,
    this.selectionHeightStyle = BoxHeightStyle.tight,
    this.selectionWidthStyle = BoxWidthStyle.tight,
    this.dragStartBehavior = DragStartBehavior.start,
    this.contentInsertionConfiguration,
    this.clipBehavior = Clip.hardEdge,
    this.scribbleEnabled = true,
    this.canRequestFocus = true,
    this.height,
    this.validator,
  });

  final String? title;
  final String? description;

  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final bool? showCursor;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final bool onTapAlwaysCalled;
  final TapRegionCallback? onTapOutside;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Color? cursorErrorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;
  final ScrollController? scrollController;
  final String? restorationId;
  final bool enableIMEPersonalizedLearning;
  final MouseCursor? mouseCursor;
  final EditableTextContextMenuBuilder? contextMenuBuilder;
  final SpellCheckConfiguration? spellCheckConfiguration;
  final TextMagnifierConfiguration? magnifierConfiguration;
  final UndoHistoryController? undoController;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final bool? cursorOpacityAnimates;
  final BoxHeightStyle selectionHeightStyle;
  final BoxWidthStyle selectionWidthStyle;
  final DragStartBehavior dragStartBehavior;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final Clip clipBehavior;
  final bool scribbleEnabled;
  final bool canRequestFocus;
  final double? height;
  final String? Function(String?)? validator;

  static Widget _defaultContextMenuBuilder(
    BuildContext context,
    EditableTextState editableTextState,
  ) {
    return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: appTheme.textTheme.labelMd.copyWith(
              color: appTheme.colorTheme.textPrimary,
            ),
          ),
          const Gap(spacingUnit),
        ],
        if (description != null) ...[
          Text(
            description!,
            style: appTheme.textTheme.bodySm.copyWith(
              color: appTheme.colorTheme.textSecondary,
            ),
          ),
          const Gap(
            spacingUnit,
          ),
        ],
        CustomTextFormField(
          key: key,
          controller: controller,
          initialValue: initialValue,
          focusNode: focusNode,
          decoration: decoration,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          textInputAction: textInputAction,
          style: style ??
              (enabled ?? true
                  ? appTheme.textTheme.bodySm.copyWith(
                      height: 20 / appTheme.textTheme.bodyMd.fontSize!,
                    )
                  : appTheme.textTheme.bodySm.copyWith(
                      color: appTheme.colorTheme.textSecondary,
                      height: 20 / appTheme.textTheme.bodyMd.fontSize!,
                    )),
          strutStyle: strutStyle,
          textDirection: textDirection,
          textAlign: textAlign,
          textAlignVertical: textAlignVertical,
          autofocus: autofocus,
          readOnly: readOnly,
          showCursor: showCursor,
          obscuringCharacter: obscuringCharacter,
          obscureText: obscureText,
          autocorrect: autocorrect,
          smartDashesType: smartDashesType,
          smartQuotesType: smartQuotesType,
          enableSuggestions: enableSuggestions,
          maxLengthEnforcement: maxLengthEnforcement,
          maxLines: maxLines,
          minLines: minLines,
          expands: expands,
          maxLength: maxLength,
          onChanged: onChanged,
          onTap: onTap,
          onTapOutside: onTapOutside,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          inputFormatters: inputFormatters,
          enabled: enabled,
          cursorWidth: cursorWidth,
          cursorHeight: cursorHeight ?? 16,
          cursorRadius: cursorRadius,
          cursorColor: cursorColor,
          keyboardAppearance: keyboardAppearance,
          scrollPadding: scrollPadding,
          enableInteractiveSelection: enableInteractiveSelection,
          selectionControls: selectionControls,
          buildCounter: buildCounter,
          scrollPhysics: scrollPhysics,
          autofillHints: autofillHints,
          autovalidateMode: autovalidateMode,
          scrollController: scrollController,
          restorationId: restorationId,
          enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
          mouseCursor: mouseCursor,
          contextMenuBuilder: contextMenuBuilder,
          spellCheckConfiguration: spellCheckConfiguration,
          magnifierConfiguration: magnifierConfiguration,
          undoController: undoController,
          onAppPrivateCommand: onAppPrivateCommand,
          cursorOpacityAnimates: cursorOpacityAnimates,
          selectionHeightStyle: selectionHeightStyle,
          selectionWidthStyle: selectionWidthStyle,
          dragStartBehavior: dragStartBehavior,
          contentInsertionConfiguration: contentInsertionConfiguration,
          clipBehavior: clipBehavior,
          scribbleEnabled: scribbleEnabled,
          canRequestFocus: canRequestFocus,
          validator: validator,
        ),
      ],
    );
  }
}
