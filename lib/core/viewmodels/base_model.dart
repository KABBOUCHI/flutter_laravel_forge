import 'package:flutter/widgets.dart';
import 'package:laravel_forge/core/enums/viewsate.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
