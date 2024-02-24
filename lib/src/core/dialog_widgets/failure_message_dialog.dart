import 'package:fl_school/src/core/app_button.dart';
import 'package:fl_school/src/core/app_colors.dart';
import 'package:fl_school/src/core/app_image_view.dart';
import 'package:fl_school/src/core/app_text_style.dart';
import 'package:fl_school/src/core/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ErrorDailog extends StatelessWidget {
  final Function() onTap;
  final String message ;
  final Function()? dismiss;
  const ErrorDailog({super.key, required this.onTap, this.dismiss, required this.message});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        mainView()
      ],
    );
  }

  Widget  mainView(){
    return  Column(
      children: [

        TextView(
          text: "$message",
          color: colorBlack,
          textSize: 12.sp,
          textAlign: TextAlign.center,
          style: AppTextStyleEnum.medium,
          fontFamily: Family.medium,
          lineHeight: 1.3,
        ) ,


        AppSimpleButton(
          onDoneFuction:onTap,
          buttonBackgroundColor: colorPrimary,
          nameText: "Ok",
          textSize: 18.sp,
        ),
      ],
    );

  }
}
