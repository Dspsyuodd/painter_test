import 'package:get_it/get_it.dart';
import 'package:neo_canvas/core/navigation/app_routes_factory.dart';
import 'package:neo_canvas/core/navigation/navigation_module.dart';
import 'package:neo_canvas/features/auth/data/firebase_auth_service_impl.dart';
import 'package:neo_canvas/features/auth/data/firebase_user_provider.dart';
import 'package:neo_canvas/features/auth/domain/auth_manager.dart';
import 'package:neo_canvas/features/auth/domain/auth_navi_listener.dart';
import 'package:neo_canvas/features/auth/domain/auth_service.dart';
import 'package:neo_canvas/features/auth/domain/user_provider.dart';
import 'package:neo_canvas/features/auth/domain/view_models/login_view_model.dart';
import 'package:neo_canvas/features/auth/domain/view_models/register_view_model.dart';
import 'package:neo_canvas/features/images/data/firebase_image_repo.dart';
import 'package:neo_canvas/features/images/domain/images_controller.dart';
import 'package:neo_canvas/features/images/domain/images_repo.dart';
import 'package:neo_canvas/features/images/domain/view_models/gallery_view_model.dart';
import 'package:neo_canvas/features/images/domain/view_models/painter_view_model.dart';
import 'package:neo_canvas/features/notifications/notification_service.dart';

final getIt = GetIt.instance;

void initDependencies() {
  getIt.registerSingleton(NotificationService()..init());
  getIt.registerSingleton(const AppRouterFactory());
  getIt.registerSingleton(NavigationModule(getIt()));

  // Auth
  getIt.registerSingleton<UserProvider>(UserProvider());
  getIt.registerSingleton<AuthService>(FirebaseAuthServiceImpl());
  getIt.registerSingleton<AuthManager>(AuthManager(getIt(), getIt()));
  getIt.registerFactory(() => RegisterViewModel(getIt()));
  getIt.registerFactory(() => LoginViewModel(getIt(), getIt()));
  getIt.registerSingleton(
    FirebaseUserProvider(getIt<UserProvider>())..init(),
    dispose: (provider) => provider.dispose(),
  );
  getIt.registerSingleton(
    AuthNaviListener(getIt(), getIt())..init(),
    dispose: (provider) => provider.dispose(),
  );

  // Images
  getIt.registerSingleton<ImagesRepo>(FirebaseImagesRepo(getIt()));
  getIt.registerSingleton(
    ImagesController(getIt(), getIt(), getIt())..init(),
    dispose: (controller) => controller.dispose(),
  );
  getIt.registerFactory(
    () => GalleryViewModel(getIt(), getIt(), getIt())..init(),
  );
  getIt.registerFactory(() => PainterViewModel(getIt(), getIt()));
}
