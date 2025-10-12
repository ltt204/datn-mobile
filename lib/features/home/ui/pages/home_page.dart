import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:datn_mobile/features/home/ui/widgets/today_works_section.dart';
import 'package:datn_mobile/features/home/ui/widgets/my_classes_section.dart';
import 'package:datn_mobile/features/home/ui/widgets/recent_documents_section.dart';
import 'package:datn_mobile/shared/pods/translation_pod.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: _HomeView()));
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _HomeHeader(),
            SizedBox(height: 24),
            TodayWorksSection(),
            SizedBox(height: 32),
            MyClassesSection(),
            SizedBox(height: 32),
            RecentDocumentsSection(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _HomeHeader extends StatefulWidget {
  const _HomeHeader();

  @override
  State<_HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<_HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final t = ref.watch(translationsPod);

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              t.homeGreeting,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement upgrade plan action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink.shade50,
                foregroundColor: Colors.pink.shade700,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.keyboard_double_arrow_up,
                    size: 18,
                    color: Colors.pink.shade700,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    t.upgradePlan,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.pink.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
