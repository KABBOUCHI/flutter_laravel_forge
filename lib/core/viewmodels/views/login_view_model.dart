import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:laravel_forge/core/services/authentication_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';
import '../base_model.dart';

class LoginViewModel extends BaseModel {
  AuthenticationService _authenticationService;

  LoginViewModel({
    @required AuthenticationService authenticationService,
  }) : _authenticationService = authenticationService;

  String errorMessage;

  Future<bool> login(String token) async {
    errorMessage = null;
    setBusy(true);

    if (token == null || token == '') {
      errorMessage = 'Token is required';
      setBusy(false);
      return false;
    }
    bool success = false;

    success = await _authenticationService.login(token);

    if (success == true) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(FORGE_TOKEN_KEY, token);
    } else {
      errorMessage = 'Token is invalid';
    }

    setBusy(false);
    return success;
  }

  Future<bool> checkAuth() async {
    setBusy(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(FORGE_TOKEN_KEY);

    bool success = false;

    if (token != null) {
      success = await _authenticationService.login(token);
      if (success == false) {
        prefs.remove(FORGE_TOKEN_KEY);
      }
    }

    setBusy(false);
    return success;
  }
}
