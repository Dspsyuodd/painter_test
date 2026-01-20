import 'package:flutter_regex/flutter_regex.dart';

String? validateName(String value) {
  if (value.isEmpty) {
    return 'Введите имя';
  }
  if (value.length < 3) {
    return 'Имя должно быть не менее 3 символов';
  }
  return null;
}

String? validateEmail(String value) {
  if (value.isEmpty) {
    return 'Введите email';
  }
  if (!email(value)) {
    return 'Некорректный email';
  }
  return null;
}

String? validatePassword(String value) {
  if (value.isEmpty) {
    return 'Введите пароль';
  }
  if (value.length < 8) {
    return 'Пароль должен быть не менее 6 символов';
  }
  if (value.length > 16) {
    return 'Пароль должен быть не более 16 символов';
  }
  return null;
}
