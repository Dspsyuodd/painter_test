import 'package:flutter/material.dart';
import 'package:neo_canvas/core/di/di.dart';
import 'package:neo_canvas/core/ui/widgets/app_background.dart';
import 'package:neo_canvas/core/ui/widgets/app_error_container.dart';
import 'package:neo_canvas/core/ui/widgets/gradiend_shadow_text.dart';
import 'package:neo_canvas/core/ui/widgets/neo_buttons.dart';
import 'package:neo_canvas/core/ui/widgets/neo_text_field.dart';
import 'package:neo_canvas/features/auth/domain/view_models/login_view_model.dart';
import 'package:neo_canvas/features/auth/models/auth_state.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<LoginViewModel>();
    return StreamBuilder(
      stream: viewModel.stream,
      builder: (context, snapshot) {
        return _AuthScreen(
          viewModel: viewModel,
          state: snapshot.data ?? const AuthState.initial(),
        );
      },
    );
  }
}

class _AuthScreen extends StatelessWidget {
  final LoginViewModel viewModel;
  final AuthState state;

  const _AuthScreen({required this.viewModel, required this.state});

  @override
  Widget build(BuildContext context) {
    final error = state.errorMessage;
    return Scaffold(
      body: Stack(
        children: [
          const AppBackground(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                GradientShadowText(
                  'Вход',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                NeoTextField(
                  hint: 'Введите электронную почту',
                  label: 'e-mail',
                  controller: viewModel.emailController,
                  focusNode: viewModel.emailFocusNode,
                ),
                NeoTextField(
                  hint: 'Введите пароль',
                  label: 'Пароль',
                  controller: viewModel.passwordController,
                  focusNode: viewModel.passwordFocusNode,
                  obscureText: true,
                ),
                AppErrorContainer(
                  error: error,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
            child: Column(
              spacing: 19,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: NeoElevatedButton(
                    text: 'Войти',
                    onPressed: viewModel.onLogin,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: viewModel.onRegister,
                    child: const Text('Регистрация'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
