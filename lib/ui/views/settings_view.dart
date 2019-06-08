import 'package:flutter/material.dart';
import 'package:laravel_forge/core/enums/viewsate.dart';
import 'package:laravel_forge/core/viewmodels/settings_model.dart';
import 'package:laravel_forge/ui/shared/ui_helpers.dart';

import 'base_view.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsModel>(
      onModelReady: (model) => model.getSettings(),
      builder: (context, model, child) => model.state == ViewState.Busy
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: <Widget>[
                Text('Token: ' + model.token),
                UIHelper.verticalSpaceSmall(),
                FlatButton(
                  color: Colors.green,
                  child: Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    await model.logout();
                    Navigator.pushReplacementNamed(context, 'login');
                  },
                )
              ],
            ),
    );
  }
}
