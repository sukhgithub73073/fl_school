import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:fl_school/src/core/app_assets.dart';
import 'package:fl_school/src/core/app_dialog.dart';
import 'package:fl_school/src/core/dialog_widgets/failure_message_dialog.dart';
import 'package:fl_school/src/core/dialog_widgets/success_message_dialog.dart';
import 'package:fl_school/src/core/drop_down/drop_list_model.dart';
import 'package:fl_school/src/data/blocs/classes_bloc/classes_bloc.dart';
import 'package:fl_school/src/data/blocs/groups_bloc/groups_bloc.dart';
import 'package:fl_school/src/data/blocs/image_pick_bloc/image_pick_bloc.dart';
import 'package:fl_school/src/data/blocs/pincode_bloc/pincode_bloc.dart';
import 'package:fl_school/src/data/blocs/register_bloc/register_bloc.dart';
import 'package:fl_school/src/data/models/pincode_model.dart';
import 'package:fl_school/src/ui/register/parent_detail_screen.dart';
import 'package:fl_school/src/ui/register/student_registration/register_gaurdian_screen.dart';
import 'package:fl_school/src/utility/app_util.dart';
import 'package:fl_school/src/utility/decoration_util.dart';
import 'package:fl_school/src/utility/validation_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_school/src/core/app_button.dart';
import 'package:fl_school/src/core/app_colors.dart';
import 'package:fl_school/src/core/app_image_view.dart';
import 'package:fl_school/src/core/app_input_field.dart';
import 'package:fl_school/src/core/app_tap_widget.dart';
import 'package:fl_school/src/core/app_text_style.dart';
import 'package:fl_school/src/core/common_space.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:fl_school/src/core/text_view.dart';
import 'package:fl_school/src/extension/app_extension.dart';
import 'package:radio_group_v2/radio_group_v2.dart';

class AdditionalInfoScreen extends StatefulWidget {
  AdditionalInfoScreen({super.key});

  @override
  State<AdditionalInfoScreen> createState() => _AdditionalInfoScreenState();
}

class _AdditionalInfoScreenState extends State<AdditionalInfoScreen> {
  var penController = TextEditingController(text: "");
  var obtainMarksController = TextEditingController(text: "");
  var attendedDaysController = TextEditingController(text: "");
  var emailController = TextEditingController(text: "");
  var disabilityController = TextEditingController(text: "");
  var weightController = TextEditingController(text: "");
  var heightController = TextEditingController(text: "");

  var bankNameController = TextEditingController(text: "");
  var ifscController = TextEditingController(text: "");
  var branchAddressController = TextEditingController(text: "");
  var accountController = TextEditingController(text: "");
  var holderNameController = TextEditingController(text: "");

