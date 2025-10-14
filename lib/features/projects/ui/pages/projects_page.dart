import 'package:auto_route/auto_route.dart';
import 'package:datn_mobile/core/router/router.gr.dart';
import 'package:datn_mobile/features/projects/ui/widgets/common/projects_row.dart';
import 'package:datn_mobile/shared/pods/translation_pod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

@RoutePage()
class ProjectsPage extends ConsumerWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsPod);

    return Scaffold(
      appBar: AppBar(title: Text(t.projects.title)),
      body: const _ProjectsView(),
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

class _ProjectsView extends ConsumerStatefulWidget {
  const _ProjectsView();

  @override
  ConsumerState<_ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends ConsumerState<_ProjectsView> {
  void _onResourceTypeSelected(String resourceType) {
    context.router.push(ResourceListRoute(resourceType: resourceType));
  }

  @override
  Widget build(BuildContext context) {
    final t = ref.watch(translationsPod);

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
                leading: const Icon(LucideIcons.search),
                hintText: t.projects.search_hint,
              );
            },
            suggestionsBuilder:
                (BuildContext context, SearchController controller) {
                  return List<ListTile>.generate(5, (int index) {
                    final String item = 'item $index';
                    return ListTile(
                      title: Text(item),
                      onTap: () {
                        // TODO: Implement search functionality
                      },
                    );
                  });
                },
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ProjectsRow(onResourceTypeSelected: _onResourceTypeSelected),
          ),
        ],
      ),
    );
  }
}
