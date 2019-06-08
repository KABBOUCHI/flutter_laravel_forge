import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:laravel_forge/core/models/recipe.dart';
import 'package:laravel_forge/core/models/server.dart';
import 'package:laravel_forge/core/models/user.dart';

/// The service responsible for networking requests
class Api {
  static const endpoint = 'https://forge.laravel.com/api/v1';
  String token;

  var client = new http.Client();

  Future<User> getUserProfile(String token) async {
    this.token = token;

    var response = await client.get(
      '$endpoint/user',
      headers: {
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );

    if (response.statusCode != 200) return null;

    return User.fromJson(json.decode(response.body)['user']);
  }

  Future<List<Server>> getServers() async {
    var servers = List<Server>();

    var response = await client.get(
      '$endpoint/servers',
      headers: {
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );

    if (response.statusCode != 200) return null;

    var parsed = json.decode(response.body)['servers'] as List<dynamic>;

    for (var server in parsed) {
      servers.add(Server.fromJson(server));
    }

    return servers;
  }

  Future<List<Recipe>> getRecipes() async {
    var recipes = List<Recipe>();

    var response = await client.get(
      '$endpoint/recipes',
      headers: {
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );

    if (response.statusCode != 200) return null;

    var parsed = json.decode(response.body)['recipes'] as List<dynamic>;

    for (var recipe in parsed) {
      recipes.add(Recipe.fromJson(recipe));
    }

    return recipes;
  }
}
