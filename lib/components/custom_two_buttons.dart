import 'dart:ffi';

import 'package:color_generator/classes/all_colors.dart';
import 'package:color_generator/components/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTwoButtons extends StatefulWidget {
  String firstText;
  String secondText;
  CustomTwoButtons({required this.firstText, required this.secondText});

  @override
  State<CustomTwoButtons> createState() => _CustomTwoButtonsState();
}

class _CustomTwoButtonsState extends State<CustomTwoButtons> {
  bool isSelectedOne = true;
  bool isSelectedTwo = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            isSelectedOne = !isSelectedOne;
            isSelectedTwo = false;
            setState(() {});
          },
          child: Container(
            width: 80.w,
            height: 35.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: isSelectedOne
                    ? AllColors.selectedButtonColor
                    : AllColors.unSelectedButtonColor),
            child: Center(
              child: CustomText(
                data: widget.firstText,
                color: AllColors.textColor,
                fontSize: 14.sp,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            isSelectedTwo = !isSelectedTwo;
            isSelectedOne = false;
            setState(() {});
          },
          child: Container(
            width: 80.w,
            height: 35.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: isSelectedTwo
                    ? AllColors.selectedButtonColor
                    : AllColors.unSelectedButtonColor),
            child: Center(
              child: CustomText(
                data: widget.secondText,
                color: AllColors.textColor,
                fontSize: 14.sp,
              ),
            ),
          ),
        )
      ],
    );
  }
}
