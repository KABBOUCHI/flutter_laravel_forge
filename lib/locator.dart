import 'package:get_it/get_it.dart';
import 'package:laravel_forge/core/viewmodels/recipes_model.dart';
import 'package:laravel_forge/core/viewmodels/servers_model.dart';
import 'package:laravel_forge/core/viewmodels/settings_model.dart';

import 'core/services/api.dart';
import 'core/services/authentication_service.dart';
import 'core/viewmodels/login_model.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());

  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => RecipesModel());
  locator.registerFactory(() => ServersModel());
  locator.registerFactory(() => SettingsModel());
}
