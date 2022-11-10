import 'package:color_generator/classes/all_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHeadText extends StatelessWidget {
  String data;
  String specialText;
  CustomHeadText({required this.data, required this.specialText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          this.data,
          style: TextStyle(
              fontSize: 20.sp,
              color: AllColors.textColor,
              fontWeight: FontWeight.w500),
        ),
        Text(
          this.specialText,
          style: TextStyle(
              fontSize: 20.sp,
              color: AllColors.specialText,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
