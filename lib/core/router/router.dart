import 'package:auto_route/auto_route.dart';
import 'package:datn_mobile/core/router/router.gr.dart';

/// This class used for defined routes and paths and other properties
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  late final List<AutoRoute> routes = [
    AutoRoute(
      page: MainWrapperRoute.page,
      initial: true,
      path: '/',
      children: [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: ProjectsRoute.page, path: 'projects'),
        AutoRoute(page: SettingRoute.page, path: 'settings'),
        AutoRoute(page: PlaceholderRouteSchedule.page, path: 'schedules'),
        AutoRoute(page: PlaceholderRouteAnnounce.page, path: 'announces'),
      ],
    ),
  ];
}
