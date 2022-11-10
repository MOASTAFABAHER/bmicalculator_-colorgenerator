import 'package:color_generator/classes/all_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class ToastConfig {
  static showToast({
    required String msg,
    required ToastStates toastStates,
  }) =>
      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(toastStates),
        textColor: Colors.white,
        fontSize: 16.0,
      );
}

enum ToastStates { Success, Error, Warning }

Color chooseToastColor(ToastStates state) {
  late Color color;
  switch (state) {
    case ToastStates.Success:
      color = AllColors.sucssesToastColor;
      break;
    case ToastStates.Error:
      color = AllColors.errorToastColor;
      break;
    case ToastStates.Warning:
      color = AllColors.warningToastColor;
      break;
  }

  return color;
}
