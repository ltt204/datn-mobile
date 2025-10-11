import 'package:flutter/material.dart';

class Labeled extends StatelessWidget {
  final String label;
  final Widget child;
  const Labeled({super.key, required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: isDark ? Colors.grey[400] : Colors.grey.shade700,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 6),
        child,
      ],
    );
  }
}
