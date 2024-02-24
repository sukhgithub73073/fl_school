import 'package:fl_school/src/core/app_injector.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_school/src/ui/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await AppInjector.init(appRunner: () => runApp(SafeArea(child: MyApp())));
}
