import 'package:flutter/material.dart';

class FakeDropdown<T> extends StatelessWidget {
  final T value;
  final List<T> items;
  final ValueChanged<T?> onChanged;
  const FakeDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderColor = isDark ? Colors.grey[700]! : const Color(0xFFE6E6E6);

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: borderColor),
    );

    return DropdownButtonFormField<T>(
      initialValue: value,
      items: items
          .map((e) => DropdownMenuItem<T>(value: e, child: Text('$e')))
          .toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        border: border,
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
        suffixIcon: const Padding(
          padding: EdgeInsets.only(right: 8),
          child: Text('▾', textAlign: TextAlign.center),
        ),
        suffixIconConstraints: const BoxConstraints.tightFor(width: 30),
      ),
    );
  }
}
