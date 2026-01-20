import 'package:neo_canvas/features/auth/domain/auth_service.dart';
import 'package:neo_canvas/features/auth/domain/user_provider.dart';
import 'package:neo_canvas/features/auth/models/user_login_request.dart';
import 'package:neo_canvas/features/auth/models/user_register_request.dart';

class AuthManager {
  final AuthService _authService;
  final UserProvider _provider;

  AuthManager(this._authService, this._provider);

  Future<void> login(UserLoginRequest request) async {
    final user = await _authService.login(request);
    _provider.setUser(user);
  }

  Future<void> register(UserRegisterRequest request) async {
    final user = await _authService.register(request);
    _provider.setUser(user);
  }

  Future<void> logout() async {
    await _authService.logout();
    _provider.setUser(null);
  }
}
