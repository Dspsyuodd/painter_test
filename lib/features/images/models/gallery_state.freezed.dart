// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GalleryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GalleryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GalleryState()';
}


}

/// @nodoc
class $GalleryStateCopyWith<$Res>  {
$GalleryStateCopyWith(GalleryState _, $Res Function(GalleryState) __);
}


/// Adds pattern-matching-related methods to [GalleryState].
extension GalleryStatePatterns on GalleryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GalleryStateLoading value)?  loading,TResult Function( GalleryStateError value)?  error,TResult Function( GalleryStateData value)?  data,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GalleryStateLoading() when loading != null:
return loading(_that);case GalleryStateError() when error != null:
return error(_that);case GalleryStateData() when data != null:
return data(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GalleryStateLoading value)  loading,required TResult Function( GalleryStateError value)  error,required TResult Function( GalleryStateData value)  data,}){
final _that = this;
switch (_that) {
case GalleryStateLoading():
return loading(_that);case GalleryStateError():
return error(_that);case GalleryStateData():
return data(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GalleryStateLoading value)?  loading,TResult? Function( GalleryStateError value)?  error,TResult? Function( GalleryStateData value)?  data,}){
final _that = this;
switch (_that) {
case GalleryStateLoading() when loading != null:
return loading(_that);case GalleryStateError() when error != null:
return error(_that);case GalleryStateData() when data != null:
return data(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String message)?  error,TResult Function( List<NeoImage> images)?  data,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GalleryStateLoading() when loading != null:
return loading();case GalleryStateError() when error != null:
return error(_that.message);case GalleryStateData() when data != null:
return data(_that.images);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String message)  error,required TResult Function( List<NeoImage> images)  data,}) {final _that = this;
switch (_that) {
case GalleryStateLoading():
return loading();case GalleryStateError():
return error(_that.message);case GalleryStateData():
return data(_that.images);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String message)?  error,TResult? Function( List<NeoImage> images)?  data,}) {final _that = this;
switch (_that) {
case GalleryStateLoading() when loading != null:
return loading();case GalleryStateError() when error != null:
return error(_that.message);case GalleryStateData() when data != null:
return data(_that.images);case _:
  return null;

}
}

}

/// @nodoc


class GalleryStateLoading extends GalleryState {
  const GalleryStateLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GalleryStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GalleryState.loading()';
}


}




/// @nodoc


class GalleryStateError extends GalleryState {
  const GalleryStateError(this.message): super._();
  

 final  String message;

/// Create a copy of GalleryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GalleryStateErrorCopyWith<GalleryStateError> get copyWith => _$GalleryStateErrorCopyWithImpl<GalleryStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GalleryStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'GalleryState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $GalleryStateErrorCopyWith<$Res> implements $GalleryStateCopyWith<$Res> {
  factory $GalleryStateErrorCopyWith(GalleryStateError value, $Res Function(GalleryStateError) _then) = _$GalleryStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$GalleryStateErrorCopyWithImpl<$Res>
    implements $GalleryStateErrorCopyWith<$Res> {
  _$GalleryStateErrorCopyWithImpl(this._self, this._then);

  final GalleryStateError _self;
  final $Res Function(GalleryStateError) _then;

/// Create a copy of GalleryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(GalleryStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class GalleryStateData extends GalleryState {
  const GalleryStateData(final  List<NeoImage> images): _images = images,super._();
  

 final  List<NeoImage> _images;
 List<NeoImage> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of GalleryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GalleryStateDataCopyWith<GalleryStateData> get copyWith => _$GalleryStateDataCopyWithImpl<GalleryStateData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GalleryStateData&&const DeepCollectionEquality().equals(other._images, _images));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_images));

@override
String toString() {
  return 'GalleryState.data(images: $images)';
}


}

/// @nodoc
abstract mixin class $GalleryStateDataCopyWith<$Res> implements $GalleryStateCopyWith<$Res> {
  factory $GalleryStateDataCopyWith(GalleryStateData value, $Res Function(GalleryStateData) _then) = _$GalleryStateDataCopyWithImpl;
@useResult
$Res call({
 List<NeoImage> images
});




}
/// @nodoc
class _$GalleryStateDataCopyWithImpl<$Res>
    implements $GalleryStateDataCopyWith<$Res> {
  _$GalleryStateDataCopyWithImpl(this._self, this._then);

  final GalleryStateData _self;
  final $Res Function(GalleryStateData) _then;

/// Create a copy of GalleryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? images = null,}) {
  return _then(GalleryStateData(
null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<NeoImage>,
  ));
}


}

// dart format on
