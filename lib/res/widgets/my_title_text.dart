

import 'package:flutter/material.dart';
import 'package:myportfolio/res/my_colors/my_colors.dart';
import 'package:myportfolio/res/widgets/my_text.dart';
import 'package:myportfolio/view.dart';
import 'package:shimmer/shimmer.dart';

class MyTitleText extends StatefulWidget {

  final String? title;
  final double? fontSize;
  final bool? isAnimate;
  final double maxHeight;
  final AnimationController controller;

  const MyTitleText({super.key,required this.title , this.fontSize,this.isAnimate, required this.maxHeight,required this.controller});

  @override
  State<MyTitleText> createState() => _MyTitleTextState();
}

class _MyTitleTextState extends State<MyTitleText> with TickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> headingBackAnimation;
  late Animation<double> textRevealAnimation;
  late Animation<double> textOpicatyAnimation;

  @override
  void initState() {

    controller = widget.controller;

    headingBackAnimation = Tween<double>(begin: 0.0 ,end: 1.0).animate(CurvedAnimation(parent: controller, curve: Interval(0.3, 0.5 , curve: Curves.easeOut),));

    textRevealAnimation  = Tween<double>(begin: 100.0, end: 0.0).animate(CurvedAnimation(parent: controller, curve: Interval(0.0, 0.3 , curve: Curves.easeOut)));

    textOpicatyAnimation  = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: controller, curve: Interval(0.0, 0.3 , curve: Curves.easeOut)));


    Future.delayed(Duration(milliseconds: 1000),() {
      controller.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
      animation: controller,
      builder: (context , child) {
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: height * 0.009,
              child: SizeTransition(
                sizeFactor: headingBackAnimation,
                axis: Axis.horizontal,
                child: Container(
                  // width: width * 0.13,
                  height: 22,
                  decoration: BoxDecoration(
                      color: Colors.greenAccent.withOpacity(0.8)),
                  child: MyText(
                    title: widget.title!,
                    fontSize: widget.fontSize,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Oswald',
                    letterSpacing: 3,
                    color: Colors.transparent,
                  ),
                ),
              )
            ),
            LimitedBox(
              maxHeight: widget.maxHeight,
              child: Container(
                height: Responsive.isMobile(context) ? height * 0.09 : height * 0.07,
                // color: Colors.white,
                padding: EdgeInsets.only(top: textRevealAnimation.value),
                child: Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: MyColors.flutterColor,
                  period: Duration(milliseconds: 2000),
                  loop: 2,
                  child: FadeTransition(
                    opacity: textOpicatyAnimation,
                    child: MyText(
                      title: widget.title!,
                      fontSize: widget.fontSize,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Oswald',
                      letterSpacing: 3,
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                )
              ),
            ),
          ],
        );
      }
    );
  }
}
