import 'package:color_generator/classes/all_colors.dart';
import 'package:color_generator/components/custom_head_text.dart';
import 'package:color_generator/components/custom_two_buttons.dart';
import 'package:color_generator/components/one_button.dart';

import 'package:color_generator/screens/calculate_screen.dart';
import 'package:color_generator/screens/select_hight.dart';
import 'package:color_generator/utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class SelectWeightScreen extends StatefulWidget {
  bool isMale;
  int hight;

  SelectWeightScreen({
    required this.isMale,
    required this.hight,
  });

  @override
  State<SelectWeightScreen> createState() => _SelectWeightScreenState();
}

class _SelectWeightScreenState extends State<SelectWeightScreen> {
  double weight = 55 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              CustomHeadText(data: 'SELECT YOUR', specialText: 'WEIGHT'),
              SizedBox(
                height: 10.h,
              ),
              CustomTwoButtons(firstText: 'KGS', secondText: 'LBS'),
              SizedBox(
                height: 30.h,
              ),
              SleekCircularSlider(
                min: 0,
                max: 200,
                initialValue: 55,
                onChange: (double value) {
                  weight = value;
                },
                appearance: CircularSliderAppearance(
                    customColors: CustomSliderColors(
                        trackColor: AllColors.trackColorSlider,
                        progressBarColor: AllColors.progressColorSlider),
                    size: 300,
                    infoProperties: InfoProperties(
                        modifier: (double value) {
                          final weight = value.toInt();
                          return '${this.weight.toInt()} KG';
                        },
                        mainLabelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50.sp,
                            color: AllColors.textColor),
                        topLabelText: 'Weight',
                        topLabelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50.sp,
                            color: AllColors.textColor))),
              ),
              SizedBox(
                height: 20.h,
              ),
              OneButton(
                  function: () {
                    AppNavigator.appNavigator(
                        context, SelectHightScreen(isMale: widget.isMale));
                  },
                  fontSize: 18.sp,
                  data: '<---Back',
                  width: double.infinity,
                  height: 30.h,
                  color: AllColors.unSelectedButtonColor),
              SizedBox(
                height: 15.h,
              ),
              OneButton(
                  function: () {
                    AppNavigator.appNavigator(
                        context,
                        CalculateScreen(isMale: widget.isMale,
                          weight: this.weight.toInt(),
                          hight: widget.hight,
                        ));
                  },
                  fontSize: 18.sp,
                  data: 'CALCULATE BMI',
                  width: double.infinity,
                  height: 30.h,
                  color: AllColors.selectedButtonColor),
            ],
          ),
        ),
      ),
    );
  }
}
