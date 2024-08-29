import 'package:flutter/material.dart';
import 'package:myportfolio/res/my_colors/my_colors.dart';

class MyTextButton extends StatelessWidget {
  final String title;
  final double? fontSize;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool loading;
  const MyTextButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.fontSize,
    this.height = 34.0,
    this.width = double.infinity,
    this.backgroundColor = MyColors.flutterColor,
    this.borderColor,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: borderColor!,width: 2.0),
            borderRadius: BorderRadius.circular(8)
          ),
          child: loading ? CircularProgressIndicator(color: MyColors.whiteColor,) : Text(
            title,
            style: TextStyle(
              color: MyColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
            ),
          )),
    );
  }
}
