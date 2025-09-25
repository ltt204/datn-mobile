import 'package:datn_mobile/features/resources/data/dto/presentation_minimal_dto.dart';
import 'package:datn_mobile/features/resources/enum/resource_type.dart';
import 'package:datn_mobile/features/resources/ui/widgets/common/abstract_resource_card.dart';
import 'package:flutter/material.dart';

class PresentationCard extends StatelessWidget {
  final PresentationMinimalDto presentation;

  const PresentationCard({super.key, required this.presentation});

  @override
  Widget build(BuildContext context) {
    return AbstractResourceCard(
      title: presentation.title ?? "Untitled",
      createdAt: presentation.createdAt,
      resourceType: ResourceType.presentation,
    );
  }
}
