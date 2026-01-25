import 'package:get_it/get_it.dart';
import 'package:neo_canvas/core/navigation/app_routes_factory.dart';
import 'package:neo_canvas/core/navigation/navigation_module.dart';
import 'package:neo_canvas/features/notifications/notification_service.dart';

final getIt = GetIt.instance;

void initCore() {
  getIt.registerSingleton(NotificationService()..init());
  getIt.registerSingleton(const AppRouterFactory());
  getIt.registerSingleton(NavigationModule(getIt()));
}
