import 'package:datn_mobile/features/projects/domain/entity/resource_type.dart';
import 'package:datn_mobile/features/projects/ui/widgets/resource/resource_type_card.dart';
import 'package:flutter/material.dart';

class ResourceTypesList extends StatelessWidget {
  final Function(String) onResourceTypeSelected;

  const ResourceTypesList({super.key, required this.onResourceTypeSelected});

  @override
  Widget build(BuildContext context) {
    final resourceTypes = ResourceType.allTypes;

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: resourceTypes.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final resourceType = resourceTypes[index];
        return ResourceTypeCard(
          resourceType: resourceType,
          onTap: () => onResourceTypeSelected(resourceType.label),
        );
      },
    );
  }
}
