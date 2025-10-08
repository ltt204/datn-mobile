import 'package:auto_route/auto_route.dart';
import 'package:datn_mobile/core/router/router.gr.dart';
import 'package:datn_mobile/features/projects/ui/widgets/common/projects_row.dart';
import 'package:datn_mobile/features/projects/ui/widgets/resource/resource_list_view.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Presentations')),
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

class _ProjectsView extends StatefulWidget {
  const _ProjectsView();

  @override
  State<_ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<_ProjectsView> {
  String? selectedResourceType;

  void _onResourceTypeSelected(String resourceType) {
    setState(() {
      selectedResourceType = resourceType;
    });
  }

  void _onBackToResourceTypes() {
    setState(() {
      selectedResourceType = null;
    });
  }

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
                        // TODO: Implement search functionality
                      },
                    );
                  });
                },
          ),
          const SizedBox(height: 16),
          Expanded(
            child: selectedResourceType == null
                ? ProjectsRow(onResourceTypeSelected: _onResourceTypeSelected)
                : ResourceListView(
                    resourceType: selectedResourceType!,
                    onBack: _onBackToResourceTypes,
                  ),
          ),
        ],
      ),
    );
  }
}
