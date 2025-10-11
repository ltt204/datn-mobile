import 'package:flutter/material.dart';

class Pill extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;
  const Pill({
    super.key,
    required this.text,
    this.selected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;

    // Theme-aware colors
    final bg = selected
        ? (isDark
              ? primaryColor.withValues(alpha: 0.2)
              : const Color(0xFFEEF3FF))
        : (isDark ? Colors.grey[800]! : const Color(0xFFF3F4F6));

    final fg = selected
        ? primaryColor
        : (isDark ? Colors.grey[300]! : Colors.black87);

    final borderColor = selected
        ? (isDark
              ? primaryColor.withValues(alpha: 0.5)
              : const Color(0xFFBBD2FF))
        : (isDark ? Colors.grey[700]! : const Color(0xFFE6E6E6));

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: borderColor),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: fg,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
