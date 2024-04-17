import 'package:flutter/material.dart';
import 'package:myportfolio/res/widgets/my_text.dart';

class MyTextButton extends StatelessWidget {
  final String title;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  const MyTextButton(
      {super.key,
      required this.title,
      this.color,
      this.fontSize,
      this.fontWeight,
        this.backgroundColor,
      this.height,
      this.width,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: MyText(
        title: title,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
