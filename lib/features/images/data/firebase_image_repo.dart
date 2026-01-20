import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:neo_canvas/features/auth/domain/user_provider.dart';
import 'package:neo_canvas/features/images/domain/images_repo.dart';
import 'package:neo_canvas/features/images/models/neo_image.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseImagesRepo implements ImagesRepo {
  final UserProvider _userProvider;

  FirebaseImagesRepo(this._userProvider);

  final _firestore = FirebaseFirestore.instance;

  static const _collectionPath = 'images';

  final _controller = StreamController<NeoImage>();

  @override
  Future<List<NeoImage>> fetchImages() async {
    final id =
        (await _userProvider.userStream
                .startWith(_userProvider.user)
                .firstWhere((user) => user != null))
            ?.id;
    final snapshot = await _firestore
        .collection('user')
        .doc(id)
        .collection(_collectionPath)
        .orderBy('createdAt', descending: true)
        .get();

    final images = snapshot.docs
        .map<NeoImage>((doc) => NeoImage.fromJson(doc.data()))
        .toList();

    return images;
  }

  @override
  Stream<NeoImage> get newImages => _controller.stream;

  @override
  Future<void> saveImage(ImageSaveRequest request) async {
    final id = _userProvider.user?.id ?? '';
    final bytes = base64Encode(await request.file.readAsBytes());

    await _firestore.collection('user').doc(id).collection(_collectionPath).add(
      {
        'title': request.title,
        'author': request.author,
        'bytes': bytes,
        'createdAt': FieldValue.serverTimestamp(),
      },
    );
    _controller.add(
      NeoImage(
        author: request.author,
        bytes: bytes,
        title: request.title,
      ),
    );
  }
}
