import 'package:flutter/material.dart';
import 'package:laravel_forge/core/models/server.dart';
import 'package:laravel_forge/ui/views/login_view.dart';
import 'package:laravel_forge/ui/views/main_view.dart';
import 'package:laravel_forge/ui/views/server_view.dart';

class Routes {
  static const String home = "/";
  static const String login = "/login";
  static const String server = "/server";
}

const String initialRoute = Routes.login;

class Router {
  static get routes => {
        Routes.home: (context) => MainView(),
        Routes.login: (context) => LoginView(),
        Routes.server: (context) {
          var server = ModalRoute.of(context).settings.arguments as Server;

          return ServerView(
            server: server,
          );
        },
      };
}
