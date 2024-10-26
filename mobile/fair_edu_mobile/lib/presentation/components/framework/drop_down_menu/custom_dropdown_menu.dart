import 'package:fair_edu_mobile/presentation/components/framework/drop_down_menu/popup_menu_button.dart';
import 'package:fair_edu_mobile/presentation/components/theme/constants.dart';
import 'package:fair_edu_mobile/presentation/components/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:intersperse/intersperse.dart';

class CustomDropdownMenu<T> extends StatefulWidget {
  const CustomDropdownMenu({
    super.key,
    this.title,
    this.enabled = true,
    this.width,
    this.menuHeight,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.enableFilter = false,
    this.enableSearch = true,
    this.textStyle,
    this.textAlign = TextAlign.start,
    this.inputDecorationTheme,
    this.controller,
    this.initialSelection,
    this.onSelected,
    this.focusNode,
    this.expandedInsets,
    this.filterCallback,
    this.searchCallback,
    required this.dropdownMenuEntries,
    this.inputFormatters,
  });

  final String? title;
  final bool enabled;
  final double? width;
  final double? menuHeight;
  final Widget? label;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final bool enableFilter;
  final bool enableSearch;
  final TextStyle? textStyle;
  final TextAlign textAlign;
  final InputDecorationTheme? inputDecorationTheme;
  final TextEditingController? controller;
  final T? initialSelection;
  final ValueChanged<T?>? onSelected;
  final FocusNode? focusNode;
  final EdgeInsets? expandedInsets;
  final List<DropdownMenuEntry<T>> dropdownMenuEntries;
  final List<TextInputFormatter>? inputFormatters;
  final FilterCallback<T>? filterCallback;
  final SearchCallback<T>? searchCallback;

  @override
  State<CustomDropdownMenu<T>> createState() => _CustomDropdownMenuState<T>();
}

class _CustomDropdownMenuState<T> extends State<CustomDropdownMenu<T>> {
  late List<DropdownMenuEntry<T>> filteredEntries;
  TextEditingController? _localTextEditingController;
  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    super.initState();
    _localTextEditingController = widget.controller ?? TextEditingController();
    filteredEntries = widget.dropdownMenuEntries;
    final int index = filteredEntries.indexWhere(
      (entry) => entry.value == widget.initialSelection,
    );
    if (index != -1) {
      _localTextEditingController?.text = filteredEntries[index].label;
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _localTextEditingController?.dispose();
    }
    super.dispose();
  }

  List<DropdownMenuEntry<T>> filter(List<DropdownMenuEntry<T>> entries) {
    final String filterText =
        _localTextEditingController?.text.toLowerCase() ?? '';
    return entries
        .where((entry) => entry.label.toLowerCase().contains(filterText))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.enableFilter) {
      filteredEntries = widget.filterCallback
              ?.call(filteredEntries, _localTextEditingController!.text) ??
          filter(widget.dropdownMenuEntries);
    }

    return CompositedTransformTarget(
      link: _layerLink,
      child: Column(
        children: [
          if (widget.title != null)
            Row(
              children: [
                Text(
                  widget.title!,
                  style: AppTheme.of(context).textTheme.labelMd.copyWith(
                        color: AppTheme.of(context).colorTheme.textPrimary,
                      ),
                ),
              ],
            ),
          TextField(
            readOnly: true,
            controller: _localTextEditingController,
            textAlign: widget.textAlign,
            style: widget.textStyle,
            decoration: InputDecoration(
              label: widget.label,
              hintText: widget.hintText,
              helperText: widget.helperText,
              errorText: widget.errorText,
              border: const OutlineInputBorder(),
            ),
            onTap: () {
              final RenderBox textFieldBox =
                  context.findRenderObject() as RenderBox;
              final Offset textFieldPosition =
                  textFieldBox.localToGlobal(Offset.zero);
              final Size textFieldSize = textFieldBox.size;

              showMenu<T>(
                constraints: BoxConstraints(
                  minWidth: widget.width ?? textFieldSize.width,
                  maxWidth: widget.width ?? textFieldSize.width,
                  maxHeight: widget.menuHeight ?? double.infinity,
                ),
                context: context,
                position: RelativeRect.fromLTRB(
                  textFieldPosition.dx,
                  textFieldPosition.dy + textFieldSize.height,
                  textFieldPosition.dx + textFieldSize.width,
                  textFieldPosition.dy,
                ),
                items: filteredEntries
                    .map(
                      (entry) => CustomPopupMenuItem<T>(
                        value: entry.value,
                        child: SizedBox(
                          width: textFieldSize.width,
                          child: Text(entry.label),
                        ),
                      ),
                    )
                    .toList(),
                elevation: 8.0,
              ).then((T? value) {
                if (value != null) {
                  _localTextEditingController?.text = filteredEntries
                      .firstWhere((entry) => entry.value == value)
                      .label;
                  widget.onSelected?.call(value);
                }
              });
            },
          ),
        ].intersperse(const Gap(spacingUnit)).toList(),
      ),
    );
  }
}
