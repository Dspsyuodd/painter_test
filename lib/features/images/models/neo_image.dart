import 'package:freezed_annotation/freezed_annotation.dart';

part 'neo_image.freezed.dart';
part 'neo_image.g.dart';

@freezed
abstract class NeoImage with _$NeoImage {
  const factory NeoImage({
    required String author,
    required String bytes,
    required String title,
  }) = _NeoImage;

  factory NeoImage.fromJson(Map<String, Object?> json) =>
      _$NeoImageFromJson(json);
}
