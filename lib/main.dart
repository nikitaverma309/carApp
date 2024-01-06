import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:car_rental_app/page/auth/splash_page.dart';
import 'package:car_rental_app/page/main_page/main_page.dart';
import 'package:car_rental_app/provider/auth_provider.dart';
import 'package:car_rental_app/provider/theme_provider.dart';
import 'package:car_rental_app/service/navigation_service.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'constants/app_theme.dart';
import 'firebase_options.dart';
import 'router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(create: (context) => AuthProvider()),
        ],
        builder: (context, _) {
          return FutureBuilder<AdaptiveThemeMode>(
              future:
                  Provider.of<ThemeProvider>(context, listen: false).getTheme(),
              initialData: AdaptiveThemeMode.system,
              builder: (context, snapShot) {
                return AdaptiveTheme(
                    light: AppTheme.lightTheme,
                    dark: AppTheme.lightTheme,
                    initial: snapShot.hasData
                        ? snapShot.data ?? AdaptiveThemeMode.light
                        : AdaptiveThemeMode.light,
                    builder: (lightThemeData, darkThemeData) {
                      return MaterialApp(
                        navigatorKey: navigatorKey,
                        debugShowCheckedModeBanner: false,
                        onGenerateRoute: generateRoute,
                        darkTheme: lightThemeData,
                        theme: lightThemeData,
                        home: MainPage(),

                        // home:
                      );
                    });
              });
        });
  }
}
