import 'dart:async';

import 'package:laravel_forge/core/enums/viewsate.dart';
import 'package:laravel_forge/core/models/recipe.dart';
import 'package:laravel_forge/core/services/api.dart';

import '../../locator.dart';
import 'base_model.dart';

class RecipesModel extends BaseModel {
  Api _api = locator<Api>();
  List<Recipe> _recipes = new List();

  List<Recipe> get recipes => _recipes;

  Future getRecipes() async {
    setState(ViewState.Busy);
    _recipes = await _api.getRecipes();
    setState(ViewState.Idle);
  }
}
