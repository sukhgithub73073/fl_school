import 'package:dropdown_search/dropdown_search.dart';
import 'package:fl_school/src/core/app_assets.dart';
import 'package:fl_school/src/core/app_colors.dart';
import 'package:fl_school/src/core/app_dialog.dart';
import 'package:fl_school/src/core/app_image_view.dart';
import 'package:fl_school/src/core/app_input_field.dart';
import 'package:fl_school/src/core/app_loader.dart';
import 'package:fl_school/src/core/app_tap_widget.dart';
import 'package:fl_school/src/core/app_text_style.dart';
import 'package:fl_school/src/core/common_space.dart';
import 'package:fl_school/src/core/dialog_widgets/failure_message_dialog.dart';
import 'package:fl_school/src/core/drop_down/drop_list_model.dart';
import 'package:fl_school/src/core/text_view.dart';
import 'package:fl_school/src/data/blocs/classes_bloc/classes_bloc.dart';
import 'package:fl_school/src/data/blocs/groups_bloc/groups_bloc.dart';
import 'package:fl_school/src/data/blocs/student_bloc/student_bloc.dart';
import 'package:fl_school/src/extension/app_extension.dart';
import 'package:fl_school/src/ui/dashboard/drawer/drawer_screen.dart';
import 'package:fl_school/src/ui/dashboard/drawer/student_filter_drawer.dart';
import 'package:fl_school/src/ui/register/register_screen.dart';
import 'package:fl_school/src/ui/register/student_registration/register_one.dart';
import 'package:fl_school/src/utility/app_util.dart';
import 'package:flutter/cupertino.dart';
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

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      endDrawer: Container(width: 250.w, child: StudentFilterDrawer()),
      endDrawerEnableOpenDragGesture: false,
      appBar: AppBar(
        backgroundColor: colorPrimary,
        leading: TapWidget(
          onTap: () {},
          child: Icon(
            Icons.arrow_back,
            color: colorWhite,
            size: 20.h,
          ),
        ),
        title: TextView(
          text: "studentsList",
          color: colorWhite,
          textSize: 16.sp,
          textAlign: TextAlign.center,
          style: AppTextStyleEnum.medium,
          fontFamily: Family.medium,
          lineHeight: 1.3,
        ),
        actions: [],
      ),
      body: Column(children: [
        spaceVertical(space: 5.h),

        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: Row(
            children: [
              Expanded(
                child: CustomTextField(
                    controller: TextEditingController(),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    paddingHorizontal: 20.0,
                    hasViewHight: false,
                    labelText: "",
                    hintText: "searchHere",
                    numberOfLines: 1,
                    preffixicon: Icon(Icons.search),
                    suffixicon: TapWidget(
                        onTap: () {
                          _key.currentState!.openEndDrawer();
                        },
                        child: Icon(Icons.filter_list)),
                    hintFontWeight: FontWeight.w400,
                    hintTextColor: colorGray.withOpacity(0.6)),
              ),
            ],
          ),
        ),

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Container(
        //       width: (size.width / 2) - 5,
        //       child: BlocConsumer<GroupsBloc, GroupsState>(
        //         listener: (context, state) {},
        //         builder: (context, state) {
        //           if (state is GroupsSuccess) {
        //             printLog(
        //                 "builder >>>>>>>>>>>>>>>>>${state is GroupsSuccess}");
        //             List<OptionItem> list = [];
        //             state.responseModel.data.forEach((element) {
        //               list.add(OptionItem(
        //                   id: "${element["group_id"]}",
        //                   title: "${element["group_name"]}"));
        //             });
        //
        //             return Padding(
        //               padding: EdgeInsets.symmetric(horizontal: 10.0),
        //               child: DropdownSearch<OptionItem>(
        //                 popupProps: PopupProps.menu(
        //                     showSearchBox: true,
        //                     searchDelay: Duration.zero,
        //                     searchFieldProps: TextFieldProps(
        //                         decoration: InputDecoration(
        //                       isDense: true,
        //                       border: OutlineInputBorder(
        //                           gapPadding: 1,
        //                           borderSide: BorderSide(color: Colors.red),
        //                           borderRadius: BorderRadius.circular(5.r)),
        //                       hintText: "Enter to search",
        //                     ))),
        //                 items: list,
        //                 itemAsString: (OptionItem u) => u.title,
        //                 onChanged: (item) {
        //                   printLog(
        //                       "onSelectonSelect>>>>>>>>>>>>>>>>>>>>>>${item?.id}");
        //                   context
        //                       .read<ClassesBloc>()
        //                       .add(GetClassesByGroupEvent(map: {
        //                         "school_code": "GSSS19543",
        //                         "group_id": item?.id ?? "",
        //                       }));
        //                 },
        //               ),
        //             );
        //           } else {
        //             return SizedBox.shrink();
        //           }
        //         },
        //       ),
        //     ),
        //     Container(
        //       width: (size.width / 2) - 5,
        //       child: BlocConsumer<ClassesBloc, ClassesState>(
        //         listener: (context, state) {},
        //         builder: (context, state) {
        //           if (state is ClassesGetSuccess) {
        //             printLog(
        //                 "builder >>>>>>>>>>>>>>>>>${state is ClassesGetSuccess}");
        //             List<OptionItem> list = [];
        //             state.responseModel.data.forEach((element) {
        //               list.add(OptionItem(
        //                   id: "${element["class_id"]}",
        //                   title: "${element["class_name"]}"));
        //             });
        //
        //             return Padding(
        //               padding: EdgeInsets.symmetric(horizontal: 10.0),
        //               child: DropdownSearch<OptionItem>(
        //                 popupProps: PopupProps.menu(
        //                     showSearchBox: true,
        //                     searchDelay: Duration.zero,
        //                     searchFieldProps: TextFieldProps(
        //                         decoration: InputDecoration(
        //                       isDense: true,
        //                       border: OutlineInputBorder(
        //                           gapPadding: 1,
        //                           borderSide: BorderSide(color: Colors.red),
        //                           borderRadius: BorderRadius.circular(5.r)),
        //                       hintText: "Enter to search",
        //                     ))),
        //                 items: list,
        //                 itemAsString: (OptionItem u) => u.title,
        //                 onChanged: (item) {
        //                   printLog(
        //                       "onSelectonSelect>>>>>>>>>>>>>>>>>>>>>>${item?.id}");
        //                   context.read<StudentBloc>().add(GetStudentEvent(map: {
        //                         "school_code": "GSSS19543",
        //                       }));
        //                 },
        //               ),
        //             );
        //           } else {
        //             return SizedBox.shrink();
        //           }
        //         },
        //       ),
        //     )
        //   ],
        // ),
        BlocConsumer<StudentBloc, StudentState>(
          listener: (context, state) {
            if (state is StudentGetLoading) {
              printLog("Create listener>>>>>>>>>>>StudentLoaderShow");
              // appLoader(context);
            } else if (state is StudentGetLoadingDismiss) {
              // context.dissmissLoading();
            }
          },
          builder: (context, state) {
            if (state is StudentGetSuccess) {
              return state.responseModel.data.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: TextView(
                        text: "noRecordsFound",
                        color: colorBlack,
                        textSize: 12.sp,
                        textAlign: TextAlign.center,
                        style: AppTextStyleEnum.medium,
                        fontFamily: Family.medium,
                        lineHeight: 1.3,
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
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
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                          style: BorderStyle.solid,
                                          color: colorPrimary,
                                          // Specify the border color
                                          width: 2, // Specify the border width
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
                                            style: AppTextStyleEnum.bold,
                                            fontFamily: Family.medium,
                                            lineHeight: 1.3,
                                          ),
                                          spaceVertical(space: 5.h),
                                          TextView(
                                            text:
                                                "${state.responseModel.data[i]["email"]}",
                                            color: colorBlack.withOpacity(0.6),
                                            textSize: 13.sp,
                                            textAlign: TextAlign.start,
                                            style: AppTextStyleEnum.medium,
                                            fontFamily: Family.medium,
                                            lineHeight: 1.3,
                                          ),
                                          TextView(
                                            text:
                                                "${state.responseModel.data[i]["address"]} dropdown button lets the user",
                                            color: colorBlack.withOpacity(0.4),
                                            textSize: 10.sp,
                                            maxlines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.start,
                                            style: AppTextStyleEnum.medium,
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
                          }),
                    );
            }
            return SizedBox.shrink();
          },
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushScreen(nextScreen: RegisterOne());
          // context.pushScreen(nextScreen: RegisterScreen());
        },
        child: Icon(Icons.add, color: colorWhite),
        backgroundColor: colorPrimary,
      ),
    );
  }
}
