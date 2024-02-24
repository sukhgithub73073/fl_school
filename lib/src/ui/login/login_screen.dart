import 'package:fl_school/src/core/app_assets.dart';
import 'package:fl_school/src/core/app_image_view.dart';
import 'package:fl_school/src/core/app_strings.dart';
import 'package:fl_school/src/enums/role_enum.dart';
import 'package:fl_school/src/ui/register/school_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_school/src/core/app_button.dart';
import 'package:fl_school/src/core/app_colors.dart';
import 'package:fl_school/src/core/app_input_field.dart';
import 'package:fl_school/src/core/app_tap_widget.dart';
import 'package:fl_school/src/core/app_text_style.dart';
import 'package:fl_school/src/core/common_space.dart';
import 'dart:math';

import 'package:fl_school/src/core/custom_clipper.dart';
import 'package:fl_school/src/core/text_view.dart';
import 'package:fl_school/src/data/blocs/login_bloc/login_bloc.dart';
import 'package:fl_school/src/extension/app_extension.dart';
import 'package:fl_school/src/ui/dashboard/main_screen.dart';
import 'package:fl_school/src/ui/register/register_screen.dart';
import 'package:fl_school/src/utility/validation_util.dart';

class LoginScreen extends StatefulWidget {
  final RoleEnum roleEnum;

  LoginScreen({super.key, required this.roleEnum});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController(text: "sukhmander@gmail.com");
  var passwordController = TextEditingController(text: "Qwerty@123");

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Stack(
        children: [
          ImageView(
              url: AppAssets.topRound,
              width: double.maxFinite,
              height: 150.h,
              fit: BoxFit.fill),
          ListView(children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              height: 150.h,
              width: 150.w,
              decoration: BoxDecoration(
                  border: Border.all(color: colorSecendry, width: 3.w),
                  color: colorWhite,
                  shape: BoxShape.circle),
              child: Center(
                child: ImageView(
                  margin: EdgeInsets.all(20.w),
                  url: AppAssets.logo,
                  imageType: ImageType.asset,
                ),
              ),
            ),
            spaceVertical(space: 10.h),
            TextView(
              text: AppStrings.secureLogin,
              color: colorPrimary,
              textSize: 20.sp,
              textAlign: TextAlign.center,
              style: AppTextStyleEnum.bold,
              fontFamily: Family.bold,
              lineHeight: 1.3,
            ),
            spaceVertical(space: 10.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  CustomTextField(
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      paddingHorizontal: 20.0,
                      hasViewHight: false,
                      labelText: "Email",
                      hintText: "itsmemamun1@gmail.com",
                      numberOfLines: 1,
                      hintFontWeight: FontWeight.w400,
                      hintTextColor: colorGray.withOpacity(0.6)),
                  spaceVertical(space: 20.h),
                  CustomTextField(
                      controller: passwordController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      paddingHorizontal: 20.0,
                      hasViewHight: false,
                      labelText: "Password",
                      hintText: "***********",
                      numberOfLines: 1,
                      borderColor: colorInputBorder,
                      hintFontWeight: FontWeight.w400,
                      hintTextColor: colorInputBorder.withOpacity(0.6)),
                  spaceVertical(space: 30.h),
                  BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        context.pushReplacementScreen(nextScreen: MainScreen());
                      }
                    },
                    builder: (context, state) {
                      return Container(
                        height: 40.h,
                        width: double.infinity,
                        decoration: BoxDecoration(color: colorPrimary),
                        child: AppSimpleButton(
                          onDoneFuction: () async {
                            if (!ValidationUtil.emailValidation(
                                email: emailController.text)) {
                            } else if (!ValidationUtil.passwordValidation(
                                password: passwordController.text)) {
                            } else {
                              context
                                  .read<LoginBloc>()
                                  .add(DoLoginEvent(map: {}));
                            }
                          },
                          buttonBackgroundColor: colorPrimary,
                          nameText: "Login",
                          textSize: 18.sp,
                        ),
                      );
                    },
                  ),
                  spaceVertical(space: 10.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextView(
                      text: "Forgot Passsword ?",
                      color: colorGray,
                      textSize: 16.sp,
                      textAlign: TextAlign.end,
                      style: AppTextStyleEnum.medium,
                      fontFamily: Family.medium,
                      lineHeight: 1.3,
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff1959a9),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  topLeft: Radius.circular(5)),
                            ),
                            alignment: Alignment.center,
                            child: Text('f',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff2872ba),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(5.r),
                                  topRight: Radius.circular(5.r)),
                            ),
                            alignment: Alignment.center,
                            child: Text('Log in with Facebook',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TapWidget(
                    onTap: () {
                      context.pushScreen(nextScreen: SchoolCodeScreen());
                    },
                    child: TextView(
                      text: "Don\'t have an account ? Register",
                      color: colorGray,
                      textSize: 12.sp,
                      textAlign: TextAlign.center,
                      style: AppTextStyleEnum.medium,
                      fontFamily: Family.medium,
                      lineHeight: 1.3,
                    ),
                  )
                ],
              ),
            )
          ]),
        ],
      ),
    );


  }
}
