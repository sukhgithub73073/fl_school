import 'package:fl_school/src/data/blocs/classes_bloc/classes_bloc.dart';
import 'package:fl_school/src/data/blocs/groups_bloc/groups_bloc.dart';
import 'package:fl_school/src/data/blocs/student_bloc/student_bloc.dart';
import 'package:fl_school/src/data/blocs/subject_bloc/subject_bloc.dart';
import 'package:fl_school/src/data/blocs/teacher_bloc/teacher_bloc.dart';
import 'package:fl_school/src/extension/app_extension.dart';
import 'package:fl_school/src/ui/dashboard/class_groups/classes_screen.dart';
import 'package:fl_school/src/ui/dashboard/class_groups/groups_screen.dart';
import 'package:fl_school/src/ui/dashboard/students/student_screen.dart';
import 'package:fl_school/src/ui/dashboard/subjects/subject_screen.dart';
import 'package:fl_school/src/ui/dashboard/teachers/teachers_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fl_school/src/core/app_assets.dart';
import 'package:fl_school/src/core/app_colors.dart';
import 'package:fl_school/src/core/app_image_view.dart';
import 'package:fl_school/src/core/app_tap_widget.dart';
import 'package:fl_school/src/core/app_text_style.dart';
import 'package:fl_school/src/core/common_space.dart';
import 'package:fl_school/src/core/text_view.dart';
import 'package:fl_school/src/data/blocs/dashboard_bloc/dashboard_bloc.dart';
import 'package:fl_school/src/ui/dashboard/drawer/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();

    context.read<SubjectBloc>().add(GetSubjectEvent(map: {
      "school_code": "GSSS19543",
    }));
    context.read<StudentBloc>().add(GetStudentEvent(map: {
      "school_code": "GSSS19543",
    }));
    context.read<TeacherBloc>().add(GetTeacherEvent(map: {
      "school_code": "GSSS19543",
    }));
    context.read<GroupsBloc>().add(GetGroupsEvent(map: {
      "school_code": "GSSS19543",
    }));
    context.read<ClassesBloc>().add(GetClassesEvent(map: {
      "school_code": "GSSS19543",
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: colorWhite,
      drawerEnableOpenDragGesture: true,
      drawer: DrawerScreen(),
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
            spaceVertical(space: 20.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                  color: colorPrimary,
                  borderRadius: BorderRadius.circular(15.r)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        TextView(
                          text: "Welcome Message",
                          color: colorWhite,
                          textSize: 15.sp,
                          textAlign: TextAlign.left,
                          style: AppTextStyleEnum.regular,
                          fontFamily: Family.regular,
                          lineHeight: 1.3,
                        ),
                        spaceHorizontal(space: 10.w),
                        Icon(
                          Icons.arrow_forward,
                          color: colorWhite,
                        )
                      ],
                    ),
                    spaceVertical(space: 10.h),
                    TextView(
                      text:
                      "The standard Lorem Ipsum passage Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                      color: colorWhite,
                      textSize: 13.sp,
                      textAlign: TextAlign.left,
                      style: AppTextStyleEnum.small,
                      fontFamily: Family.regular,
                      lineHeight: 1.3,
                    ),
                  ]),
            ),
            spaceVertical(space: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    TapWidget(
                      onTap: () {
                        context.pushScreen(nextScreen: TeacherScreen());
                      },
                      child: Container(
                        height: 90.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: colorSecendryLight,
                            borderRadius: BorderRadius.circular(5.r)),
                        child: Center(
                          child: ImageView(
                            size: 50,
                            margin: EdgeInsets.all(15.w),
                            url: AppAssets.student,
                            tintColor: colorPrimary,
                            imageType: ImageType.asset,
                          ),
                        ),
                      ),
                    ),
                    spaceVertical(space: 5.h),
                    BlocConsumer<TeacherBloc, TeacherState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return TextView(
                          text: state is TeacherGetSuccess
                              ? "Teacher (${state.responseModel.data.length})"
                              : "Teacher (--)",
                          color: colorPrimary,
                          textSize: 15.sp,
                          textAlign: TextAlign.center,
                          style: AppTextStyleEnum.medium,
                          fontFamily: Family.medium,
                          lineHeight: 1.3,
                        );
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    TapWidget(
                      onTap: () {
                        context.pushScreen(nextScreen: StudentScreen());
                      },
                      child: Container(
                        height: 90.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: colorSecendryLight,
                            borderRadius: BorderRadius.circular(5.r)),
                        child: Center(
                          child: ImageView(
                            size: 50,
                            margin: EdgeInsets.all(15.w),
                            url: AppAssets.student,
                            tintColor: colorPrimary,
                            imageType: ImageType.asset,
                          ),
                        ),
                      ),
                    ),
                    spaceVertical(space: 5.h),
                    BlocConsumer<StudentBloc, StudentState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return TextView(
                          text: state is StudentGetSuccess
                              ? "Student (${state.responseModel.data.length})"
                              : "Student (--)",
                          color: colorPrimary,
                          textSize: 15.sp,
                          textAlign: TextAlign.center,
                          style: AppTextStyleEnum.medium,
                          fontFamily: Family.medium,
                          lineHeight: 1.3,
                        );
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    TapWidget(
                      onTap: () {
                        context.pushScreen(nextScreen: GroupsScreen());
                      },
                      child: Container(
                        height: 90.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: colorSecendryLight,
                            borderRadius: BorderRadius.circular(5.r)),
                        child: Center(
                          child: ImageView(
                            size: 50,
                            margin: EdgeInsets.all(15.w),
                            url: AppAssets.student,
                            tintColor: colorPrimary,
                            imageType: ImageType.asset,
                          ),
                        ),
                      ),
                    ),
                    spaceVertical(space: 5.h),
                    BlocConsumer<GroupsBloc, GroupsState>(
                      listener: (context, groupsState) {},
                      builder: (context, groupsState) {
                        return TextView(
                          text: groupsState is GroupsSuccess
                              ? "Groups (${groupsState.responseModel.data
                              .length})"
                              : "Groups (--)",
                          color: colorPrimary,
                          textSize: 15.sp,
                          textAlign: TextAlign.center,
                          style: AppTextStyleEnum.medium,
                          fontFamily: Family.medium,
                          lineHeight: 1.3,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            spaceVertical(space: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    TapWidget(
                      onTap: () {
                        context.pushScreen(nextScreen: ClassesScreen());
                      },
                      child: Container(
                        height: 90.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: colorSecendryLight,
                            borderRadius: BorderRadius.circular(5.r)),
                        child: Center(
                          child: ImageView(
                            size: 50,
                            margin: EdgeInsets.all(15.w),
                            url: AppAssets.student,
                            tintColor: colorPrimary,
                            imageType: ImageType.asset,
                          ),
                        ),
                      ),
                    ),
                    spaceVertical(space: 5.h),
                    BlocConsumer<ClassesBloc, ClassesState>(
                      listener: (context, groupsState) {},
                      builder: (context, groupsState) {
                        return TextView(
                          text: groupsState is ClassesGetSuccess
                              ? "Classes (${groupsState.responseModel.data
                              .length})"
                              : "Classes (--)",
                          color: colorPrimary,
                          textSize: 15.sp,
                          textAlign: TextAlign.center,
                          style: AppTextStyleEnum.medium,
                          fontFamily: Family.medium,
                          lineHeight: 1.3,
                        );
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    TapWidget(
                      onTap: () {context.pushScreen(nextScreen: SubjectScreen());},
                      child: Container(
                        height: 90.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: colorSecendryLight,
                            borderRadius: BorderRadius.circular(5.r)),
                        child: Center(
                          child: ImageView(
                            size: 50,
                            margin: EdgeInsets.all(15.w),
                            url: AppAssets.student,
                            tintColor: colorPrimary,
                            imageType: ImageType.asset,
                          ),
                        ),
                      ),
                    ),
                    spaceVertical(space: 5.h),
                    BlocConsumer<SubjectBloc, SubjectState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        return TextView(
                          text:  state is SubjectGetSuccess
                              ? "Subject (${state.responseModel.data.length})"
                              : "Subject (--)",
                          color: colorPrimary,
                          textSize: 15.sp,
                          textAlign: TextAlign.center,
                          style: AppTextStyleEnum.medium,
                          fontFamily: Family.medium,
                          lineHeight: 1.3,
                        );
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    TapWidget(
                      onTap: () {},
                      child: Container(
                        height: 90.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: colorSecendryLight,
                            borderRadius: BorderRadius.circular(5.r)),
                        child: Center(
                          child: ImageView(
                            size: 50,
                            margin: EdgeInsets.all(15.w),
                            url: AppAssets.student,
                            tintColor: colorPrimary,
                            imageType: ImageType.asset,
                          ),
                        ),
                      ),
                    ),
                    spaceVertical(space: 5.h),
                    TextView(
                      text: "Classes (10)",
                      color: colorPrimary,
                      textSize: 15.sp,
                      textAlign: TextAlign.center,
                      style: AppTextStyleEnum.medium,
                      fontFamily: Family.medium,
                      lineHeight: 1.3,
                    ),
                  ],
                ),
              ],
            ),
          ]),
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 40.0, horizontal: 10.0),
            child: Row(
              children: [
                TapWidget(
                  onTap: () {
                    _key.currentState!.openDrawer();
                  },
                  child: Icon(
                    Icons.menu,
                    color: colorWhite,
                    size: 25.h,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
