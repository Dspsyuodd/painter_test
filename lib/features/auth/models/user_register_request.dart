import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_register_request.freezed.dart';
part 'user_register_request.g.dart';

@freezed
abstract class UserRegisterRequest with _$UserRegisterRequest {
  const factory UserRegisterRequest({
    required String email,
    required String password,
    required String name,
  }) = _UserRegisterRequest;

  factory UserRegisterRequest.fromJson(Map<String, Object?> json) =>
      _$UserRegisterRequestFromJson(json);
}
