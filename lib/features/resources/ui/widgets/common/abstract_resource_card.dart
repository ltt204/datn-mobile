import 'package:datn_mobile/features/resources/enum/resource_type.dart';
import 'package:datn_mobile/features/resources/ui/widgets/common/thumbnail.dart';
import 'package:flutter/material.dart';

class AbstractResourceCard extends StatelessWidget {
  const AbstractResourceCard({
    super.key,
    required this.title,
    this.description,
    this.createdAt,
    this.thumbnail,
    this.onTap,
    required this.resourceType,
  });

  final String title;
  final String? description;
  final String? thumbnail;
  final DateTime? createdAt;
  final VoidCallback? onTap;
  final ResourceType resourceType;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 4,
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                child: thumbnail == null
                    ? DefaultThumbnail(resourceIcon: resourceType.lucideIcon)
                    : const Thumbnail(),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (description != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      description!,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                  if (createdAt != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      'Created at: ${createdAt!.toLocal().toIso8601String()}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                  Text("Type: ${resourceType.getValue()}"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
