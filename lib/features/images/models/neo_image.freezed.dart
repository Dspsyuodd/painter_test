// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'neo_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NeoImage {

 String get author; String get bytes; String get title;
/// Create a copy of NeoImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NeoImageCopyWith<NeoImage> get copyWith => _$NeoImageCopyWithImpl<NeoImage>(this as NeoImage, _$identity);

  /// Serializes this NeoImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NeoImage&&(identical(other.author, author) || other.author == author)&&(identical(other.bytes, bytes) || other.bytes == bytes)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,author,bytes,title);

@override
String toString() {
  return 'NeoImage(author: $author, bytes: $bytes, title: $title)';
}


}

/// @nodoc
abstract mixin class $NeoImageCopyWith<$Res>  {
  factory $NeoImageCopyWith(NeoImage value, $Res Function(NeoImage) _then) = _$NeoImageCopyWithImpl;
@useResult
$Res call({
 String author, String bytes, String title
});




}
/// @nodoc
class _$NeoImageCopyWithImpl<$Res>
    implements $NeoImageCopyWith<$Res> {
  _$NeoImageCopyWithImpl(this._self, this._then);

  final NeoImage _self;
  final $Res Function(NeoImage) _then;

/// Create a copy of NeoImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? author = null,Object? bytes = null,Object? title = null,}) {
  return _then(_self.copyWith(
author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,bytes: null == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NeoImage].
extension NeoImagePatterns on NeoImage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NeoImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NeoImage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NeoImage value)  $default,){
final _that = this;
switch (_that) {
case _NeoImage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NeoImage value)?  $default,){
final _that = this;
switch (_that) {
case _NeoImage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String author,  String bytes,  String title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NeoImage() when $default != null:
return $default(_that.author,_that.bytes,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String author,  String bytes,  String title)  $default,) {final _that = this;
switch (_that) {
case _NeoImage():
return $default(_that.author,_that.bytes,_that.title);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String author,  String bytes,  String title)?  $default,) {final _that = this;
switch (_that) {
case _NeoImage() when $default != null:
return $default(_that.author,_that.bytes,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NeoImage implements NeoImage {
  const _NeoImage({required this.author, required this.bytes, required this.title});
  factory _NeoImage.fromJson(Map<String, dynamic> json) => _$NeoImageFromJson(json);

@override final  String author;
@override final  String bytes;
@override final  String title;

/// Create a copy of NeoImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NeoImageCopyWith<_NeoImage> get copyWith => __$NeoImageCopyWithImpl<_NeoImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NeoImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NeoImage&&(identical(other.author, author) || other.author == author)&&(identical(other.bytes, bytes) || other.bytes == bytes)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,author,bytes,title);

@override
String toString() {
  return 'NeoImage(author: $author, bytes: $bytes, title: $title)';
}


}

/// @nodoc
abstract mixin class _$NeoImageCopyWith<$Res> implements $NeoImageCopyWith<$Res> {
  factory _$NeoImageCopyWith(_NeoImage value, $Res Function(_NeoImage) _then) = __$NeoImageCopyWithImpl;
@override @useResult
$Res call({
 String author, String bytes, String title
});




}
/// @nodoc
class __$NeoImageCopyWithImpl<$Res>
    implements _$NeoImageCopyWith<$Res> {
  __$NeoImageCopyWithImpl(this._self, this._then);

  final _NeoImage _self;
  final $Res Function(_NeoImage) _then;

/// Create a copy of NeoImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? author = null,Object? bytes = null,Object? title = null,}) {
  return _then(_NeoImage(
author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,bytes: null == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
