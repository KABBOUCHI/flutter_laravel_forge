import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:laravel_forge/constants.dart';
import 'package:laravel_forge/core/viewmodels/recipes_model.dart';
import 'package:laravel_forge/core/viewmodels/servers_model.dart';
import 'package:laravel_forge/core/viewmodels/settings_model.dart';
import 'package:laravel_forge/ui/router.dart';
import 'package:laravel_forge/ui/views/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/services/api.dart';
import 'core/services/authentication_service.dart';
import 'core/viewmodels/login_model.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());

  locator.registerLazySingleton(
    () => new Dio()
      ..options.headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Accept': 'application/json',
      }
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options) async {
            var prefs = await SharedPreferences.getInstance();
            var token = prefs.getString(FORGE_TOKEN_KEY);

            if (token != null) {
              options.headers
                  .putIfAbsent('Authorization', () => "Bearer $token");
            }

            return options;
          },
          onResponse: (Response response) {
            return response; // continue
          },
          onError: (DioError e) {
            if (e.response.statusCode == 401) {
              if (loginRoute.isCurrent == false) {
                navigatorKey.currentState.pushReplacementNamed('login');
              }
            }
            return e;
          },
        ),
      ),
  );

  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => RecipesModel());
  locator.registerFactory(() => ServersModel());
  locator.registerFactory(() => SettingsModel());
}
