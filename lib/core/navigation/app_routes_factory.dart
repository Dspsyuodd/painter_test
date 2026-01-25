import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:neo_canvas/core/di/di.dart';
import 'package:neo_canvas/features/app/splash.dart';
import 'package:neo_canvas/features/auth/domain/user_provider.dart';
import 'package:neo_canvas/features/auth/ui/auth_screen.dart';
import 'package:neo_canvas/features/auth/ui/registration_screen.dart';
import 'package:neo_canvas/features/images/images_scope.dart';
import 'package:neo_canvas/features/images/ui/gallery_screen.dart';
import 'package:neo_canvas/features/images/ui/painter_screen.dart';
import 'app_routes.dart';

class AppRouterFactory {
  const AppRouterFactory();

  GoRouter createRouter() {
    return GoRouter(
      redirect: _appRedirect,
      routes: [
        GoRoute(
          path: AppRoutes.splash.path,
          builder: (context, state) => const Splash(),
        ),
        GoRoute(
          path: AppRoutes.auth.path,
          builder: (context, state) => const AuthScreen(),
          redirect: _redirectIfAuthorized,
        ),
        GoRoute(
          path: AppRoutes.registration.path,
          builder: (context, state) => const RegistrationScreen(),
          redirect: _redirectIfAuthorized,
        ),
        ShellRoute(
          builder: (context, state, child) => ImagesScope(child: child),
          routes: [
            GoRoute(
              path: AppRoutes.main.path,
              builder: (context, state) => const GalleryScreen(),
            ),
            GoRoute(
              path: AppRoutes.painter.path,
              pageBuilder: (context, state) {
                final initialImage = state.extra as File?;
                return CupertinoPage(
                  child: PainterScreen(initialImage: initialImage),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  String? _appRedirect(BuildContext context, GoRouterState state) {
    final route = AppRoutes.pathMap[state.uri.path];
    if (route == null) {
      return AppRoutes.defaultRoute.path;
    }
    final authRequired = route.authRequired;

    final userProvider = getIt<UserProvider>();

    if (authRequired && userProvider.user == null) {
      return AppRoutes.auth.path;
    }

    return null;
  }

  String? _redirectIfAuthorized(
    BuildContext context,
    GoRouterState state,
  ) {
    final userProvider = getIt<UserProvider>();
    if (userProvider.user != null) {
      return AppRoutes.main.path;
    }
    return null;
  }
}
