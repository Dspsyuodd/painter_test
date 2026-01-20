import 'dart:io';

import 'package:flutter/material.dart';
import 'package:neo_canvas/core/navigation/app_routes.dart';
import 'package:neo_canvas/core/navigation/app_routes_factory.dart';

class NavigationModule {
  final AppRouterFactory _appRouterFactory;

  late final _goRouter = _appRouterFactory.createRouter();

  NavigationModule(this._appRouterFactory);

  RouterConfig<Object> get routerConfig => _goRouter;

  void auth() {
    _goRouter.go(AppRoutes.auth.path);
  }

  void main() {
    _goRouter.go(AppRoutes.main.path);
  }

  void painter({File? initialImage}) {
    _goRouter.push(AppRoutes.painter.path, extra: initialImage);
  }

  void registration() {
    _goRouter.push(AppRoutes.registration.path);
  }

  void splash() {
    _goRouter.go(AppRoutes.splash.path);
  }

  void back() {
    _goRouter.pop();
  }
}
