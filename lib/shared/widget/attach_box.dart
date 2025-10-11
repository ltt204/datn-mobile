import 'package:flutter/material.dart';
import 'dashed_container.dart';

class AttachBox extends StatelessWidget {
  final VoidCallback onAdd;
  const AttachBox({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return DashedContainer(
      borderRadius: 14,
      dashColor: isDark ? Colors.grey[600]! : const Color(0xFFD6D6D6),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isDark ? Colors.grey[850] : Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Attach resources (optional)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onAdd,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isDark
                          ? Colors.grey[800]
                          : const Color(0xFFF3F4F6),
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                        color: isDark
                            ? Colors.grey[700]!
                            : const Color(0xFFE6E6E6),
                      ),
                    ),
                    child: Text(
                      '+ Add',
                      style: TextStyle(
                        color: cs.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Attach PDFs, images or slides to ground\nthe generation.',
              style: TextStyle(
                color: isDark ? Colors.grey[400] : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
