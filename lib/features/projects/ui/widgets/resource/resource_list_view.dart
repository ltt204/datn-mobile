import 'package:datn_mobile/features/projects/controllers/controller_provider.dart';
import 'package:datn_mobile/features/projects/ui/widgets/presentation/presentation_list_item.dart';
import 'package:datn_mobile/shared/riverpod_ext/async_value_easy_when.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResourceListView extends ConsumerStatefulWidget {
  final String resourceType;
  final VoidCallback onBack;

  const ResourceListView({
    super.key,
    required this.resourceType,
    required this.onBack,
  });

  @override
  ConsumerState<ResourceListView> createState() => _ResourceListViewState();
}

class _ResourceListViewState extends ConsumerState<ResourceListView> {
  String _sortOption = 'Date Modified';
  final List<String> _sortOptions = [
    'Date Modified',
    'Date Created',
    'Name (A-Z)',
    'Name (Z-A)',
  ];

  @override
  Widget build(BuildContext context) {
    // Only show presentations list for "Presentations" resource type
    if (widget.resourceType != 'Presentations') {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.construction, size: 64, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            Text(
              '${widget.resourceType} coming soon',
              style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: widget.onBack,
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back to Resources'),
            ),
          ],
        ),
      );
    }

    final presentationsAsync = ref.watch(presentationsControllerProvider);

    return presentationsAsync.easyWhen(
      data: (presentations) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with back button
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: widget.onBack,
              ),
              const SizedBox(width: 8),
              const Text(
                'Your Presentations',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Filter and Sort bar
          Row(
            children: [
              // Filter button
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Implement filter functionality
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Filter coming soon')),
                    );
                  },
                  icon: const Icon(Icons.filter_list),
                  label: const Text('Filter'),
                ),
              ),
              const SizedBox(width: 12),
              // Sort dropdown
              Expanded(
                child: PopupMenuButton<String>(
                  initialValue: _sortOption,
                  onSelected: (String value) {
                    setState(() {
                      _sortOption = value;
                    });
                    // TODO: Implement sort functionality
                  },
                  itemBuilder: (BuildContext context) => _sortOptions
                      .map(
                        (option) => PopupMenuItem<String>(
                          value: option,
                          child: Text(option),
                        ),
                      )
                      .toList(),
                  child: OutlinedButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.sort),
                    label: Text(_sortOption),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Presentations list
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await ref
                    .read(presentationsControllerProvider.notifier)
                    .refresh();
              },
              child: presentations.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.slideshow_outlined,
                            size: 64,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No presentations yet',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.separated(
                      itemCount: presentations.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final presentation = presentations[index];
                        return PresentationListItem(presentation: presentation);
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
