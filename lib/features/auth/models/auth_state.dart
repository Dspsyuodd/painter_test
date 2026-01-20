import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthStateInitial;

  const factory AuthState.loading() = AuthStateLoading;

  const factory AuthState.error(String message) = AuthStateError;

  const factory AuthState.success() = AuthStateSuccess;

  const AuthState._();

  String? get errorMessage =>
      this is AuthStateError ? (this as AuthStateError).message : null;
}
