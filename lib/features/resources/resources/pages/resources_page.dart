import 'package:auto_route/annotations.dart';
import 'package:datn_mobile/features/resources/resources/providers/presentation_providers.dart';
import 'package:datn_mobile/shared/widget/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ResourcesPage extends StatelessWidget {
  const ResourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presentations'),
      ),
      body: _ResourcesView(),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}

class _ResourcesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final presentationsAsync = ref.watch(presentationsControllerProvider);

        return presentationsAsync.when(
          data: (presentations) {
            return ListView.builder(
              itemCount: presentations.length,
              itemBuilder: (context, index) {
                final presentation = presentations[index];
                return ListTile(
                  title: Text(presentation.title),
                  subtitle: Text(presentation.title),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        );
      },
    );
  }
}
