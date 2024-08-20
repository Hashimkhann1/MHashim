import 'package:flutter/material.dart';
import 'package:myportfolio/res/my_colors/my_colors.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final BorderSide outllineBorderSide;
  final BorderSide focusedBorderSide;
  final BorderSide enabledBorderSide;
  final int? maxLines;
  final Color? hintTextColor;
  final Color? textColor;
  final Color? fillColor;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const MyTextFormField(
      {super.key,
      required this.hintText,
      this.obscureText = false,
        this.textColor,
        this.keyboardType,
      required this.controller,
        this.hintTextColor,
        this.fillColor,
      this.outllineBorderSide =
          const BorderSide(color: MyColors.flutterColor, width: 2.0),
      this.focusedBorderSide =
          const BorderSide(color: MyColors.blacColor, width: 2.0),
        this.enabledBorderSide =
          const BorderSide(color: MyColors.flutterColor, width: 2.0),
        this.validator,
        this.maxLines = 1,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.greenAccent.withOpacity(0.8),width: 2))
      ),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        style: TextStyle(
          color: textColor
        ),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: hintTextColor
            ),
            filled: true,
            fillColor: fillColor,
          border: OutlineInputBorder(
            borderSide: Border(bottom: )
          )
        ),
        validator: validator,
      ),
    );
  }
}
