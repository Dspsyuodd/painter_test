import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neo_canvas/core/di/di.dart';
import 'package:neo_canvas/core/navigation/navigation_module.dart';
import 'package:neo_canvas/core/ui/theme.dart';
import 'package:neo_canvas/features/app/internet_snackbar_controller.dart';
import 'package:neo_canvas/features/auth/auth_scope.dart';
import 'package:neo_canvas/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initCore();
  initAuth();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final snackbarController = getIt<InternetSnackbarController>();
    return MaterialApp.router(
      scaffoldMessengerKey: snackbarController.messengerKey,
      title: 'Flutter Demo',
      theme: appTheme,
      routerConfig: getIt<NavigationModule>().routerConfig,
    );
  }
}
