import 'package:flutter/material.dart';
import 'package:laravel_forge/core/viewmodels/views/login_view_model.dart';
import 'package:laravel_forge/ui/shared/app_colors.dart';
import 'package:laravel_forge/ui/shared/loading_indicator.dart';
import 'package:laravel_forge/ui/widgets/login_header.dart';
import 'package:provider/provider.dart';
import '../router.dart';
import 'base_widget.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();
  bool changingRouteOnStart = false;
  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      model: LoginViewModel(authenticationService: Provider.of(context)),
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
        body: model.busy || changingRouteOnStart == true
            ? loadingIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LoginHeader(
                      validationMessage: model.errorMessage,
                      controller: _controller),
                  model.busy
                      ? loadingIndicator()
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
                              Navigator.pushReplacementNamed(
                                context,
                                Routes.home,
                              );
                            }
                          },
                        )
                ],
              ),
      ),
    );
  }
}
