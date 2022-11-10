import 'package:color_generator/classes/all_colors.dart';
import 'package:color_generator/components/custom_container.dart';
import 'package:color_generator/components/custom_text.dart';
import 'package:color_generator/components/one_button.dart';
import 'package:color_generator/config/toast_config.dart';
import 'package:color_generator/screens/history_screen.dart';
import 'package:color_generator/screens/home_screen.dart';
import 'package:color_generator/service/shared_prefrence_helper.dart';
import 'package:color_generator/service/shared_prefrence_keys.dart';
import 'package:color_generator/utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';

class CalculateScreen extends StatelessWidget {
  int? weight;
  int? hight;
  bool isMale;
  String gender = '';
  CalculateScreen(
      {required this.weight, required this.hight, required this.isMale});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 300.w,
              height: 300.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AllColors.backgroundContainerColor,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        color: AllColors.textColor,
                        data:
                            'your weight in pound is = ${roundDouble(weight! * 2.2, 0)}'),
                    CustomText(
                        color: AllColors.textColor,
                        data:
                            'you hight in feet is = ${roundDouble(hight! * 39.37, 0)}'),
                  ]),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          OneButton(
            data: 'Save',
            width: 200.w,
            height: 40.h,
            color: AllColors.unSelectedButtonColor,
            function: () async {
              if (isMale == true) {
                gender = 'male';
              } else {
                gender = 'female';
              }

              SharedPrefrenceHelper.saveData(
                  key: SharedPrefrenceKeys.weight, value: weight.toString());
              SharedPrefrenceHelper.saveData(
                  key: SharedPrefrenceKeys.hight, value: hight);
              SharedPrefrenceHelper.saveData(
                      key: SharedPrefrenceKeys.gender, value: gender)
                  .then((value) => ToastConfig.showToast(
                      msg: 'saved', toastStates: ToastStates.Success));
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          OneButton(
            data: 'Home Screen',
            width: 200.w,
            height: 40.h,
            color: AllColors.selectedButtonColor,
            function: () {
              AppNavigator.appNavigator(context, HomeScreen());
            },
          )
        ],
      ),
    );
  }

  double roundDouble(double value, int places) {
    //(b3d ma s2lt google :))
    num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }
}
