import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:neo_canvas/features/images/data/firebase_image_repo.dart';
import 'package:neo_canvas/features/images/domain/images_controller.dart';
import 'package:neo_canvas/features/images/domain/images_repo.dart';
import 'package:neo_canvas/features/images/domain/view_models/gallery_view_model.dart';
import 'package:neo_canvas/features/images/domain/view_models/painter_view_model.dart';

final _getIt = GetIt.instance;

class ImagesScope extends StatefulWidget {
  final Widget child;

  const ImagesScope({required this.child, super.key});

  @override
  State<ImagesScope> createState() => _ImagesScopeState();
}

class _ImagesScopeState extends State<ImagesScope> {
  static const _scopeName = 'images_scope';

  @override
  void initState() {
    super.initState();
    if (_getIt.hasScope(_scopeName)) return;

    _getIt.pushNewScope(
      scopeName: _scopeName,
      init: (_) {
        _initImages();
      },
    );
  }

  @override
  void dispose() {
    if (_getIt.currentScopeName == _scopeName) {
      _getIt.popScope();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

void _initImages() {
  _getIt.registerSingleton<ImagesRepo>(FirebaseImagesRepo(_getIt()));
  _getIt.registerSingleton(
    ImagesController(_getIt(), _getIt(), _getIt())..init(),
    dispose: (controller) => controller.dispose(),
  );
  _getIt.registerFactory(
    () => GalleryViewModel(_getIt(), _getIt(), _getIt())..init(),
  );
  _getIt.registerFactory(() => PainterViewModel(_getIt(), _getIt()));
}
