import 'package:flutter/material.dart';
import 'package:laravel_forge/core/enums/viewsate.dart';
import 'package:laravel_forge/core/viewmodels/recipes_model.dart';

import 'base_view.dart';

class RecepiesView extends StatefulWidget {
  @override
  _RecipesViewState createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecepiesView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<RecipesModel>(
      onModelReady: (model) => model.getRecipes(),
      builder: (context, model, child) => model.state == ViewState.Busy
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: List.generate(
                model.recipes.length,
                (i) => ListTile(
                      title: Text("Name: " + model.recipes[i].name),
                      subtitle: Text("User: " + model.recipes[i].user),
                      trailing: Icon(Icons.edit),
                    ),
              ),
            ),
    );
  }
}
