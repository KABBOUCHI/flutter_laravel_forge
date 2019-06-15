import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:laravel_forge/core/models/recipe.dart';
import 'package:laravel_forge/core/models/server.dart';
import 'package:laravel_forge/core/models/site.dart';
import 'package:laravel_forge/core/models/user.dart';
import 'package:laravel_forge/ui/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';

class Api {
  static const endpoint = 'https://forge.laravel.com/api/v1';
  Dio dio;

  Api() {
    dio = new Dio()
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
              navigatorKey.currentState.pushReplacementNamed(Routes.login);
            }
            return e;
          },
        ),
      );
  }

  String token;

  Future<User> getUserProfile(String token) async {
    this.token = token;

    var request = new Dio()
      ..options.headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: "Bearer $token",
      };
    var response;

    try {
      response = await request.get('$endpoint/user');
    } catch (e) {
      return null;
    }

    return User.fromJson(response.data['user']);
  }

  Future<List<Server>> getServers() async {
    var servers = List<Server>();

    var response = await dio.get('$endpoint/servers');

    if (response.statusCode != 200) return null;

    var parsed = response.data['servers'] as List<dynamic>;

    for (var server in parsed) {
      servers.add(Server.fromJson(server));
    }

    return servers;
  }

  Future<List<Recipe>> getRecipes() async {
    var recipes = List<Recipe>();

    var response = await dio.get('$endpoint/recipes');

    if (response.statusCode != 200) return null;

    for (var recipe in response.data['recipes']) {
      recipes.add(Recipe.fromJson(recipe));
    }

    return recipes;
  }

  Future<bool> rebootServer(int id) async {
    var response = await dio.post('$endpoint/servers/$id/reboot');

    return response.statusCode == 200;
  }

  Future<Server> getServer(int id) async {
    var response = await dio.get('$endpoint/servers/$id');

    if (response.statusCode != 200) return null;

    return Server.fromJson(response.data['server']);
  }

  Future<List<Site>> getSites(int id) async {
    var sites = List<Site>();

    var response = await dio.get('$endpoint/servers/$id/sites');

    if (response.statusCode != 200) return null;

    for (var site in response.data['sites']) {
      sites.add(Site.fromJson(site));
    }

    return sites;
  }
}
