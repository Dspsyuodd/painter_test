import 'package:flutter/material.dart';
import 'package:neo_canvas/core/navigation/navigation_module.dart';
import 'package:neo_canvas/features/auth/data/failures.dart';
import 'package:neo_canvas/features/auth/domain/auth_manager.dart';
import 'package:neo_canvas/features/auth/models/auth_state.dart';
import 'package:neo_canvas/features/auth/models/user_login_request.dart';
import 'package:neo_canvas/utils/validators.dart';
import 'package:state_notifier/state_notifier.dart';

class LoginViewModel extends StateNotifier<AuthState> with LocatorMixin {
  final AuthManager _authManager;
  final NavigationModule _navigationModule;

  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();

  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();

  LoginViewModel(this._authManager, this._navigationModule)
    : super(const AuthState.initial());

  Future<void> onLogin() async {
    if (state is AuthStateLoading) return;
    state = const AuthState.loading();

    final validationError = _validateForm();
    if (validationError != null) {
      state = AuthState.error(validationError);
      return;
    }

    try {
      final request = UserLoginRequest(
        email: emailController.text,
        password: passwordController.text,
      );
      await _authManager.login(request);
      state = const AuthState.success();
    } on LoginFailure catch (e) {
      state = AuthState.error(e.message);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  void onRegister() {
    _navigationModule.registration();
  }

  String? _validateForm() {
    final emailError = validateEmail(emailController.text);
    if (emailError != null) {
      emailFocusNode.requestFocus();
      return emailError;
    }

    final passwordError = validatePassword(passwordController.text);
    if (passwordError != null) {
      passwordFocusNode.requestFocus();
      return passwordError;
    }

    return null;
  }
}
