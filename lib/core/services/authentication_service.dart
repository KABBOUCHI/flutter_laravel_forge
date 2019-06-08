import 'dart:async';
import '../models/user.dart';
import '../../locator.dart';
import 'api.dart';

class AuthenticationService {
  Api _api = locator<Api>();

  StreamController<User> userController = StreamController<User>();

  Future<bool> login(String token) async {
    var fetchedUser = await _api.getUserProfile(token);

    var hasUser = fetchedUser != null;
    if (hasUser) {
      userController.add(fetchedUser);
    }

    return hasUser;
  }
}
