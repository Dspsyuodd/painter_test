// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'painter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PainterState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PainterState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PainterState()';
}


}

/// @nodoc
class $PainterStateCopyWith<$Res>  {
$PainterStateCopyWith(PainterState _, $Res Function(PainterState) __);
}


/// Adds pattern-matching-related methods to [PainterState].
extension PainterStatePatterns on PainterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PainterStateLoading value)?  loading,TResult Function( PainterStateError value)?  error,TResult Function( PainterStateData value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PainterStateLoading() when loading != null:
return loading(_that);case PainterStateError() when error != null:
return error(_that);case PainterStateData() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PainterStateLoading value)  loading,required TResult Function( PainterStateError value)  error,required TResult Function( PainterStateData value)  success,}){
final _that = this;
switch (_that) {
case PainterStateLoading():
return loading(_that);case PainterStateError():
return error(_that);case PainterStateData():
return success(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PainterStateLoading value)?  loading,TResult? Function( PainterStateError value)?  error,TResult? Function( PainterStateData value)?  success,}){
final _that = this;
switch (_that) {
case PainterStateLoading() when loading != null:
return loading(_that);case PainterStateError() when error != null:
return error(_that);case PainterStateData() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String message)?  error,TResult Function()?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PainterStateLoading() when loading != null:
return loading();case PainterStateError() when error != null:
return error(_that.message);case PainterStateData() when success != null:
return success();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String message)  error,required TResult Function()  success,}) {final _that = this;
switch (_that) {
case PainterStateLoading():
return loading();case PainterStateError():
return error(_that.message);case PainterStateData():
return success();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String message)?  error,TResult? Function()?  success,}) {final _that = this;
switch (_that) {
case PainterStateLoading() when loading != null:
return loading();case PainterStateError() when error != null:
return error(_that.message);case PainterStateData() when success != null:
return success();case _:
  return null;

}
}

}

/// @nodoc


class PainterStateLoading extends PainterState {
  const PainterStateLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PainterStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PainterState.loading()';
}


}




/// @nodoc


class PainterStateError extends PainterState {
  const PainterStateError(this.message): super._();
  

 final  String message;

/// Create a copy of PainterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PainterStateErrorCopyWith<PainterStateError> get copyWith => _$PainterStateErrorCopyWithImpl<PainterStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PainterStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PainterState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $PainterStateErrorCopyWith<$Res> implements $PainterStateCopyWith<$Res> {
  factory $PainterStateErrorCopyWith(PainterStateError value, $Res Function(PainterStateError) _then) = _$PainterStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$PainterStateErrorCopyWithImpl<$Res>
    implements $PainterStateErrorCopyWith<$Res> {
  _$PainterStateErrorCopyWithImpl(this._self, this._then);

  final PainterStateError _self;
  final $Res Function(PainterStateError) _then;

/// Create a copy of PainterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(PainterStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PainterStateData extends PainterState {
  const PainterStateData(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PainterStateData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PainterState.success()';
}


}




// dart format on
