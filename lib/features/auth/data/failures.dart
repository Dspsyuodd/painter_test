class RegisterFailure implements Exception {
  final String message;

  const RegisterFailure([this.message = 'Неизвестная ошибка регистрации']);

  factory RegisterFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const RegisterFailure(
          'Неверный email',
        );
      case 'user-disabled':
        return const RegisterFailure(
          'Этот пользователь был отключен',
        );
      case 'email-already-in-use':
        return const RegisterFailure(
          'Аккаунт с таким email уже существует',
        );
      case 'operation-not-allowed':
        return const RegisterFailure(
          'Операция не разрешена.',
        );
      case 'weak-password':
        return const RegisterFailure(
          'Пожалуйста, введите более надежный пароль',
        );
      default:
        return const RegisterFailure();
    }
  }
}

class LoginFailure implements Exception {
  const LoginFailure([
    this.message = 'Неизвестная ошибка входа',
  ]);

  factory LoginFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-credential':
        return const LoginFailure(
          'Неверный email',
        );
      case 'user-disabled':
        return const LoginFailure(
          'Этот пользователь был отключен',
        );
      case 'user-not-found':
        return const LoginFailure(
          'Пользователя с таким email не найдено',
        );
      case 'wrong-password':
        return const LoginFailure(
          'Неверный пароль',
        );
      case 'operation-not-allowed':
        return const LoginFailure(
          'Операция не разрешена',
        );
      default:
        return const LoginFailure();
    }
  }

  final String message;
}
