
import 'package:fl_school/src/core/app_bloc_providers.dart';
import 'package:fl_school/src/core/app_strings.dart';
import 'package:fl_school/src/core/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fl_school/src/ui/splash/splash_view.dart';

class MyApp extends StatelessWidget {
  final String fontFamily = "Montserrat";

  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return AppBlocProvider(
      child: MaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        darkTheme: AppTheme.theme,
        home: SplashView(),
      ),
    );
  }
}
