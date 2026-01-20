import 'package:neo_canvas/features/auth/models/app_user.dart';
import 'package:rxdart/rxdart.dart';

class UserProvider {
  final _stream = BehaviorSubject<AppUser?>.seeded(null);

  AppUser? get user => _stream.value;
  Stream<AppUser?> get userStream => _stream.stream;

  void setUser(AppUser? user) {
    _stream.add(user);
  }
}
