import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:neo_canvas/core/navigation/app_routes_factory.dart';
import 'package:neo_canvas/core/navigation/navigation_module.dart';
import 'package:neo_canvas/core/network/data/internet_monitor.dart';
import 'package:neo_canvas/core/network/data/internet_status_provider_impl.dart';
import 'package:neo_canvas/core/network/domain/internet_status_provider.dart';
import 'package:neo_canvas/features/app/internet_snackbar_controller.dart';
import 'package:neo_canvas/features/notifications/notification_service.dart';

final getIt = GetIt.instance;

void initCore() {
  getIt.registerSingleton(NotificationService()..init());
  getIt.registerSingleton(const AppRouterFactory());
  getIt.registerSingleton(NavigationModule(getIt()));

  getIt.registerSingleton(Connectivity());
  getIt.registerSingleton(
    InternetMonitor()..init(),
    dispose: (param) => param.dispose(),
  );

  getIt.registerSingleton<InternetStatusProvider>(
    InternetStatusProviderImpl(getIt(), getIt())..init(),
    dispose: (param) {
      if (param is InternetStatusProviderImpl) {
        param.dispose();
      }
    },
  );

  getIt.registerSingleton(
    InternetSnackbarController(getIt())..init(),
    dispose: (param) => param.dispose(),
  );
}
