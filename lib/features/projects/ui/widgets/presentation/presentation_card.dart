import 'package:datn_mobile/features/projects/domain/entity/presentation_minimal.dart';
import 'package:datn_mobile/features/projects/enum/resource_type.dart';
import 'package:datn_mobile/features/projects/ui/widgets/common/abstract_resource_card.dart';
import 'package:datn_mobile/shared/pods/translation_pod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PresentationCard extends ConsumerWidget {
  final PresentationMinimal presentation;

  const PresentationCard({super.key, required this.presentation});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsPod);

    return AbstractDocumentCard(
      title: presentation.title ?? t.projects.untitled,
      createdAt: presentation.createdAt,
      resourceType: ResourceType.presentation,
    );
  }
}
