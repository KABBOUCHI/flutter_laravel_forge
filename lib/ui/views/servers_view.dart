import 'package:flutter/material.dart';
import 'package:laravel_forge/core/models/server.dart';
import 'package:laravel_forge/core/viewmodels/views/servers_view_model.dart';
import 'package:laravel_forge/ui/shared/loading_indicator.dart';
import 'package:laravel_forge/ui/views/base_widget.dart';
import 'package:provider/provider.dart';

class ServersView extends StatefulWidget {
  @override
  _ServersViewState createState() => _ServersViewState();
}

class _ServersViewState extends State<ServersView> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<ServersViewModel>(
      model: ServersViewModel(api: Provider.of(context)),
      onModelReady: (model) => model.getServers(),
      builder: (context, model, child) => model.busy
          ? loadingIndicator()
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

class ServerCard extends StatefulWidget {
  final Server server;

  ServerCard({this.server});

  @override
  _ServerCardState createState() => _ServerCardState();
}

class _ServerCardState extends State<ServerCard> {
  bool _serverRefreshing = false;
  @override
  Widget build(BuildContext context) {
    final ServersViewModel model = Provider.of(context);
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
                if (_serverRefreshing == false) ...[
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Active"),
                  ),
                ],
                if (_serverRefreshing)
                  Container(
                    width: IconTheme.of(context).size,
                    height: IconTheme.of(context).size,
                    child: CircularProgressIndicator(),
                  ),
                Expanded(
                  child: Container(),
                ),
                PopupMenuButton(
                  onSelected: (result) async {
                    switch (result) {
                      case 0:
                        setState(() {
                          _serverRefreshing = true;
                        });
                        await model.refreshServer(widget.server);
                        setState(() {
                          _serverRefreshing = false;
                        });
                        break;
                      case 1:
                        model.rebootServer(widget.server);
                        break;
                      case 2:
                        Navigator.pushNamed(
                          context,
                          '/server',
                          arguments: widget.server,
                        );
                        break;
                      default:
                    }
                  },
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        value: 0,
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
                        value: 1,
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
                        value: 2,
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
                    widget.server.name,
                    style: new TextStyle(
                      color: Color(0Xff424c54),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                ServerCardInfo(
                  'Region',
                  Text(
                    widget.server.region,
                    style: new TextStyle(
                      color: Color(0Xff424c54),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                ServerCardInfo(
                  'Size',
                  Text(
                    widget.server.size,
                    style: new TextStyle(
                      color: Color(0Xff424c54),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                ServerCardInfo(
                  'PHP Version',
                  Text(
                    widget.server.phpVersion,
                    style: new TextStyle(
                      color: Color(0Xff424c54),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                ServerCardInfo(
                  "IP Address",
                  Text(
                    widget.server.ipAddress,
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
