import 'package:flutter/material.dart';

/// A generic bottom sheet for selecting from a list of options
class OptionBottomSheet<T> extends StatelessWidget {
  const OptionBottomSheet({
    super.key,
    required this.title,
    required this.options,
    required this.currentValue,
    required this.onOptionSelected,
    this.getOptionLabel,
    this.getOptionIcon,
    this.getOptionDescription,
  });

  /// The title displayed at the top of the bottom sheet
  final String title;

  /// List of available options
  final List<T> options;

  /// The currently selected value
  final T currentValue;

  /// Callback when an option is selected
  final Future<void> Function(T value) onOptionSelected;

  /// Function to get the display label for an option
  /// If not provided, uses toString()
  final String Function(T option)? getOptionLabel;

  /// Function to get the icon for an option
  final IconData Function(T option)? getOptionIcon;

  /// Function to get the description for an option
  final String? Function(T option)? getOptionDescription;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(),
            ...options.map((option) {
              final isSelected = option == currentValue;
              final label = getOptionLabel?.call(option) ?? option.toString();
              final icon = getOptionIcon?.call(option);
              final description = getOptionDescription?.call(option);

              return ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                leading: icon != null
                    ? Icon(
                        icon,
                        color: isSelected
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).iconTheme.color,
                      )
                    : null,
                title: Text(
                  label,
                  style: TextStyle(
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : null,
                  ),
                ),
                subtitle: description != null
                    ? Text(
                        description,
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    : null,
                trailing: isSelected
                    ? Icon(
                        Icons.check_circle,
                        color: Theme.of(context).colorScheme.primary,
                      )
                    : null,
                onTap: () async {
                  await onOptionSelected(option);
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
              );
            }),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

/// Helper function to show an option bottom sheet
Future<void> showOptionBottomSheet<T>({
  required BuildContext context,
  required String title,
  required List<T> options,
  required T currentValue,
  required Future<void> Function(T value) onOptionSelected,
  String Function(T option)? getOptionLabel,
  IconData Function(T option)? getOptionIcon,
  String? Function(T option)? getOptionDescription,
}) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => OptionBottomSheet<T>(
      title: title,
      options: options,
      currentValue: currentValue,
      onOptionSelected: onOptionSelected,
      getOptionLabel: getOptionLabel,
      getOptionIcon: getOptionIcon,
      getOptionDescription: getOptionDescription,
    ),
  );
}
