import 'package:flutter/material.dart';
import 'package:laravel_forge/core/enums/viewsate.dart';
import 'package:laravel_forge/core/models/server.dart';
import 'package:laravel_forge/core/viewmodels/servers_model.dart';

import 'base_view.dart';

class ServersView extends StatefulWidget {
  @override
  _ServersViewState createState() => _ServersViewState();
}

class _ServersViewState extends State<ServersView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ServersModel>(
      onModelReady: (model) => model.getServers(),
      builder: (context, model, child) => model.state == ViewState.Busy
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: List.generate(
                model.servers.length,
                (i) => ServerCard(
                      server: model.servers[i],
                    ),
              ),
            ),
    );
  }
}

class ServerCard extends StatelessWidget {
  final Server server;

  ServerCard({this.server});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              top: 8.0,
              bottom: 8.0,
            ),
            color: Color(0xffebeced),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("Active"),
                ),
                Expanded(
                  child: Container(),
                ),
                PopupMenuButton(
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: new Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.refresh,
                                color: Colors.blueAccent,
                              ),
                            ),
                            Text("Refresh"),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        child: new Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.settings_backup_restore,
                                color: Colors.red,
                              ),
                            ),
                            Text("Reboot"),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        child: new Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.apps,
                                color: Colors.green,
                              ),
                            ),
                            Text("Manage"),
                          ],
                        ),
                      ),
                    ];
                  },
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              top: 8.0,
              bottom: 8.0,
            ),
            child: Column(
              children: <Widget>[
                ServerCardInfo(
                  'Name',
                  Text(
                    server.name,
                    style: new TextStyle(
                      color: Color(0Xff424c54),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                ServerCardInfo(
                  'Region',
                  Text(
                    server.region,
                    style: new TextStyle(
                      color: Color(0Xff424c54),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                ServerCardInfo(
                  'Size',
                  Text(
                    server.size,
                    style: new TextStyle(
                      color: Color(0Xff424c54),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                ServerCardInfo(
                  'PHP Version',
                  Text(
                    server.php_version,
                    style: new TextStyle(
                      color: Color(0Xff424c54),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                ServerCardInfo(
                  "IP Address",
                  Text(
                    server.ip_address,
                    style: new TextStyle(
                      color: Color(0Xff424c54),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                ServerCardInfo(
                    "Connection",
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: new Container(
                            padding: const EdgeInsets.all(6.0),
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        Text(
                          "Successful",
                          style: new TextStyle(
                            color: Color(0Xff424c54),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ServerCardInfo extends StatelessWidget {
  final String title;
  final Widget child;

  ServerCardInfo(this.title, this.child);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: new TextStyle(
              color: Color(0Xff424c54),
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: Container()),
          child,
        ],
      ),
    );
  }
}
