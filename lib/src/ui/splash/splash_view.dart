import 'package:fl_school/src/core/app_assets.dart';
import 'package:fl_school/src/core/app_colors.dart';
import 'package:fl_school/src/core/app_image_view.dart';
import 'package:fl_school/src/data/blocs/language_bloc/language_bloc.dart';
import 'package:fl_school/src/data/blocs/role_bloc/role_bloc.dart';
import 'package:fl_school/src/enums/role_enum.dart';
import 'package:fl_school/src/extension/app_extension.dart';
import 'package:fl_school/src/ui/login/login_screen.dart';
import 'package:fl_school/src/ui/role_selection/role_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:fl_school/src/ui/dashboard/main_screen.dart';
import 'package:fl_school/src/ui/onbording/onbording_a.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_storage/hive_storage.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(seconds: 3)).then((value) async {
        var locale = await getHiveStorage.read<String>(
            key: "CURRENT_LOCALE", defaultValue: "en");
        context
            .read<LanguageBloc>()
            .add(ChangeLanguageEvent(locale: locale ?? "en"));
        context
            .read<RoleBloc>()
            .add(ChangeRoleEvent(roleEnum: RoleEnum.principle));
        context.pushReplacementScreen(nextScreen: LoginScreen());
      });
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
