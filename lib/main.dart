import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:invoice_system/ui/routes/route_pages.dart';
import 'package:invoice_system/ui/theme/app_theme_data.dart';
import 'package:invoice_system/util/local_data.dart';
import 'package:invoice_system/util/util.dart';

void main() {
  _setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      darkTheme: AppThemeData.dark,
      routerConfig: RoutePages.router,
      theme: AppThemeData.light,
    );
  }
}

void _setupGetIt() {
  http.Client httpClient = http.Client();
  getIt.registerSingleton<LocalData>(const LocalData());
  //getIt.registerLazySingleton<UserRepository>(() => UserRepository);
}
