import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SegmentedButtonSingle<T> extends HookConsumerWidget {
  const SegmentedButtonSingle({
    super.key,
    this.readOnly = false,
    required this.initialValue,
    required this.values,
    this.labelGetter,
    this.onChanged,
  });

  final bool readOnly;
  final T? initialValue;
  final Set<T> values;
  final String Function(T)? labelGetter;
  final ValueChanged<T?>? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = useState<T?>(initialValue);

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
      [initialValue, onChanged],
    );

    return SegmentedButton<T>(
      showSelectedIcon: false,
      selected: {
        if (formState.value != null) formState.value!,
      },
      segments: values
          .map(
            (e) => ButtonSegment(
              value: e,
              label: Text(labelGetter?.call(e) ?? e.toString()),
            ),
          )
          .toList(),
      onSelectionChanged: (values) {
        if (readOnly) {
          return;
        }
        formState.value = values.firstOrNull;
      },
      emptySelectionAllowed: true,
    );
  }
}
