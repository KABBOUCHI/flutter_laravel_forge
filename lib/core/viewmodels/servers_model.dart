import 'dart:async';

import 'package:laravel_forge/core/enums/viewsate.dart';
import 'package:laravel_forge/core/models/server.dart';
import 'package:laravel_forge/core/services/api.dart';

import '../../locator.dart';
import 'base_model.dart';

class ServersModel extends BaseModel {
  Api _api = locator<Api>();
  List<Server> _servers = new List();

  List<Server> get servers => _servers;

  Future getServers() async {
    setState(ViewState.Busy);
    _servers = await _api.getServers();
    setState(ViewState.Idle);
  }
}