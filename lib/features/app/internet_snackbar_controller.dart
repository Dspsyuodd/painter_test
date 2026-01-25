import 'dart:async';

import 'package:flutter/material.dart';
import 'package:neo_canvas/core/network/domain/internet_status_provider.dart';

class InternetSnackbarController {
  final InternetStatusProvider _provider;
  InternetSnackbarController(this._provider);

  final messengerKey = GlobalKey<ScaffoldMessengerState>();
  StreamSubscription<InternetStatus>? _sub;

  Future<void> init() async {
    _sub = _provider.statusStream.listen((status) {
      messengerKey.currentState?.hideCurrentSnackBar();
      
      if (status == InternetStatus.online) return;

      messengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(
            status == InternetStatus.disabled
                ? 'Интернет отключен'
                : 'Нет интернета',
          ),
          duration: const Duration(days: 1),
        ),
      );
    });
  }

  Future<void> dispose() async {
    if (_sub != null) {
      await _sub?.cancel();
      _sub = null;
    }
  }
}
