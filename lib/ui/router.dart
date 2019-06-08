import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:laravel_forge/ui/views/login_view.dart';
import 'package:laravel_forge/ui/views/main_view.dart';

const String initialRoute = "login";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainView());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginView());
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
