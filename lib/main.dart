import 'package:coursezbase/utils/custom_scaffoldutils.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';
import 'di/network_module.dart';
import 'domain/repository/shared/auth_shared_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initModules();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final AuthSharedRepository authSharedRepository = AuthSharedRepository(prefs);
  GetIt.I.registerFactory(() => prefs);
  GetIt.I.registerSingleton(authSharedRepository);
  GetIt.I.registerFactory(() => configureDio(authSharedRepository));
  GetIt.I.registerSingleton<CustomScaffoldUtils>(CustomScaffoldUtils());

  runApp(const MyApp());
}