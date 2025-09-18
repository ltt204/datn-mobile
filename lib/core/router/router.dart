import 'package:auto_route/auto_route.dart';
import 'package:datn_mobile/core/router/router.gr.dart';

/// This class used for defined routes and paths and other properties
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  late final List<AutoRoute> routes = [
    AutoRoute(
      page: ResourcesRoute.page,
      path: '/resources',
    ),
    AutoRoute(
      page: SettingRoute.page,
      path: '/settings',
      initial: true,
    ),
  ];
}
