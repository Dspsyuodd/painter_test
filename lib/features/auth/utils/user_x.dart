import 'package:firebase_auth/firebase_auth.dart';
import 'package:neo_canvas/features/auth/models/app_user.dart';

extension UserX on User {
  AppUser toAppUser() {
    return AppUser(
      id: uid,
      email: email ?? '',
      name: displayName ?? '',
    );
  }
}
