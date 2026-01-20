// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_register_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserRegisterRequest {

 String get email; String get password; String get name;
/// Create a copy of UserRegisterRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserRegisterRequestCopyWith<UserRegisterRequest> get copyWith => _$UserRegisterRequestCopyWithImpl<UserRegisterRequest>(this as UserRegisterRequest, _$identity);

  /// Serializes this UserRegisterRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRegisterRequest&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password,name);

@override
String toString() {
  return 'UserRegisterRequest(email: $email, password: $password, name: $name)';
}


}

/// @nodoc
abstract mixin class $UserRegisterRequestCopyWith<$Res>  {
  factory $UserRegisterRequestCopyWith(UserRegisterRequest value, $Res Function(UserRegisterRequest) _then) = _$UserRegisterRequestCopyWithImpl;
@useResult
$Res call({
 String email, String password, String name
});




}
/// @nodoc
class _$UserRegisterRequestCopyWithImpl<$Res>
    implements $UserRegisterRequestCopyWith<$Res> {
  _$UserRegisterRequestCopyWithImpl(this._self, this._then);

  final UserRegisterRequest _self;
  final $Res Function(UserRegisterRequest) _then;

/// Create a copy of UserRegisterRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,Object? name = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserRegisterRequest].
extension UserRegisterRequestPatterns on UserRegisterRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserRegisterRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserRegisterRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserRegisterRequest value)  $default,){
final _that = this;
switch (_that) {
case _UserRegisterRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserRegisterRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UserRegisterRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String password,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserRegisterRequest() when $default != null:
return $default(_that.email,_that.password,_that.name);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String password,  String name)  $default,) {final _that = this;
switch (_that) {
case _UserRegisterRequest():
return $default(_that.email,_that.password,_that.name);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String password,  String name)?  $default,) {final _that = this;
switch (_that) {
case _UserRegisterRequest() when $default != null:
return $default(_that.email,_that.password,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserRegisterRequest implements UserRegisterRequest {
  const _UserRegisterRequest({required this.email, required this.password, required this.name});
  factory _UserRegisterRequest.fromJson(Map<String, dynamic> json) => _$UserRegisterRequestFromJson(json);

@override final  String email;
@override final  String password;
@override final  String name;

/// Create a copy of UserRegisterRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserRegisterRequestCopyWith<_UserRegisterRequest> get copyWith => __$UserRegisterRequestCopyWithImpl<_UserRegisterRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserRegisterRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserRegisterRequest&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password,name);

@override
String toString() {
  return 'UserRegisterRequest(email: $email, password: $password, name: $name)';
}


}

/// @nodoc
abstract mixin class _$UserRegisterRequestCopyWith<$Res> implements $UserRegisterRequestCopyWith<$Res> {
  factory _$UserRegisterRequestCopyWith(_UserRegisterRequest value, $Res Function(_UserRegisterRequest) _then) = __$UserRegisterRequestCopyWithImpl;
@override @useResult
$Res call({
 String email, String password, String name
});




}
/// @nodoc
class __$UserRegisterRequestCopyWithImpl<$Res>
    implements _$UserRegisterRequestCopyWith<$Res> {
  __$UserRegisterRequestCopyWithImpl(this._self, this._then);

  final _UserRegisterRequest _self;
  final $Res Function(_UserRegisterRequest) _then;

/// Create a copy of UserRegisterRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? name = null,}) {
  return _then(_UserRegisterRequest(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
