import 'package:flutter/material.dart';
import 'package:laravel_forge/core/enums/viewsate.dart';
import 'package:laravel_forge/core/viewmodels/login_model.dart';
import 'package:laravel_forge/ui/shared/app_colors.dart';
import 'package:laravel_forge/ui/widgets/login_header.dart';
import '../router.dart';
import 'base_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();
  bool changingRouteOnStart = false;
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      onModelReady: (model) async {
        var loginSuccess = await model.checkAuth();
        if (loginSuccess) {
          setState(() {
            changingRouteOnStart = true;
          });
          Navigator.pushReplacementNamed(context, Routes.home);
        }
      },
      builder: (context, model, child) => Scaffold(
            backgroundColor: backgroundColor,
            body: model.state == ViewState.Busy || changingRouteOnStart == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      LoginHeader(
                          validationMessage: model.errorMessage,
                          controller: _controller),
                      model.state == ViewState.Busy
                          ? CircularProgressIndicator()
                          : FlatButton(
                              color: Colors.green,
                              child: Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                var loginSuccess =
                                    await model.login(_controller.text);
                                if (loginSuccess) {
                                  Navigator.of(context, rootNavigator: true)
                                      .pushReplacementNamed(Routes.home);
                                }
                              },
                            )
                    ],
                  ),
          ),
    );
  }
}
