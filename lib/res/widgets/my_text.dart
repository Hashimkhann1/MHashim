
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String title;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const MyText({super.key,required this.title , this.color, this.fontSize,this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(title , style: TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight
    ),);
  }
}
