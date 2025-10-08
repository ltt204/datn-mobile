import 'package:datn_mobile/features/projects/domain/entity/resource_type.dart';
import 'package:flutter/material.dart';

class ResourceTypeCard extends StatelessWidget {
  final ResourceType resourceType;
  final VoidCallback onTap;

  const ResourceTypeCard({
    super.key,
    required this.resourceType,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: resourceType.color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                resourceType.icon,
                color: resourceType.color,
                size: 32,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              resourceType.label,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey.shade600,
            ),
          ],
        ),
      ),
    );
  }
}
