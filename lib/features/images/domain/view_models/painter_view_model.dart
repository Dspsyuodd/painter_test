import 'package:neo_canvas/core/navigation/navigation_module.dart';
import 'package:neo_canvas/features/images/domain/images_controller.dart';
import 'package:neo_canvas/features/images/models/painter_state.dart';
import 'package:neo_canvas/features/images/ui/widgets/neo_painter_board.dart';
import 'package:state_notifier/state_notifier.dart';

class PainterViewModel extends StateNotifier<PainterState> {
  final ImagesController _imagesController;
  final NavigationModule _navi;

  final controller = NeoPainterController();

  PainterViewModel(this._imagesController, this._navi)
    : super(const PainterState.loading());

  Future<void> onImageSave() async {
    final file = await controller.saveImage();
    if (file == null) return;
    await _imagesController.saveImage(file);
    _navi.back();
  }

  void onBackTap() {
    _navi.back();
  }
}
