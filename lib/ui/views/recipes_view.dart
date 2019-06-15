import 'package:flutter/material.dart';
import 'package:laravel_forge/core/viewmodels/views/recipes_view_model.dart';
import 'package:laravel_forge/ui/shared/loading_indicator.dart';
import 'package:laravel_forge/ui/views/base_widget.dart';
import 'package:provider/provider.dart';

class RecepiesView extends StatefulWidget {
  @override
  _RecipesViewState createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecepiesView> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<RecipesViewModel>(
      model: RecipesViewModel(api: Provider.of(context)),
      onModelReady: (model) => model.getRecipes(),
      builder: (context, model, child) => model.busy
          ? loadingIndicator()
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
