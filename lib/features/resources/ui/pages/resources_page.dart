import 'package:auto_route/annotations.dart';
import 'package:datn_mobile/features/resources/ui/providers/presentation_providers.dart';
import 'package:datn_mobile/features/resources/ui/widgets/presentation/presentation_card.dart';
import 'package:datn_mobile/shared/riverpod_ext/async_value_easy_when.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ResourcesPage extends StatelessWidget {
  const ResourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Presentations')),
      body: _ResourcesView(),
      // bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}

class _ResourcesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final presentationsAsync = ref.watch(presentationsControllerProvider);

        return presentationsAsync.easyWhen(
          data: (presentations) {
            return SingleChildScrollView(
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
            );
          },
        );
      },
    );
  }
}