  var bloodGroupList = getBloodGroupList();
  var disabilityTypeList = getDisabilityTypeList();
  RadioGroupController disabilityRadioController = RadioGroupController();
  RadioGroupController resultRadioController = RadioGroupController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        leading: TapWidget(
          onTap: () {},
          child: Icon(
            Icons.arrow_back,
            color: colorWhite,
            size: 15.h,
          ),
        ),
        title: TextView(
          text: "additionalInfo",
          color: colorWhite,
          textSize: 16.sp,
          textAlign: TextAlign.center,
          style: AppTextStyleEnum.medium,
          fontFamily: Family.medium,
          lineHeight: 1.3,
        ),
        actions: [
          TapWidget(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: TextView(
                text: "skip",
                color: colorWhite,
                textSize: 14.sp,
                textAlign: TextAlign.center,
                style: AppTextStyleEnum.medium,
                fontFamily: Family.medium,
                lineHeight: 1.3,
              ),
            ),
          )
        ],
      ),
      body: ListView(shrinkWrap: true, children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              spaceVertical(space: 10.h),
              CustomTextField(
                  controller: penController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  paddingHorizontal: 20.0,
                  hasViewHight: false,
                  labelText: "udisePen",
                  hintText: "udisePen",
                  numberOfLines: 1,
                  hintFontWeight: FontWeight.w400,
                  hintTextColor: colorGray.withOpacity(0.6)),
              spaceVertical(space: 15.h),
              Row(
                children: [
                  TextView(
                    text: "disability",
                    color: colorBlack,
                    textSize: 14.sp,
                    textAlign: TextAlign.center,
                    style: AppTextStyleEnum.regular,
                    fontFamily: Family.regular,
                    lineHeight: 1.3,
                  ),
                  spaceHorizontal(space: 10.w),
                  RadioGroup(
                    controller: disabilityRadioController,
                    values: ["Yes", "No"],
                    indexOfDefault: 0,
                    orientation: RadioGroupOrientation.horizontal,
                    decoration: RadioGroupDecoration(
                      spacing: 10.0,
                      labelStyle: TextStyle(
                        color: colorBlack,
                      ),
                      activeColor: colorPrimary,
                    ),
                  )
                ],
              ),
              spaceVertical(space: 15.h),
              CustomDropdown<DropListModel>(
                hintText: tr("selectDisabilityType"),
                items: disabilityTypeList,
                decoration: customDropdownDecoration,
                excludeSelected: false,
                onChanged: (item) {},
              ),
              spaceVertical(space: 15.h),
              CustomTextField(
                  controller: disabilityController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3),
                  ],
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  paddingHorizontal: 20.0,
                  hasViewHight: false,
                  labelText: "disabilityPercent",
                  hintText: "disabilityPercent",
                  numberOfLines: 1,
                  hintFontWeight: FontWeight.w400,
                  hintTextColor: colorGray.withOpacity(0.6)),
              spaceVertical(space: 15.h),
              Row(
                children: [
                  TextView(
                    text: "result",
                    color: colorBlack,
                    textSize: 14.sp,
                    textAlign: TextAlign.center,
                    style: AppTextStyleEnum.regular,
                    fontFamily: Family.regular,
                    lineHeight: 1.3,
                  ),
                  spaceHorizontal(space: 10.w),
                  RadioGroup(
                    controller: resultRadioController,
                    values: [tr("pass"), tr("fail"), tr("noResult")],
                    indexOfDefault: 0,
                    orientation: RadioGroupOrientation.horizontal,
                    decoration: RadioGroupDecoration(
                      spacing: 10.0,
                      labelStyle: TextStyle(
                        color: colorBlack,
                      ),
                      activeColor: colorPrimary,
                    ),
                  )
                ],
              ),
              spaceVertical(space: 15.h),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                        controller: obtainMarksController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(12),
                        ],
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        paddingHorizontal: 20.0,
                        hasViewHight: false,
                        labelText: "obtainMarks",
                        hintText: "obtainMarks",
                        numberOfLines: 1,
                        hintFontWeight: FontWeight.w400,
                        hintTextColor: colorGray.withOpacity(0.6)),
                  ),
                  spaceHorizontal(space: 10.w),
                  Expanded(
                    child: CustomTextField(
                        controller: attendedDaysController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(12),
                        ],
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        paddingHorizontal: 20.0,
                        hasViewHight: false,
                        labelText: "attendedDays",
                        hintText: "attendedDays",
                        numberOfLines: 1,
                        hintFontWeight: FontWeight.w400,
                        hintTextColor: colorGray.withOpacity(0.6)),
                  ),
                ],
              ),
              spaceVertical(space: 15.h),
              CustomTextField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  paddingHorizontal: 20.0,
                  hasViewHight: false,
                  labelText: "email",
                  hintText: "emailHere",
                  numberOfLines: 1,
                  hintFontWeight: FontWeight.w400,
                  hintTextColor: colorGray.withOpacity(0.6)),
              spaceVertical(space: 15.h),
              CustomDropdown<DropListModel>(
                hintText: tr("selectBloodGroup"),
                items: bloodGroupList,
                decoration: customDropdownDecoration,
                excludeSelected: false,
                onChanged: (item) {},
              ),
              spaceVertical(space: 15.h),
              CustomTextField(
                  controller: weightController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(12),
                  ],
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  paddingHorizontal: 20.0,
                  hasViewHight: false,
                  labelText: "studentWeight",
                  hintText: "studentWeight",
                  numberOfLines: 1,
                  hintFontWeight: FontWeight.w400,
                  hintTextColor: colorGray.withOpacity(0.6)),
              spaceVertical(space: 15.h),
              CustomTextField(
                  controller: heightController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(12),
                  ],
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  paddingHorizontal: 20.0,
                  hasViewHight: false,
                  labelText: "studentHeight",
                  hintText: "studentHeight",
                  numberOfLines: 1,
                  hintFontWeight: FontWeight.w400,
                  hintTextColor: colorGray.withOpacity(0.6)),
              spaceVertical(space: 15.h),
              BlocConsumer<RegisterBloc, RegisterState>(
                listener: (context, state) {
                  if (state is RegisterSuccess) {
                    appDialog(
                        context: context,
                        child: SuccessDailog(
                          title: "successfully",
                          onTap: () {
                            context.back();
                            context.back();
                          },
                          message: "${state.userModel.message}",
                        ));
                  } else if (state is RegisterError) {
                    appDialog(
                        context: context,
                        child: ErrorDailog(
                          title: "error",
                          onTap: () {
                            context.back();
                          },
                          message: "${state.error}",
                        ));
                  }
                },
                builder: (context, state) {
                  return Container(
                    height: 40.h,
                    width: double.infinity,
                    decoration: BoxDecoration(color: colorPrimary),
                    child: AppSimpleButton(
                      onDoneFuction: () async {
                        appDialog(
                            context: context,
                            child: SuccessDailog(
                              title: "successfully",
                              onTap: () {
                                context.back();
                              },
                              message: "Successfully student register",
                            ));
                      },
                      buttonBackgroundColor: colorPrimary,
                      nameText: "submit",
                      textSize: 18.sp,
                    ),
                  );
                },
              ),
              spaceVertical(space: 10.h),
            ],
          ),
        ),
        spaceVertical(space: 10.h),
      ]),
    );
  }
}
//
