

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:myportfolio/res/my_colors/my_colors.dart';
import 'package:myportfolio/res/widgets/my_text.dart';
import 'package:shimmer/shimmer.dart';

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
                color: Colors.greenAccent.withOpacity(0.8)),
            child: MyText(
              title: title!,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              fontFamily: 'Oswald',
              letterSpacing: 3,
              color: Colors.transparent,
            ),
          ).animate().fade(duration: 200.ms).scaleX(duration: const Duration(milliseconds: 2300)),
        ),
        Container(
          child: Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: MyColors.flutterColor,
            period: Duration(milliseconds: 2000),
            loop: 2,
            child: MyText(
              title: title!,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              fontFamily: 'Oswald',
              letterSpacing: 3,
              color: const Color(0xFFFFFFFF),
            ),
          )
        ),
      ],
    );
  }
}
