import 'package:datn_mobile/features/projects/controllers/controller_provider.dart';
import 'package:datn_mobile/features/projects/ui/widgets/presentation/presentation_card.dart';
import 'package:datn_mobile/features/projects/ui/widgets/resource/resource_types_list.dart';
import 'package:datn_mobile/shared/riverpod_ext/async_value_easy_when.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectsRow extends ConsumerWidget {
  final Function(String) onResourceTypeSelected;

  const ProjectsRow({super.key, required this.onResourceTypeSelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presentationsAsync = ref.watch(presentationsControllerProvider);

    return presentationsAsync.easyWhen(
      data: (presentations) => RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () async {
          await ref.read(presentationsControllerProvider.notifier).refresh();
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your recently works',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: presentations
                      .map(
                        (presentation) => Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: PresentationCard(presentation: presentation),
                        ),
                      )
                      .toList(),
                ),
              ),
              const Text(
                'Type of resources',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ResourceTypesList(onResourceTypeSelected: onResourceTypeSelected),
            ],
          ),
        ),
      ),
    );
  }
}
