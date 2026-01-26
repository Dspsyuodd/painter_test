import 'package:flutter/material.dart';
import 'package:neo_canvas/core/di/di.dart';
import 'package:neo_canvas/core/ui/widgets/app_error_container.dart';
import 'package:neo_canvas/core/ui/widgets/gradiend_shadow_text.dart';
import 'package:neo_canvas/core/ui/widgets/neo_text_field.dart';
import 'package:neo_canvas/features/app/app_scaffold.dart';
import 'package:neo_canvas/features/auth/domain/view_models/register_view_model.dart';
import 'package:neo_canvas/features/auth/models/auth_state.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<RegisterViewModel>();
    return StreamBuilder(
      stream: viewModel.stream,
      builder: (context, snapshot) {
        return _RegistrationScreen(
          viewModel: viewModel,
          state: snapshot.data ?? const AuthState.initial(),
        );
      },
    );
  }
}

class _RegistrationScreen extends StatelessWidget {
  final RegisterViewModel viewModel;
  final AuthState state;

  const _RegistrationScreen({required this.viewModel, required this.state});

  @override
  Widget build(BuildContext context) {
    final error = state.errorMessage;
    return AppScaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isVerticalSmall = constraints.maxHeight < 600;
          final isVerticalMedium = constraints.maxHeight < 750;
          return Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: isVerticalMedium ? 10 : 20,
                        children: [
                          Visibility(
                            visible: !isVerticalSmall,
                            child: GradientShadowText(
                              'Регистрация',
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ),
                          NeoTextField(
                            hint: 'Введите ваше имя',
                            label: 'Имя',
                            controller: viewModel.nameController,
                            focusNode: viewModel.nameFocusNode,
                          ),
                          NeoTextField(
                            hint: 'Ваша электронная почта',
                            label: 'e-mail',
                            controller: viewModel.emailController,
                            focusNode: viewModel.emailFocusNode,
                          ),
                          if (!isVerticalMedium)
                            Divider(
                              thickness: 0.5,
                              color: Colors.grey.shade800,
                            ),
                          NeoTextField(
                            hint: '8-16 символов',
                            label: 'Пароль',
                            controller: viewModel.passwordController,
                            focusNode: viewModel.passwordFocusNode,
                            obscureText: true,
                          ),
                          NeoTextField(
                            hint: '8-16 символов',
                            label: 'Подтверждение пароля',
                            controller: viewModel.confirmPasswordController,
                            focusNode: viewModel.confirmPasswordFocusNode,
                            obscureText: true,
                          ),
                          AppErrorContainer(
                            error: error,
                          ),
                          if (isVerticalSmall)
                            const SizedBox(
                              height: 100,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 40,
                  ),
                  child: ElevatedButton(
                    onPressed: viewModel.onRegister,
                    child: const Text('Зарегистрироваться'),
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
