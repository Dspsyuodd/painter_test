import 'package:flutter/material.dart';
import 'package:neo_canvas/features/auth/data/failures.dart';
import 'package:neo_canvas/features/auth/domain/auth_manager.dart';
import 'package:neo_canvas/features/auth/models/auth_state.dart';
import 'package:neo_canvas/features/auth/models/user_register_request.dart';
import 'package:neo_canvas/utils/validators.dart';
import 'package:state_notifier/state_notifier.dart';

class RegisterViewModel extends StateNotifier<AuthState> with LocatorMixin {
  final AuthManager _authManager;

  final nameController = TextEditingController();
  final nameFocusNode = FocusNode();

  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();

  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();

  final confirmPasswordController = TextEditingController();
  final confirmPasswordFocusNode = FocusNode();

  RegisterViewModel(this._authManager) : super(const AuthState.initial());

  Future<void> onRegister() async {
    if (state is AuthStateLoading) return;
    state = const AuthState.loading();

    final validationError = _validateForm();
    if (validationError != null) {
      state = AuthState.error(validationError);
      return;
    }

    try {
      final request = UserRegisterRequest(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
      );
      await _authManager.register(request);
      state = const AuthState.success();
    } on RegisterFailure catch (e) {
      state = AuthState.error(e.message);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  String? _validateForm() {
    final nameError = validateName(nameController.text);
    if (nameError != null) {
      nameFocusNode.requestFocus();
      return nameError;
    }

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

    if (passwordController.text != confirmPasswordController.text) {
      confirmPasswordFocusNode.requestFocus();
      return 'Пароли не совпадают';
    }

    return null;
  }
}
