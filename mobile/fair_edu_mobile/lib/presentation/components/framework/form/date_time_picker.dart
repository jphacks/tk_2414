import 'package:fair_edu_mobile/presentation/components/framework/form/text_field.dart';
import 'package:fair_edu_mobile/presentation/components/theme/constants.dart';
import 'package:fair_edu_mobile/presentation/components/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:time_machine/time_machine.dart';

extension LocalTimeTimeOfDayEx on LocalTime {
  TimeOfDay get timeOfDay => TimeOfDay(hour: hourOfDay, minute: minuteOfHour);

  static LocalTime fromTimeOfDay(TimeOfDay timeOfDay) =>
      LocalTime(timeOfDay.hour, timeOfDay.minute, 0);
}

class DatePickerFormField extends HookConsumerWidget {
  const DatePickerFormField({
    super.key,
    this.readOnly = false,
    this.initialValue,
    this.firstDate,
    this.lastDate,
    this.onChanged,
    this.format = defaultFormat,
    this.labelText,
    this.hintText,
  });

  static const defaultFormat = 'yyyy/MM/dd';

  final bool readOnly;
  final LocalDate? initialValue;
  final LocalDate? firstDate;
  final LocalDate? lastDate;
  final ValueChanged<LocalDate?>? onChanged;
  final String format;

  final String? labelText;
  final String? hintText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);

    final formState = useState(initialValue);

    final controller =
        useTextEditingController(text: formState.value?.toString(format));

    useEffect(
      () {
        void listener() {
          final value = formState.value;
          if (value != null) {
            controller.text = value.toString(format);
          } else {
            controller.clear();
          }
          onChanged?.call(value);
        }

        formState.addListener(listener);

        return () {
          formState.removeListener(listener);
        };
      },
      [onChanged],
    );

    return CustomTextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: PhosphorIcon(
          PhosphorIconsBold.calendarBlank,
          color: appTheme.colorTheme.primary,
        ),
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
      readOnly: true,
      showCursor: false,
      onTap: readOnly
          ? null
          : () async {
              final picked = await showDatePicker(
                locale: const Locale('ja'),
                context: context,
                initialDate: initialValue?.atMidnight().toDateTimeLocal(),
                firstDate: (firstDate ?? LocalDate(1900, 1, 1))
                    .atMidnight()
                    .toDateTimeLocal(),
                lastDate:
                    (lastDate ?? LocalDate.maxIsoValue).toDateTimeUnspecified(),
              );
              if (picked != null) {
                formState.value = LocalDate.dateTime(picked);
              }
            },
    );
  }
}

class TimePickerFormField extends HookConsumerWidget {
  const TimePickerFormField({
    super.key,
    this.readOnly = false,
    this.initialValue,
    this.onChanged,
    this.format = defaultFormat,
    this.labelText,
    this.hintText,
  });

  static const defaultFormat = 'HH:mm';

  final bool readOnly;
  final LocalTime? initialValue;
  final ValueChanged<LocalTime?>? onChanged;
  final String format;

  final String? labelText;
  final String? hintText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);

    final formState = useState(initialValue);

    final controller =
        useTextEditingController(text: formState.value?.toString(format));

    useEffect(
      () {
        void listener() {
          final value = formState.value;
          if (value != null) {
            controller.text = value.toString(format);
          } else {
            controller.clear();
          }
          onChanged?.call(value);
        }

        formState.addListener(listener);

        return () {
          formState.removeListener(listener);
        };
      },
      [onChanged],
    );

    return CustomTextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: PhosphorIcon(
          PhosphorIconsBold.clock,
          color: appTheme.colorTheme.primary,
        ),
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
      readOnly: true,
      showCursor: false,
      onTap: readOnly
          ? null
          : () async {
              final picked = await showTimePicker(
                initialTime: formState.value?.timeOfDay ?? TimeOfDay.now(),
                context: context,
              );
              if (picked != null) {
                formState.value = LocalTimeTimeOfDayEx.fromTimeOfDay(picked);
              }
            },
    );
  }
}

class DateTimePickerForm extends HookConsumerWidget {
  const DateTimePickerForm({
    super.key,
    this.readOnly = false,
    required this.dateFormLabel,
    this.dateFormat,
    required this.timeFormLabel,
    required this.initialValue,
    this.onChanged,
  });

  final bool readOnly;
  final String dateFormLabel;
  final String? dateFormat;
  final String timeFormLabel;
  final LocalDateTime? initialValue;
  final ValueChanged<LocalDateTime?>? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = useState(initialValue);

    useEffect(
      () {
        void listener() {
          onChanged?.call(formState.value);
        }

        formState.addListener(listener);

        return () {
          formState.removeListener(listener);
        };
      },
      [onChanged],
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: DatePickerFormField(
            readOnly: readOnly,
            initialValue: formState.value?.calendarDate,
            format: dateFormat ?? DatePickerFormField.defaultFormat,
            labelText: dateFormLabel,
            onChanged: (value) {
              final currentValue = formState.value ?? LocalDateTime.now();
              formState.value = (value ?? LocalDateTime.now().calendarDate)
                  .at(currentValue.clockTime);
            },
          ),
        ),
        const Gap(spacingUnit * 2),
        Expanded(
          flex: 2,
          child: TimePickerFormField(
            readOnly: readOnly,
            initialValue: formState.value?.clockTime,
            labelText: timeFormLabel,
            onChanged: (value) {
              final currentValue = formState.value ?? LocalDateTime.now();
              formState.value = currentValue.calendarDate
                  .at(value ?? LocalDateTime.now().clockTime);
            },
          ),
        ),
      ],
    );
  }
}
