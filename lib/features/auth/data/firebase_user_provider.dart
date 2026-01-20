import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:neo_canvas/features/auth/domain/user_provider.dart';
import 'package:neo_canvas/features/auth/utils/user_x.dart';

class FirebaseUserProvider {
  final UserProvider _userProvider;

  final _auth = FirebaseAuth.instance;
  StreamSubscription<User?>? _sub;

  FirebaseUserProvider(this._userProvider);

  Future<void> init() async {
    _sub = _auth.authStateChanges().listen((firebaseUser) {
      _userProvider.setUser(firebaseUser?.toAppUser());
    });
  }

  Future<void> dispose() async {
    if (_sub != null) {
      await _sub!.cancel();
      _sub = null;
    }
  }
}
