import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:laravel_forge/core/models/recipe.dart';
import 'package:laravel_forge/core/models/server.dart';
import 'package:laravel_forge/core/models/user.dart';
import 'package:laravel_forge/locator.dart';

/// The service responsible for networking requests
class Api {
  static const endpoint = 'https://forge.laravel.com/api/v1';
  Dio dio = locator<Dio>();

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
}
