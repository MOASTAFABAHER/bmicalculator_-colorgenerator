import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomText extends StatelessWidget {
  String data;
  double? fontSize;
  FontWeight? fontWeight;
  var color;
  CustomText({required this.data, this.fontSize, this.fontWeight, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.data,
      style: TextStyle(
        fontSize: this.fontSize,
        fontWeight: this.fontWeight,
        color: this.color,
      ),
    );
  }
}
