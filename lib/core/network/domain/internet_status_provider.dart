abstract interface class InternetStatusProvider {
  Future<InternetStatus> checkConnection();
  Stream<InternetStatus> get statusStream;
}

enum InternetStatus {
  disabled,
  offline,
  online,
}
