import 'package:freezed_annotation/freezed_annotation.dart';

part 'painter_state.freezed.dart';

@freezed
sealed class PainterState with _$PainterState {
  const factory PainterState.loading() = PainterStateLoading;

  const factory PainterState.error(String message) = PainterStateError;

  const factory PainterState.success() = PainterStateData;

  const PainterState._();
}
