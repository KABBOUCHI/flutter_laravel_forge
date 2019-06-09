import 'package:laravel_forge/ui/views/login_view.dart';
import 'package:laravel_forge/ui/views/main_view.dart';

class Routes {
  static const String home = "/";
  static const String login = "/login";
}

const String initialRoute = Routes.login;

class Router {
  static get routes => {
        Routes.home: (context) => MainView(),
        Routes.login: (context) => LoginView(),
      };
}
