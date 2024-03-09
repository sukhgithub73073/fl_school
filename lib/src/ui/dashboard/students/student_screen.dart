import 'package:fl_school/src/core/app_assets.dart';
import 'package:fl_school/src/core/app_colors.dart';
import 'package:fl_school/src/core/app_dialog.dart';
import 'package:fl_school/src/core/app_image_view.dart';
import 'package:fl_school/src/core/app_loader.dart';
import 'package:fl_school/src/core/app_tap_widget.dart';
import 'package:fl_school/src/core/app_text_style.dart';
import 'package:fl_school/src/core/common_space.dart';
import 'package:fl_school/src/core/dialog_widgets/failure_message_dialog.dart';
import 'package:fl_school/src/core/text_view.dart';
import 'package:fl_school/src/data/blocs/student_bloc/student_bloc.dart';
import 'package:fl_school/src/extension/app_extension.dart';
import 'package:fl_school/src/ui/register/register_screen.dart';
import 'package:fl_school/src/utility/app_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  @override
  void initState() {
    context.read<StudentBloc>().add(GetStudentEvent(map: {
          "school_code": "GSSS19543",
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              ImageView(
                  url: AppAssets.topRound,
                  width: double.maxFinite,
                  height: 150.h,
                  fit: BoxFit.fill),
              ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
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
                    spaceVertical(space: 20.h),
                    BlocConsumer<StudentBloc, StudentState>(
                      listener: (context, state) {
                        if (state is StudentGetLoading) {
                          printLog(
                              "Create listener>>>>>>>>>>>StudentLoaderShow");
                          // appLoader(context);
                        } else if (state is StudentGetLoadingDismiss) {
                          // context.dissmissLoading();
                        }
                      },
                      builder: (context, state) {
                        if (state is StudentGetSuccess) {
                          return state.responseModel.data.isEmpty
                              ? Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 40),
                                  child: TextView(
                                    text: "No Records found",
                                    color: colorBlack,
                                    textSize: 12.sp,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyleEnum.medium,
                                    fontFamily: Family.medium,
                                    lineHeight: 1.3,
                                  ),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: state.responseModel.data.length,
                                  itemBuilder: (c, i) {
                                    return Card(
                                      elevation: 10.h,
                                      margin: EdgeInsets.all(10.r),
                                      shadowColor: colorPrimary,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                  style: BorderStyle.solid,
                                                  color: colorPrimary,
                                                  // Specify the border color
                                                  width:
                                                      2, // Specify the border width
                                                ),
                                              ),
                                              child: Center(
                                                child: ImageView(
                                                  size: 70,
                                                  url: AppAssets.logo,
                                                  imageType: ImageType.asset,
                                                ),
                                              ),
                                            ),
                                            spaceHorizontal(space: 10.w),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  TextView(
                                                    text:
                                                        "${state.responseModel.data[i]["name"]}",
                                                    color: colorPrimary,
                                                    textSize: 15.sp,
                                                    textAlign: TextAlign.start,
                                                    style:
                                                        AppTextStyleEnum.bold,
                                                    fontFamily: Family.medium,
                                                    lineHeight: 1.3,
                                                  ),
                                                  spaceVertical(space: 5.h),
                                                  TextView(
                                                    text:
                                                        "${state.responseModel.data[i]["email"]}",
                                                    color: colorBlack
                                                        .withOpacity(0.6),
                                                    textSize: 13.sp,
                                                    textAlign: TextAlign.start,
                                                    style:
                                                        AppTextStyleEnum.medium,
                                                    fontFamily: Family.medium,
                                                    lineHeight: 1.3,
                                                  ),
                                                  TextView(
                                                    text:
                                                        "${state.responseModel.data[i]["address"]} dropdown button lets the user",
                                                    color: colorBlack
                                                        .withOpacity(0.4),
                                                    textSize: 10.sp,
                                                    maxlines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.start,
                                                    style:
                                                        AppTextStyleEnum.medium,
                                                    fontFamily: Family.medium,
                                                    lineHeight: 1.3,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                        }
                        return SizedBox.shrink();
                      },
                    ),
                  ]),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: Row(
                  children: [
                    TapWidget(
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_back,
                        color: colorWhite,
                        size: 20.h,
                      ),
                    ),
                    spaceHorizontal(space: 10.w),
                    TextView(
                      text: "Student",
                      color: colorWhite,
                      textSize: 16.sp,
                      textAlign: TextAlign.center,
                      style: AppTextStyleEnum.medium,
                      fontFamily: Family.medium,
                      lineHeight: 1.3,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushScreen(nextScreen: RegisterScreen());
        },
        child: Icon(Icons.add, color: colorWhite),
        backgroundColor: colorPrimary,
      ),
    );
  }
}
