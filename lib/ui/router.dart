import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:laravel_forge/ui/views/login_view.dart';
import 'package:laravel_forge/ui/views/main_view.dart';

const String initialRoute = "login";

Route mainViewRoute = MaterialPageRoute(
  settings: RouteSettings(name: "/"),
  builder: (_) => MainView(),
);

Route loginRoute = MaterialPageRoute(
  settings: RouteSettings(name: "login"),
  builder: (_) => LoginView(),
);

class Router {
  static get routes => {
        '/': (context) => MainView(),
        'login': (context) => LoginView(),
      };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return mainViewRoute;
      case 'login':
        return loginRoute;
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
