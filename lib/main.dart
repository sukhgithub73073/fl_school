import 'package:firebase_core/firebase_core.dart';
import 'package:fl_school/firebase_options.dart';
import 'package:fl_school/src/core/app_injector.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_school/src/ui/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await ScreenUtil.ensureScreenSize();
  await AppInjector.init(appRunner: () => runApp(SafeArea(bottom: true,top: false, child: MyApp())));
}
