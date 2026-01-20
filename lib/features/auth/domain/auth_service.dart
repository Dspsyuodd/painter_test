import 'package:neo_canvas/features/auth/models/app_user.dart';

import '../models/user_login_request.dart';
import '../models/user_register_request.dart';

abstract interface class AuthService {
  Future<AppUser> login(UserLoginRequest request);
  Future<AppUser> register(UserRegisterRequest request);
  Future<void> logout();
}
