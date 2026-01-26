import 'package:flutter/material.dart';
import 'package:neo_canvas/core/di/di.dart';
import 'package:neo_canvas/core/ui/widgets/app_error_container.dart';
import 'package:neo_canvas/core/ui/widgets/gradiend_shadow_text.dart';
import 'package:neo_canvas/core/ui/widgets/neo_buttons.dart';
import 'package:neo_canvas/core/ui/widgets/neo_text_field.dart';
import 'package:neo_canvas/features/app/app_scaffold.dart';
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
    return AppScaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isVerticalSmall = constraints.maxHeight < 600;
          return Stack(
            children: [
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: isVerticalSmall ? 50 : 0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 20,
                    children: [
                      Visibility(
                        visible: !isVerticalSmall,
                        child: GradientShadowText(
                          'Вход',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
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
              ),
              SafeArea(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 40,
                    ),
                    child: Flex(
                      mainAxisAlignment: MainAxisAlignment.end,
                      direction: isVerticalSmall
                          ? Axis.horizontal
                          : Axis.vertical,
                      spacing: 19,
                      children: [
                        Expanded(
                          flex: isVerticalSmall ? 1 : 0,
                          child: NeoElevatedButton(
                            text: 'Войти',
                            onPressed: viewModel.onLogin,
                          ),
                        ),
                        Expanded(
                          flex: isVerticalSmall ? 1 : 0,
                          child: ElevatedButton(
                            onPressed: viewModel.onRegister,
                            child: const Text('Регистрация'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
