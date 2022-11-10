import 'package:color_generator/classes/all_colors.dart';
import 'package:color_generator/components/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  var function;
  String image;
  String text;
  CustomContainer({required this.text, required this.image,this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:function,
      child: Container(
        width: 225.w,
        height: 225.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AllColors.backgroundContainerColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 88.r,
                backgroundImage: NetworkImage(this.image),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomText(
                data: this.text,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
