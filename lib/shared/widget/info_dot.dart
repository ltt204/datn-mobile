import 'package:flutter/material.dart';

class InfoDot extends StatelessWidget {
  final VoidCallback onTap;
  const InfoDot({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: isDark
              ? primaryColor.withValues(alpha: 0.2)
              : const Color(0xFFEEF3FF),
          border: Border.all(
            color: isDark
                ? primaryColor.withValues(alpha: 0.5)
                : const Color(0xFFBBD2FF),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          'i',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
