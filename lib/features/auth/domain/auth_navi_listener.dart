import 'dart:async';

import 'package:neo_canvas/core/navigation/navigation_module.dart';
import 'package:neo_canvas/features/auth/domain/user_provider.dart';
import 'package:neo_canvas/features/auth/models/app_user.dart';

class AuthNaviListener {
  final UserProvider _userProvider;
  final NavigationModule _navigationModule;
  StreamSubscription<AppUser?>? _sub;

  AuthNaviListener(this._userProvider, this._navigationModule);

  Future<void> init() async {
    _sub = _userProvider.userStream.skip(2).listen((user) {
      if (user != null) {
        _navigationModule.main();
      } else {
        _navigationModule.auth();
      }
    });
  }

  Future<void> dispose() async {
    if (_sub != null) {
      await _sub!.cancel();
      _sub = null;
    }
  }
}
