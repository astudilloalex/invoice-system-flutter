import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:invoice_system/ui/routes/route_pages.dart';
import 'package:invoice_system/ui/theme/app_theme_data.dart';
import 'package:invoice_system/util/local_data.dart';
import 'package:invoice_system/util/util.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
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
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: RoutePages.router,
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
      ],
      theme: AppThemeData.light,
    );
  }
}

void _setupGetIt() {
  http.Client httpClient = http.Client();
  getIt.registerSingleton<LocalData>(const LocalData());
  //getIt.registerLazySingleton<UserRepository>(() => UserRepository);
}
