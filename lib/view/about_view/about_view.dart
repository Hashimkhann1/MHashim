

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:myportfolio/res/responsive/responsive.dart';
import 'package:myportfolio/res/widgets/my_title_text.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(

          // color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
          width: Responsive.isMobile(context) ? width * 0.98 : width * 0.68,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Section title
              Align(
                alignment: Alignment.topLeft,
                child: MyTitleText(title: "About Me",fontSize: Responsive.isMobile(context) ? 36 : 44,).animate()
                .fade(duration: 800.ms)
                .slideY(begin: -0.2, end: 0, duration: 1200.ms, curve: Curves.easeOut),
              ),

              const SizedBox(height: 20),

              // Description
              RichText(
                  text: TextSpan(
                      text: "Hello, I'm M Hashim, a dedicated Flutter developer with over two years of hands-on experience,"
                          " specializing in crafting user-centric mobile and web applications. My expertise lies"
                          " in delivering efficient, scalable, and maintainable Flutter code"
                          " that meets both user needs and business goals."
                          "I am well-versed in "
                      ,
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Responsive.isMobile(context) ? 18 : 22,
                          fontWeight: FontWeight.w800,
                        letterSpacing: 1.3,
                        wordSpacing: 1,
                        height: 1.26
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "state management, user authentication, API integration ,and Firebase Firestore ",
                          style: TextStyle(
                            fontSize: Responsive.isMobile(context) ? 18 : 22,
                            color: Colors.greenAccent,
                          ),
                        ),
                        TextSpan(
                            text: "along with ",
                            style: TextStyle(
                                fontSize: Responsive.isMobile(context) ? 18 : 22,
                                color: Colors.grey[500],)),
                        TextSpan(
                            text: "push notifications and third-party libraries ",
                            style: TextStyle(
                                fontSize: Responsive.isMobile(context) ? 18 : 22,
                                color: Colors.greenAccent,)),
                        TextSpan(
                            text: "to elevate app functionality. My development approach is rooted in architectural patterns like",
                            style: TextStyle(
                                fontSize: Responsive.isMobile(context) ? 18 : 22,
                                color: Colors.grey[500],)),
                        TextSpan(
                            text: "MVVM (Model-View-ViewModel) and MVC (Model-View-Controller)",
                            style: TextStyle(
                                fontSize: Responsive.isMobile(context) ? 18 : 22,
                                color: Colors.greenAccent,)),
                        TextSpan(
                            text: "ensuring a clean and organized codebase that enhances both development efficiency"
                            " and code maintainability.Passionate about staying at the cutting edge of technology,"
                            " I continuously explore innovative solutions to create seamless user experiences. "
                            "Every project I undertake reflects my commitment to quality, creativity, and user satisfaction,"
                            " driving me to deliver top-tier applications that stand out in the competitive digital landscape.",
                            style: TextStyle(
                                fontSize: Responsive.isMobile(context) ? 19 : 24,
                                color: Colors.grey[500],)),
                      ])).animate()
                  .fade(duration: 800.ms, delay: 200.ms)
                  .slideY(begin: 0.2, end: 0, duration: 1200.ms, curve: Curves.easeOut),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}
