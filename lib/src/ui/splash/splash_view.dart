import 'package:fl_school/src/core/app_assets.dart';
import 'package:fl_school/src/core/app_colors.dart';
import 'package:fl_school/src/core/app_image_view.dart';
import 'package:fl_school/src/extension/app_extension.dart';
import 'package:fl_school/src/ui/role_selection/role_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:fl_school/src/ui/dashboard/main_screen.dart';
import 'package:fl_school/src/ui/onbording/onbording_a.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      context.pushReplacementScreen(nextScreen: RoleSelectionScreen()) ;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                gradient: RadialGradient(colors: [
              colorSecendry,
              Colors.white,
            ], center: Alignment.topLeft, radius: 0.5.r)),
          ),
          Center(
              child: ImageView(
            height: 150.h,
            width: 150.w,
            url: AppAssets.logo,
            imageType: ImageType.asset,
          )),
        ],
      ),
    );
  }
}
