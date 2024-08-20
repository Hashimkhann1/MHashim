

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:myportfolio/res/widgets/my_text.dart';

class MyTitleText extends StatelessWidget {

  final String? title;
  final double? fontSize;
  final bool? isAnimate;
  const MyTitleText({super.key,required this.title , this.fontSize,this.isAnimate});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          top: height * 0.009,
          child: Container(
            // width: width * 0.13,
            height: 22,
            decoration: BoxDecoration(
                color: Colors.greenAccent.withOpacity(0.4)),
            child: MyText(
              title: title!,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              fontFamily: 'Oswald',
              letterSpacing: 3,
              color: Colors.transparent,
            ),
          ).animate().fade(duration: 200.ms).scaleX(duration: Duration(milliseconds: 2300)),
        ),
        Container(
          child: MyText(
            title: title!,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            fontFamily: 'Oswald',
            letterSpacing: 3,
            color: Color(0xFFFFFFFF),
          )
        ),
      ],
    );
  }
}
