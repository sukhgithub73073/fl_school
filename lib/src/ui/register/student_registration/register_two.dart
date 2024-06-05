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
import 'package:fl_school/src/ui/register/student_registration/register_three.dart';
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

class RegisterTwo extends StatefulWidget {
  RegisterTwo({super.key});

  @override
  State<RegisterTwo> createState() => _RegisterTwoState();
}

class _RegisterTwoState extends State<RegisterTwo> {
  var addressController = TextEditingController(text: "");
  var pincodeController = TextEditingController(text: "");
  var selectedPostOffice;
  var nameControllerFather = TextEditingController(text: "");
  var aadharControllerFather = TextEditingController(text: "");
  var nameControllerMother = TextEditingController(text: "");
  var aadharControllerMother = TextEditingController(text: "");
  var occupationList = getOccupationList();
  var qualificationList = getQualificationList();



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
            size: 20.h,
          ),
        ),
        title: TextView(
          text: "parentDetail",
          color: colorWhite,
          textSize: 16.sp,
          textAlign: TextAlign.center,
          style: AppTextStyleEnum.medium,
          fontFamily: Family.medium,
          lineHeight: 1.3,
        ),
        actions: [],
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
                  controller: nameControllerFather,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  paddingHorizontal: 20.0,
                  hasViewHight: false,
                  labelText: "fatherName",
                  hintText: "fatherNameHere",
                  numberOfLines: 1,
                  hintFontWeight: FontWeight.w400,
                  hintTextColor: colorGray.withOpacity(0.6)),
              spaceVertical(space: 20.h),
              CustomTextField(
                  controller: aadharControllerFather,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  paddingHorizontal: 20.0,
                  hasViewHight: false,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(12),
                  ],
                  labelText: "fatherAadhaarNumber",
                  hintText: "fatherAadhaarNumberHere",
                  numberOfLines: 1,
                  hintFontWeight: FontWeight.w400,
                  hintTextColor: colorGray.withOpacity(0.6)),
              spaceVertical(space: 20.h),
              CustomDropdown<DropListModel>.search(
                hintText: tr("selectOccupation"),
                items: occupationList,
                decoration: customDropdownDecoration,
                excludeSelected: false,
                onChanged: (item) {},
              ),
              spaceVertical(space: 20.h),
              CustomDropdown<DropListModel>.search(
                hintText: tr("selectQualification"),
                items: qualificationList,
                decoration: customDropdownDecoration,
                excludeSelected: false,
                onChanged: (item) {},
              ),
              spaceVertical(space: 20.h),

              CustomTextField(
                  controller: nameControllerMother,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  paddingHorizontal: 20.0,
                  hasViewHight: false,
                  labelText: "motherName",
                  hintText: "motherNameHere",
                  numberOfLines: 1,
                  hintFontWeight: FontWeight.w400,
                  hintTextColor: colorGray.withOpacity(0.6)),
              spaceVertical(space: 20.h),
              CustomTextField(
                  controller: aadharControllerMother,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  paddingHorizontal: 20.0,
                  hasViewHight: false,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(12),
                  ],
                  labelText: "motherAadhaarNumber",
                  hintText: "motherAadhaarNumberHere",
                  numberOfLines: 1,
                  hintFontWeight: FontWeight.w400,
                  hintTextColor: colorGray.withOpacity(0.6)),
              spaceVertical(space: 20.h),
              CustomDropdown<DropListModel>.search(
                hintText: tr("selectOccupation"),
                items: occupationList,
                decoration: customDropdownDecoration,
                excludeSelected: false,
                onChanged: (item) {},
              ),
              spaceVertical(space: 20.h),
              CustomDropdown<DropListModel>.search(
                hintText: tr("selectQualification"),
                items: qualificationList,
                decoration: customDropdownDecoration,
                excludeSelected: false,
                onChanged: (item) {},
              ),
              spaceVertical(space: 20.h),

              BlocConsumer<PincodeBloc, PincodeState>(
                listener: (context, state) {
                  if (state is PincodeError) {
                    appDialog(
                        context: context,
                        child: ErrorDailog(
                          title: "invalidPincode",
                          onTap: () {
                            context.back();
                          },
                          message: "${state.error}",
                        ));
                  }
                },
                builder: (context, state) {
                  return Stack(
                    children: [
                      CustomTextField(
                          controller: pincodeController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          paddingHorizontal: 20.0,
                          hasViewHight: false,
                          labelText: "pincode",
                          hintText: "pincodeHere",
                          numberOfLines: 1,
                          hintFontWeight: FontWeight.w400,
                          onChanged: (e) {
                            if (pincodeController.text.length == 6) {
                              context.read<PincodeBloc>().add(
                                  GetInfoPincodeEvent(
                                      pincode: pincodeController.text));
                            }
                          },
                          hintTextColor: colorGray.withOpacity(0.6)),
                      state is PincodeLoading
                          ? Positioned(
                              bottom: 10,
                              top: 10,
                              right: 10,
                              child: SizedBox(
                                width: 25.0.w,
                                height: 30.0.h,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3.0,
                                  color: colorPrimary,
                                ),
                              ),
                            )
                          : SizedBox.shrink(),
                    ],
                  );
                },
              ),
              BlocBuilder<PincodeBloc, PincodeState>(
                builder: (context, state) {
                  if (state is PincodeSuccess) {
                    return Column(
                      children: [
                        spaceVertical(space: 20.h),
                        FormField<String>(
                          builder: (FormFieldState<String> s) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(12, 10, 20, 20),
                                  errorStyle: TextStyle(
                                      color: Colors.redAccent, fontSize: 16.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<PostOffice>(
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                  hint: Text(
                                    "selectCity",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                  items: state.responseModel.data[0].postOffice
                                      .map<DropdownMenuItem<PostOffice>>(
                                          (PostOffice value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Row(
                                        children: [
                                          TextView(
                                            text: "${value.name}",
                                            color: colorGray,
                                            textSize: 12.sp,
                                            textAlign: TextAlign.center,
                                            style: AppTextStyleEnum.medium,
                                            fontFamily: Family.medium,
                                            lineHeight: 1.3,
                                          )
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                  isExpanded: true,
                                  isDense: true,
                                  onChanged: (selectedItem) {
                                    setState(() {
                                      selectedPostOffice = selectedItem;
                                    });
                                  },
                                  value: selectedPostOffice,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
              spaceVertical(space: 20.h),
              CustomTextField(
                  controller: addressController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  paddingHorizontal: 20.0,
                  hasViewHight: false,
                  labelText: "address",
                  hintText: "addressHere",
                  numberOfLines: 1,
                  hintFontWeight: FontWeight.w400,
                  hintTextColor: colorGray.withOpacity(0.6)),
              spaceVertical(space: 30.h),
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
                        context.pushScreen(nextScreen: RegisterThree()) ;
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
