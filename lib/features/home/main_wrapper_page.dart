import 'package:auto_route/auto_route.dart';
import 'package:datn_mobile/core/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

@RoutePage()
class MainWrapperPage extends StatelessWidget {
  const MainWrapperPage({super.key, this.title = 'Placeholder'});

  final String title;

  Widget _bottomItemActivated(
    IconData icon,
    String label,
    bool isActive,
    BuildContext context,
  ) {
    if (isActive) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                label,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Icon(
      icon,
      size: 20,
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [
        PlaceholderRoute(),
        const ProjectsRoute(),
        const SettingRoute(),
        PlaceholderRouteSchedule(),
        PlaceholderRouteAnnounce(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              icon: _bottomItemActivated(
                LucideIcons.house,
                "Home",
                false,
                context,
              ),
              activeIcon: _bottomItemActivated(
                LucideIcons.house,
                "Home",
                true,
                context,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: _bottomItemActivated(
                LucideIcons.folder,
                "Project",
                false,
                context,
              ),
              activeIcon: _bottomItemActivated(
                LucideIcons.folder,
                "Project",
                true,
                context,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: _bottomItemActivated(
                LucideIcons.calendarDays,
                "Schedule",
                false,
                context,
              ),
              activeIcon: _bottomItemActivated(
                LucideIcons.calendarDays,
                "Schedule",
                true,
                context,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: _bottomItemActivated(
                LucideIcons.bell,
                "Notification",
                false,
                context,
              ),
              activeIcon: _bottomItemActivated(
                LucideIcons.bell,
                "Notification",
                true,
                context,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: _bottomItemActivated(
                LucideIcons.user,
                "Profile",
                false,
                context,
              ),
              activeIcon: _bottomItemActivated(
                LucideIcons.user,
                "Profile",
                true,
                context,
              ),
              label: "",
            ),
          ],
        );
      },
    );
  }
}
