import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fl_school/firebase_options.dart';
import 'package:fl_school/src/core/app_injector.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_school/src/ui/app/app.dart';
import 'package:hive_storage/hive_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await HiveStorageImp.hiveInjector();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await ScreenUtil.ensureScreenSize();
  await AppInjector.init(appRunner: () => runApp(EasyLocalization(
      supportedLocales: [Locale('en'),Locale('hi'),Locale("pa")],
      path: 'assets/translations',
      startLocale: Locale('en'),
      fallbackLocale: Locale('en'),

      child: SafeArea(bottom: true,top: false, child: MyApp()))));
}
