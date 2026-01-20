import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:neo_canvas/core/navigation/navigation_module.dart';
import 'package:neo_canvas/features/auth/domain/auth_manager.dart';
import 'package:neo_canvas/features/images/domain/images_controller.dart';
import 'package:neo_canvas/features/images/models/gallery_state.dart';
import 'package:neo_canvas/features/images/models/neo_image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:state_notifier/state_notifier.dart';

class GalleryViewModel extends StateNotifier<GalleryState> {
  final ImagesController _galleryController;
  final NavigationModule _navigationModule;
  final AuthManager _authManager;

  StreamSubscription<List<NeoImage>>? _sub;

  GalleryViewModel(
    this._galleryController,
    this._navigationModule,
    this._authManager,
  ) : super(const GalleryState.loading());

  @override
  GalleryState get state => super.state;

  Future<void> onImageTap(NeoImage image) async {
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/${image.title}');
    await file.writeAsBytes(base64Decode(image.bytes), flush: true);

    _navigationModule.painter(initialImage: file);
  }

  Future<void> onLogout() async {
    await _authManager.logout();
  }

  Future<void> init() async {
    _sub = _galleryController.images.listen(
      (images) {
        state = GalleryState.data(images);
      },
    );
  }

  @override
  Future<void> dispose() async {
    if (_sub != null) {
      await _sub?.cancel();
      _sub = null;
    }
    await _galleryController.dispose();
    super.dispose();
  }
}
