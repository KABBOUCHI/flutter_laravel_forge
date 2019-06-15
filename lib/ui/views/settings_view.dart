import 'package:flutter/material.dart';
import 'package:laravel_forge/core/viewmodels/views/settings_view_model.dart';
import 'package:laravel_forge/ui/shared/loading_indicator.dart';
import 'package:laravel_forge/ui/shared/ui_helpers.dart';
import 'package:laravel_forge/ui/views/base_widget.dart';

import '../router.dart';
import 'main_view.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<SettingsViewModel>(
      model: SettingsViewModel(),
      onModelReady: (model) => model.getSettings(),
      builder: (context, model, child) => model.busy
          ? loadingIndicator()
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
                    currentIndex = 0;
                    Navigator.of(context, rootNavigator: true)
                        .pushReplacementNamed(Routes.login);
                  },
                )
              ],
            ),
    );
  }
}
