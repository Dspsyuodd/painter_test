import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_login_request.freezed.dart';
part 'user_login_request.g.dart';

@freezed
abstract class UserLoginRequest with _$UserLoginRequest {
  const factory UserLoginRequest({
    required String email,
    required String password,
  }) = _UserLoginRequest;

  factory UserLoginRequest.fromJson(Map<String, Object?> json) =>
      _$UserLoginRequestFromJson(json);
}
