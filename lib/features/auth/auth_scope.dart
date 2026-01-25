import 'package:get_it/get_it.dart';
import 'package:neo_canvas/features/auth/data/firebase_auth_service_impl.dart';
import 'package:neo_canvas/features/auth/data/firebase_user_provider.dart';
import 'package:neo_canvas/features/auth/domain/auth_manager.dart';
import 'package:neo_canvas/features/auth/domain/auth_navi_listener.dart';
import 'package:neo_canvas/features/auth/domain/auth_service.dart';
import 'package:neo_canvas/features/auth/domain/user_provider.dart';
import 'package:neo_canvas/features/auth/domain/view_models/login_view_model.dart';
import 'package:neo_canvas/features/auth/domain/view_models/register_view_model.dart';

void initAuth() {
  final getIt = GetIt.instance;

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
}
