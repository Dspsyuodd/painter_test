import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neo_canvas/features/images/models/neo_image.dart';

part 'gallery_state.freezed.dart';

@freezed
sealed class GalleryState with _$GalleryState {
  const factory GalleryState.loading() = GalleryStateLoading;

  const factory GalleryState.error(String message) = GalleryStateError;

  const factory GalleryState.data(List<NeoImage> images) = GalleryStateData;

  const GalleryState._();
}
