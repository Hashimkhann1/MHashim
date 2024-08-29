import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myportfolio/res/responsive/responsive.dart';
import 'package:myportfolio/res/widgets/my_title_text.dart';
import 'package:myportfolio/view_model/scroll_offset/scroll_offset.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> textOpicatyAnimation;
  bool isAnimate = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500),
      reverseDuration: const Duration(milliseconds: 375),
    );

    textOpicatyAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.1, 0.9, curve: Curves.easeOut)));


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return BlocBuilder<DisplayOffset, ScrollOffset>(

      buildWhen: (previous, current) {
        if (Responsive.isMobile(context)) {
          if ((current.scrollOffsetValue >= 750 && current.scrollOffsetValue <= 820)) {
            return true;
          } else if (current.scrollOffsetValue < 750) {
            isAnimate = false;
            // controller.reverse();
            return true;
          } else {
            return false;
          }

        } else {
          /// for tablet
          if(Responsive.isTablet(context)){
            isAnimate = true;
            return true;
          }else{
            if ((current.scrollOffsetValue > 990 && current.scrollOffsetValue <= 1200) ||
                controller.isAnimating) {
              return true;
            } else if (current.scrollOffsetValue < 990) {
              isAnimate = false;
              controller.reverse();
              return true;
            } else {
              return false;
            }
          }

        }
      },

      builder: (context, state) {
        if(Responsive.isMobile(context)) {

          /// for mobile
          if (state.scrollOffsetValue > 780) {
            controller.forward();
            isAnimate = true;
          }
        }else if(Responsive.isTablet(context)) {
          if (state.scrollOffsetValue > 1240) {
            controller.forward();
            isAnimate = true;
          }
        } else{
          if (state.scrollOffsetValue > 1000) {
            controller.forward();
            isAnimate = true;
          } else {
            controller.reverse();
            isAnimate = false;
          }
        }
        return !isAnimate ? const SizedBox() :  Column(
          children: [
            Container(
              // color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
              width: Responsive.isMobile(context) ? width * 0.98 : Responsive.isTablet(context) ? width * 0.92 : width * 0.73,
              child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Section title
                        Align(
                            alignment: Alignment.topLeft,
                            child: MyTitleText(
                              title: "About Me",
                              fontSize: Responsive.isMobile(context) ? 36 : 44,
                              maxHeight: 90.0,
                              controller: controller,
                            )),

                        const SizedBox(height: 20),

                        // Description
                        FadeTransition(
                          opacity: textOpicatyAnimation,
                          child: RichText(
                              text: TextSpan(
                                  text:
                                      "Hello, I'm M Hashim, a dedicated Flutter developer with over two years of hands-on experience,"
                                      " specializing in crafting user-centric mobile and web applications. My expertise lies"
                                      " in delivering efficient, scalable, and maintainable Flutter code"
                                      " that meets both user needs and business goals."
                                      "I am well-versed in ",
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: Responsive.isMobile(context)
                                          ? 18
                                          : 22,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 1.3,
                                      wordSpacing: 1,
                                      height: 1.26),
                                  children: <TextSpan>[
                                TextSpan(
                                  text:
                                      "state management, user authentication, API integration ,and Firebase Firestore ",
                                  style: TextStyle(
                                    fontSize:
                                        Responsive.isMobile(context) ? 18 : 22,
                                    color: Colors.greenAccent,
                                  ),
                                ),
                                TextSpan(
                                    text: "along with ",
                                    style: TextStyle(
                                      fontSize: Responsive.isMobile(context)
                                          ? 18
                                          : 22,
                                      color: Colors.grey[500],
                                    )),
                                TextSpan(
                                    text:
                                        "push notifications and third-party libraries ",
                                    style: TextStyle(
                                      fontSize: Responsive.isMobile(context)
                                          ? 18
                                          : 22,
                                      color: Colors.greenAccent,
                                    )),
                                TextSpan(
                                    text:
                                        "to elevate app functionality. My development approach is rooted in architectural patterns like",
                                    style: TextStyle(
                                      fontSize: Responsive.isMobile(context)
                                          ? 18
                                          : 22,
                                      color: Colors.grey[500],
                                    )),
                                TextSpan(
                                    text:
                                        "MVVM (Model-View-ViewModel) and MVC (Model-View-Controller)",
                                    style: TextStyle(
                                      fontSize: Responsive.isMobile(context)
                                          ? 18
                                          : 22,
                                      color: Colors.greenAccent,
                                    )),
                                TextSpan(
                                    text:
                                        "ensuring a clean and organized codebase that enhances both development efficiency"
                                        " and code maintainability.Passionate about staying at the cutting edge of technology,"
                                        " I continuously explore innovative solutions to create seamless user experiences. "
                                        "Every project I undertake reflects my commitment to quality, creativity, and user satisfaction,"
                                        " driving me to deliver top-tier applications that stand out in the competitive digital landscape.",
                                    style: TextStyle(
                                      fontSize: Responsive.isMobile(context)
                                          ? 19
                                          : 24,
                                      color: Colors.grey[500],
                                    )),
                              ])),
                        ),

                        const SizedBox(height: 40),
                      ],
                    );
                  }),
            ),
          ],
        );
      },
    );
  }
}
