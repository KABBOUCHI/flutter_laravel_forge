import 'package:flutter/material.dart';

int _currentIndex = 0;

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Laravel Forge',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new ServersPage(title: 'Laravel Forge - Servers'),
    );
  }
}

class ServersPage extends StatefulWidget {
  ServersPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ServersPageState createState() => new _ServersPageState();
}

class _ServersPageState extends State<ServersPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          widget.title,
          style: new TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: List.generate(
          4,
          (i) => ServerCard(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i) {
          setState(() {
            _currentIndex = i;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.dashboard),
            title: new Text('Servers'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.insert_drive_file),
            title: new Text('Recipes'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.settings),
            title: new Text('Settings'),
          ),
        ],
      ),
    );
  }
}

class ServerCard extends StatelessWidget {
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
                    'solitary-brook',
                    style: new TextStyle(
                      color: Color(0Xff424c54),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                ServerCardInfo(
                  'Region',
                  Text(
                    'Paris',
                    style: new TextStyle(
                      color: Color(0Xff424c54),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                ServerCardInfo(
                  'Size',
                  Text(
                    '4GB',
                    style: new TextStyle(
                      color: Color(0Xff424c54),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                ServerCardInfo(
                  'PHP Version',
                  Text(
                    'php72',
                    style: new TextStyle(
                      color: Color(0Xff424c54),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                ServerCardInfo(
                  "IP Address",
                  Text(
                    "17.6.10.73",
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
