import 'package:auto_route/auto_route.dart';
import 'package:datn_mobile/core/router/router.gr.dart';
import 'package:datn_mobile/features/projects/controllers/controller_provider.dart';
import 'package:datn_mobile/features/projects/ui/widgets/presentation/presentation_card.dart';
import 'package:datn_mobile/shared/riverpod_ext/async_value_easy_when.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Presentations')),
      body: _ProjectsView(),
      floatingActionButton: SizedBox(
        width: 96,
        height: 96,
        child: FloatingActionButton(
          onPressed: () {
            context.router.push(const PresentationRoute());
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: const CircleBorder(),
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightElevation: 0,
          child: ClipOval(
            child: Image.asset(
              'assets/floating_button_icon.png',
              width: 96,
              height: 96,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      // bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}

class _ProjectsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchAnchor(
            builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                controller: controller,
                padding: const WidgetStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0),
                ),
                onTap: () {
                  controller.openView();
                },
                onChanged: (_) {
                  controller.openView();
                },
                leading: const Icon(Icons.search),
                hintText: 'Search projects...',
              );
            },
            suggestionsBuilder:
                (BuildContext context, SearchController controller) {
                  return List<ListTile>.generate(5, (int index) {
                    final String item = 'item $index';
                    return ListTile(
                      title: Text(item),
                      onTap: () {
                        // setState(() {
                        //   controller.closeView(item);
                        // });
                      },
                    );
                  });
                },
          ),
          const SizedBox(height: 16),
          const _ProjectsRow(),
        ],
      ),
    );
  }
}

class _ProjectsRow extends ConsumerWidget {
  const _ProjectsRow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presentationsAsync = ref.watch(presentationsControllerProvider);

    return presentationsAsync.easyWhen(
      data: (presentations) => RefreshIndicator(
        onRefresh: () async {
          await ref.read(presentationsControllerProvider.notifier).refresh();
        },
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
          ],
        ),
      ),
    );
  }
}
