

import 'package:flutter/material.dart';
import 'package:myportfolio/res/widgets/my_text.dart';

class MyTitleText extends StatelessWidget {

  final String? title;
  final double? fontSize;
  const MyTitleText({super.key,required this.title , this.fontSize});

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
          ),
        ),
        Container(
          child: MyText(
            title: title!,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            fontFamily: 'Oswald',
            letterSpacing: 3,
          ),
        ),
      ],
    );
  }
}
