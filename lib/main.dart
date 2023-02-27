import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:invoice_system/src/common.dart';
import 'package:invoice_system/src/user/application/user_service.dart';
import 'package:invoice_system/src/user/domain/user_repository.dart';
import 'package:invoice_system/src/user/infrastructure/http_user_repository.dart';
import 'package:invoice_system/ui/routes/route_pages.dart';
import 'package:invoice_system/ui/theme/app_theme_data.dart';
import 'package:invoice_system/utilities/screen/screen_info.dart';
import 'package:invoice_system/utilities/util.dart';
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
  // Define variables to use in singleton classes.
  const SecureLocalData secureLocalData = SecureLocalData();
  final HttpBaseClient httpClient =
      HttpBaseClient(secureLocalData, http.Client());

  // Register the common singletons.
  getIt.registerLazySingleton<ScreenInfo>(() => const ScreenInfo());
  getIt.registerSingleton<SecureLocalData>(secureLocalData);
  getIt.registerSingleton<HttpBaseClient>(httpClient);

  // Register all services.
  getIt.registerLazySingleton<UserService>(
    () => UserService(HttpUserRepository(httpClient)),
  );
  // LocalData
  //getIt.registerSingleton<LocalData>(const LocalData());
  // getIt.registerSingleton<HttpCommonClient>(HttpCommonClient(http.Client()));

  // getIt.registerLazySingleton<UserRepository>(
  //   () => HttpUserRepository(getIt<HttpCommonClient>()),
  // );
  //getIt.registerLazySingleton<UserRepository>(() => UserRepository);
}
