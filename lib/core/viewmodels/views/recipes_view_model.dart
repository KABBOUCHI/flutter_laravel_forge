import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:laravel_forge/core/models/recipe.dart';
import 'package:laravel_forge/core/services/api.dart';

import '../base_model.dart';

class RecipesViewModel extends BaseModel {
  Api _api;

  RecipesViewModel({@required Api api}) : _api = api;

  List<Recipe> _recipes = new List();

  List<Recipe> get recipes => _recipes;

  Future getRecipes() async {
    setBusy(true);
    _recipes = await _api.getRecipes();
    setBusy(false);
  }
}
