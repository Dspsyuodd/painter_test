import 'package:firebase_auth/firebase_auth.dart';
import 'package:neo_canvas/features/auth/data/failures.dart';
import 'package:neo_canvas/features/auth/domain/auth_service.dart';
import 'package:neo_canvas/features/auth/models/app_user.dart';
import 'package:neo_canvas/features/auth/models/user_login_request.dart';
import 'package:neo_canvas/features/auth/models/user_register_request.dart';
import 'package:neo_canvas/features/auth/utils/user_x.dart';

class FirebaseAuthServiceImpl implements AuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<AppUser> login(UserLoginRequest request) async {
    try {
      final response = await _firebaseAuth.signInWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );
      final user = response.user;
      if (user != null) {
        return user.toAppUser();
      } else {
        throw Exception('Login failed');
      }
    } on FirebaseAuthException catch (e) {
      throw LoginFailure.fromCode(e.code);
    } catch (_) {
      throw const LoginFailure();
    }
  }

  @override
  Future<AppUser> register(UserRegisterRequest request) async {
    try {
      final response = await _firebaseAuth.createUserWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );
      final user = response.user;
      if (user != null) {
        return user.toAppUser();
      } else {
        throw Exception('User registration failed');
      }
    } on FirebaseAuthException catch (e) {
      throw RegisterFailure.fromCode(e.code);
    } catch (_) {
      throw const RegisterFailure();
    }
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
