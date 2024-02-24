import 'package:fl_school/src/core/app_colors.dart';
import 'package:fl_school/src/core/app_tap_widget.dart';
import 'package:fl_school/src/core/app_text_style.dart';
import 'package:fl_school/src/core/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_school/src/core/app_colors.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: colorWhite,
      child: ListView(
        children: [


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TapWidget(
                  onTap: () {},
                  child: TextView(
                    text: "Buy",
                    color: colorBlack,
                    textSize: 16.sp,
                    textAlign: TextAlign.start,
                    style: AppTextStyleEnum.medium,
                    fontFamily: Family.bold,
                    lineHeight: 1.3,
                  ),
                ),
                Divider(color: colorGrayLight) ,
                TapWidget(
                  onTap: () {},
                  child: TextView(
                    text: "Sell",
                    color: colorBlack,
                    textSize: 16.sp,
                    textAlign: TextAlign.start,
                    style: AppTextStyleEnum.medium,
                    fontFamily: Family.bold,
                    lineHeight: 1.3,
                  ),
                ),

                Divider(color: colorGrayLight) ,
                TapWidget(
                  onTap: () {},
                  child: TextView(
                    text: "My favourites",
                    color: colorBlack,
                    textSize: 16.sp,
                    textAlign: TextAlign.start,
                    style: AppTextStyleEnum.medium,
                    fontFamily: Family.bold,
                    lineHeight: 1.3,
                  ),
                ),
                Divider(color: colorGrayLight) ,
                TapWidget(
                  onTap: () {},
                  child: TextView(
                    text: "My profile",
                    color: colorBlack,
                    textSize: 16.sp,
                    textAlign: TextAlign.start,
                    style: AppTextStyleEnum.medium,
                    fontFamily: Family.bold,
                    lineHeight: 1.3,
                  ),
                ),
                Divider(color: colorGrayLight) ,
                TapWidget(
                  onTap: () {},
                  child: TextView(
                    text: "About us",
                    color: colorBlack,
                    textSize: 16.sp,
                    textAlign: TextAlign.start,
                    style: AppTextStyleEnum.medium,
                    fontFamily: Family.bold,
                    lineHeight: 1.3,
                  ),
                ),
                Divider(color: colorGrayLight) ,
                TapWidget(
                  onTap: () {},
                  child: TextView(
                    text: "Share App",
                    color: colorBlack,
                    textSize: 16.sp,
                    textAlign: TextAlign.start,
                    style: AppTextStyleEnum.medium,
                    fontFamily: Family.bold,
                    lineHeight: 1.3,
                  ),
                ),
                Divider(color: colorGrayLight) ,
                TapWidget(
                  onTap: () {},
                  child: TextView(
                    text: "Advertise with us",
                    color: colorBlack,
                    textSize: 16.sp,
                    textAlign: TextAlign.start,
                    style: AppTextStyleEnum.medium,
                    fontFamily: Family.bold,
                    lineHeight: 1.3,
                  ),
                ),
                Divider(color: colorGrayLight) ,
                TapWidget(
                  onTap: () {},
                  child: TextView(
                    text: "Feedback",
                    color: colorBlack,
                    textSize: 16.sp,
                    textAlign: TextAlign.start,
                    style: AppTextStyleEnum.medium,
                    fontFamily: Family.bold,
                    lineHeight: 1.3,
                  ),
                ),

                Divider(color: colorGrayLight) ,
                TapWidget(
                  onTap: () {},
                  child: TextView(
                    text: "Contact us",
                    color: colorBlack,
                    textSize: 16.sp,
                    textAlign: TextAlign.start,
                    style: AppTextStyleEnum.medium,
                    fontFamily: Family.bold,
                    lineHeight: 1.3,
                  ),
                ),

                Divider(color: colorGrayLight) ,
                TapWidget(
                  onTap: () {},
                  child: TextView(
                    text: "Logout",
                    color: colorBlack,
                    textSize: 16.sp,
                    textAlign: TextAlign.start,
                    style: AppTextStyleEnum.medium,
                    fontFamily: Family.bold,
                    lineHeight: 1.3,
                  ),
                ),

                Divider(color: colorGrayLight) ,




              ],
            ),
          )
        ],
      ),
    );
  }
}
