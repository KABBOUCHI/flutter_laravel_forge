import 'package:flutter/material.dart';
import 'package:laravel_forge/ui/views/recipes_view.dart';
import 'package:laravel_forge/ui/views/servers_view.dart';
import 'package:laravel_forge/ui/views/settings_view.dart';

int currentIndex = 0;

class MainView extends StatefulWidget {
  @override
  _ServersViewState createState() => new _ServersViewState();
}

class _ServersViewState extends State<MainView> {
  get _tabName {
    switch (currentIndex) {
      case 0:
        return 'Servers';
      case 1:
        return 'Recepies';
      case 2:
        return 'Settings';
    }
  }

  get _getPage {
    switch (currentIndex) {
      case 0:
        return ServersView();
      case 1:
        return RecepiesView();
      case 2:
        return SettingsView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        title: new Text(
          "Laravel Forge - $_tabName",
          style: new TextStyle(color: Colors.white),
        ),
      ),
      body: _getPage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i) {
          setState(() {
            currentIndex = i;
          });
        },
        currentIndex: currentIndex,
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
