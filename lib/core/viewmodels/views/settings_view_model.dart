import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';
import '../base_model.dart';

class SettingsViewModel extends BaseModel {
  String _token;
  String get token => _token;

  Future getSettings() async {
    setBusy(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString(FORGE_TOKEN_KEY);
    setBusy(false);
  }

  Future logout() async {
    setBusy(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(FORGE_TOKEN_KEY);
    setBusy(false);
  }
}
