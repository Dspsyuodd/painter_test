import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:rxdart/rxdart.dart';

class InternetMonitor {
  final _interval = const Duration(seconds: 10);
  final _timeout = const Duration(seconds: 3);
  final _url = 'http://www.apple.com/library/test/success.html';

  final BehaviorSubject<bool> _subject = BehaviorSubject<bool>();
  StreamSubscription<bool>? _sub;

  InternetMonitor();

  Future<bool> isAvaliable() async {
    try {
      final response = await http
          .get(
            Uri.parse(_url),
          )
          .timeout(_timeout);
      return response.statusCode >= 200 && response.statusCode < 400;
    } on SocketException catch (_) {
      return false;
    }
  }

  Stream<bool> get stream => _subject.stream.distinct();

  Future<void> init() async {
    await _sub?.cancel();

    _sub = Stream<void>.periodic(_interval)
        .startWith(null)
        .asyncMap((_) => isAvaliable())
        .listen(_subject.add, onError: (_) => _subject.add(false));
  }

  Future<void> dispose() async {
    if (_sub != null) {
      await _sub?.cancel();
      _sub = null;
    }
    await _subject.close();
  }
}
