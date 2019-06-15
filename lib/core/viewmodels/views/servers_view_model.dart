import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:laravel_forge/core/models/server.dart';
import 'package:laravel_forge/core/models/site.dart';
import 'package:laravel_forge/core/services/api.dart';
import 'package:laravel_forge/core/viewmodels/base_model.dart';

class ServersViewModel extends BaseModel {
  Api _api;

  ServersViewModel({
    @required Api api,
  }) : _api = api;

  List<Server> _servers = new List();

  List<Server> get servers => _servers;

  Future getServers() async {
    setBusy(true);
    _servers = await _api.getServers();
    setBusy(false);
  }

  void rebootServer(Server server) async {
    await _api.rebootServer(server.id);
  }

  Future refreshServer(Server server) async {
    var _server = await _api.getServer(server.id);
    var index = _servers.indexWhere((s) => s.id == server.id);
    _servers[index] = _server;
    notifyListeners();
  }

  Future<List<Site>> getSites(Server server) async {
    setBusy(true);
    List<Site> _sites;
    _sites = await _api.getSites(server.id);
    setBusy(false);
    return _sites;
  }
}
