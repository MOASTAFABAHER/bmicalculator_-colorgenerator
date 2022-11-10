import 'package:color_generator/classes/all_colors.dart';
import 'package:color_generator/components/custom_two_buttons.dart';
import 'package:color_generator/components/custom_head_text.dart';
import 'package:color_generator/components/custom_text.dart';
import 'package:color_generator/components/one_button.dart';

import 'package:color_generator/screens/home_screen.dart';
import 'package:color_generator/screens/select_weight_screen.dart';
import 'package:color_generator/utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SelectHightScreen extends StatefulWidget {
  bool isMale;
  int hight = 100;
  SelectHightScreen({required this.isMale});

  @override
  State<SelectHightScreen> createState() => _SelectHightScreenState();
}

class _SelectHightScreenState extends State<SelectHightScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              CustomHeadText(data: 'SELECT YOUR ', specialText: 'HIGHT'),
              SizedBox(
                height: 20.h,
              ),
              CustomTwoButtons(firstText: 'Meters', secondText: 'Feet '),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 400.h,
                child: Row(
                  children: [
                    widget.isMale
                        ? Image.network(
                            'https://images.pexels.com/photos/8455819/pexels-photo-8455819.jpeg?cs=srgb&dl=pexels-rodnae-productions-8455819.jpg&fm=jpg',
                            height: 500.h,
                            width: 200.w,
                          )
                        : Image.network(
                            'https://images.pexels.com/photos/7699254/pexels-photo-7699254.jpeg?cs=srgb&dl=pexels-yaroslav-shuraev-7699254.jpg&fm=jpg',
                            height: 500.h,
                            width: 200.w,
                          ),
                    SizedBox(
                      width: 45.w,
                    ),
                    SfSlider.vertical(
                        min: 0,
                        max: 220,
                        showLabels: true,
                        enableTooltip: true,
                        showTicks: true,
                        interval: 20,
                        value: widget.hight,
                        activeColor: AllColors.activeColorSlider,
                        inactiveColor: Colors.white,
                        onChanged: (dynamic newValue) {
                          setState(() {
                            widget.hight = newValue.toInt();
                          });
                        })
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  OneButton(
                    function: () {
                      AppNavigator.appNavigator(context, HomeScreen());
                    },
                    fontSize: 16.sp,
                    data: '<--Back',
                    width: 120.w,
                    height: 30.h,
                    color: AllColors.unSelectedButtonColor,
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  OneButton(
                    function: () {
                      AppNavigator.appNavigator(
                          context,
                          SelectWeightScreen(
                            isMale: widget.isMale,
                            hight: widget.hight,
                          ));
                    },
                    fontSize: 16.sp,
                    data: 'Next--->',
                    width: 120.w,
                    height: 30.h,
                    color: AllColors.selectedButtonColor,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
