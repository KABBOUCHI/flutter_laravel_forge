import 'package:flutter/material.dart';
import 'package:laravel_forge/ui/router.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'provider_setup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: WillPopScope(
        onWillPop: () async => false,
        child: MaterialApp(
          title: 'Laravel Forge',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          initialRoute: initialRoute,
          navigatorKey: navigatorKey,
          routes: Router.routes,
        ),
      ),
    );
  }
}
