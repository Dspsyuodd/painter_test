import 'dart:io';

import 'package:neo_canvas/features/images/models/neo_image.dart';

abstract interface class ImagesRepo {
  Future<void> saveImage(ImageSaveRequest request);
  Future<List<NeoImage>> fetchImages();
  Stream<NeoImage> get newImages;
}

class ImageSaveRequest {
  final File file;
  final String author;
  final String title;

  ImageSaveRequest(this.file, this.author, this.title);
}
