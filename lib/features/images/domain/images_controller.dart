import 'dart:async';
import 'dart:io';

import 'package:neo_canvas/features/auth/domain/user_provider.dart';
import 'package:neo_canvas/features/images/domain/images_repo.dart';
import 'package:neo_canvas/features/images/models/neo_image.dart';
import 'package:neo_canvas/features/notifications/notification_service.dart';
import 'package:rxdart/subjects.dart';

class ImagesController {
  final ImagesRepo _imagesRepo;
  final UserProvider _userProvider;
  final NotificationService _notifications;

  final _imagesStream = BehaviorSubject<List<NeoImage>>.seeded([]);
  BehaviorSubject<List<NeoImage>> get images => _imagesStream;
  StreamSubscription<NeoImage>? _newImagesSubscription;

  ImagesController(this._imagesRepo, this._userProvider, this._notifications);

  Future<void> saveImage(File file) async {
    final request = ImageSaveRequest(
      file,
      _userProvider.user?.email ?? '',
      'image_${DateTime.now().millisecondsSinceEpoch}',
    );
    try {
      await _imagesRepo.saveImage(request);
      await _notifications.showNotification('Изображение загружено');
    } catch (e) {
      await _notifications.showNotification('Ошибка загрузки');
    }
  }

  Future<void> init() async {
    _newImagesSubscription = _imagesRepo.newImages.listen((image) {
      final currentImages = _imagesStream.value;
      _imagesStream.add([image, ...currentImages]);
    });

    final images = await _imagesRepo.fetchImages();
    _imagesStream.add(images);
  }

  Future<void> dispose() async {
    if (_newImagesSubscription != null) {
      await _newImagesSubscription?.cancel();
      _newImagesSubscription = null;
    }
    await _imagesStream.close();
  }
}
