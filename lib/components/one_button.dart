import 'package:color_generator/classes/all_colors.dart';
import 'package:color_generator/components/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OneButton extends StatefulWidget {
  var width;
  var height;
  var color;
  var textColor;
  var function;

  double? fontSize;
  String data;

  OneButton(
      {required this.data,
      required this.width,
      required this.height,
      required this.color,
      this.function,
      this.textColor,
      this.fontSize});

  @override
  State<OneButton> createState() => _OneButtonState();
}

class _OneButtonState extends State<OneButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.function,
      child: Container(
        width: this.widget.width,
        height: this.widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.color,
        ),
        child: Center(
            child: CustomText(
          data: this.widget.data,
          fontSize: this.widget.fontSize,
          color:
              widget.textColor != null ? widget.textColor : AllColors.textColor,
        )),
      ),
    );
  }
}
