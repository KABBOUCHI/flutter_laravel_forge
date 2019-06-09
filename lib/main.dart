import 'package:flutter/material.dart';
import 'package:laravel_forge/ui/router.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'core/models/user.dart';
import 'core/services/authentication_service.dart';
import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      initialData: User.initial(),
      builder: (context) => locator<AuthenticationService>().userController,
      child: WillPopScope(
        onWillPop: () async => false,
        child: MaterialApp(
          title: 'Laravel Forge',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          initialRoute: initialRoute,
          onGenerateRoute: Router.generateRoute,
          navigatorKey: navigatorKey,
          routes: Router.routes,
        ),
      ),
    );
  }
}
