import 'package:flutter/material.dart';
import 'package:laravel_forge/core/enums/viewsate.dart';
import 'package:laravel_forge/core/models/server.dart';
import 'package:laravel_forge/core/models/site.dart';
import 'package:laravel_forge/core/viewmodels/servers_model.dart';
import 'package:laravel_forge/ui/shared/loading_indicator.dart';

import 'base_view.dart';

class ServerView extends StatefulWidget {
  final Server server;

  const ServerView({Key key, this.server}) : super(key: key);

  @override
  _ServerViewState createState() => _ServerViewState();
}

class _ServerViewState extends State<ServerView> {
  List<Site> _sites = new List();

  @override
  Widget build(BuildContext context) {
    return BaseView<ServersModel>(
      onModelReady: (model) async {
        _sites = await model.getSites(widget.server);
      },
      builder: (context, model, child) => Scaffold(
        appBar: new AppBar(
          title: new Text(
            widget.server.name,
            style: new TextStyle(color: Colors.white),
          ),
        ),
        body: model.state == ViewState.Busy
            ? loadingIndicator()
            : ListView.builder(
                itemCount: _sites.length,
                itemBuilder: (_, i) => ListTile(
                  title: Text(_sites[i].name),
                ),
              ),
      ),
    );
  }
}
