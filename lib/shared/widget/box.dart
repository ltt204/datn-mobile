import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final Widget child;
  const Box({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[850] : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : const Color(0xFFE6E6E6),
        ),
      ),
      child: child,
    );
  }
}
