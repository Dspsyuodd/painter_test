import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:neo_canvas/core/network/data/internet_monitor.dart';
import 'package:neo_canvas/core/network/domain/internet_status_provider.dart';
import 'package:rxdart/rxdart.dart';

class InternetStatusProviderImpl implements InternetStatusProvider {
  final Connectivity _connectivity;
  final InternetMonitor _monitor;

  final BehaviorSubject<InternetStatus> _subject =
      BehaviorSubject<InternetStatus>();

  StreamSubscription<InternetStatus>? _sub;

  InternetStatusProviderImpl(this._connectivity, this._monitor);

  Future<void> init() async {
    _subject.add(await checkConnection());
    _sub = Rx.combineLatest2(
      _connectivity.onConnectivityChanged.map(
        (result) => !result.contains(ConnectivityResult.none),
      ),
      _monitor.stream,
      _combiner,
    ).listen(_subject.add);
  }

  Future<void> dispose() async {
    if (_sub != null) {
      await _sub?.cancel();
      _sub = null;
    }
    await _subject.close();
  }

  @override
  Future<InternetStatus> checkConnection() async {
    final lol = await _connectivity.checkConnectivity();
    final connected = !lol.contains(
      ConnectivityResult.none,
    );
    final avaliable = await _monitor.isAvaliable();

    return _combiner(connected, avaliable);
  }

  @override
  Stream<InternetStatus> get statusStream => _subject.stream.distinct();

  InternetStatus _combiner(bool connected, bool avaliable) {
    if (!connected) return InternetStatus.disabled;
    if (!avaliable) return InternetStatus.offline;
    return InternetStatus.online;
  }
}
