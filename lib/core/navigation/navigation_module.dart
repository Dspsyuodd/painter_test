import 'dart:io';

import 'package:flutter/material.dart';
import 'package:neo_canvas/core/navigation/app_routes_factory.dart';

class NavigationModule {
  final AppRouterFactory _appRouterFactory;

  late final _goRouter = _appRouterFactory.createRouter();

  NavigationModule(this._appRouterFactory);

  RouterConfig<Object> get routerConfig => _goRouter;

  void auth() {
    _goRouter.go('/auth');
  }

  void main() {
    _goRouter.go('/main');
  }

  void painter({File? initialImage}) {
    _goRouter.go('/painter', extra: initialImage);
  }

  void registration() {
    _goRouter.go('/registration');
  }

  void splash() {
    _goRouter.go('/splash');
  }
}
