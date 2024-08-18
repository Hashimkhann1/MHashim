

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:myportfolio/res/my_colors/my_colors.dart';
import 'package:myportfolio/res/responsive/responsive.dart';
import 'package:myportfolio/res/widgets/my_text.dart';
import 'package:myportfolio/res/widgets/my_title_text.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
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

          SizedBox(height: 20),

          // Description
          MyText(title:
            "Hello, I'm M Hashim, a skilled Flutter developer with more than two year of hands-on"
                " experience. I specialize in developing user-friendly mobile applications, "
                "consistently delivering efficient and scalable Flutter code. I'm proficient"
                " in state management, user authentication, API integration, Firebase Firestore,"
                " push notifications, and utilizing third-party libraries and packages to enhance"
                " app functionality. My passion for creating seamless and innovative solutions "
                "drives me to stay at the forefront of technology, ensuring I provide the best user "
                "experiences in every project I undertake.",
            textAlign: Responsive.isMobile(context) ? TextAlign.start : TextAlign.center,
            color: Colors.grey[500],
            fontSize: Responsive.isMobile(context) ? 19 : 24,
          ).animate()
              .fade(duration: 800.ms, delay: 200.ms)
              .slideY(begin: 0.2, end: 0, duration: 1200.ms, curve: Curves.easeOut),

          SizedBox(height: 40),

          // Skills or Highlights
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: !Responsive.isMobile(context) ? [
              _buildSkillCard("Flutter"),
              _buildSkillCard("Dart"),
              _buildSkillCard("Firebase"),
              _buildSkillCard("Hive"),
              _buildSkillCard("Sqflite"),
              _buildSkillCard("Authentication"),
              _buildSkillCard("Notification"),
              _buildSkillCard("Provider"),
              _buildSkillCard("GetX"),
              _buildSkillCard("Bloc"),
              _buildSkillCard("Http"),
              _buildSkillCard("Rest APi"),
              _buildSkillCard("API Integration"),
              _buildSkillCard("Google Map APi"),
              _buildSkillCard("MVVM"),
              _buildSkillCard("MVC"),
            ] : [
              _buildSkillCard("Flutter"),
              _buildSkillCard("Dart"),
              _buildSkillCard("Firebase"),
              _buildSkillCard("Hive"),
              _buildSkillCard("Sqflite"),
              _buildSkillCard("Provider"),
              _buildSkillCard("GetX"),
              _buildSkillCard("Bloc"),
              _buildSkillCard("Http"),
              _buildSkillCard("Rest APi"),
              _buildSkillCard("MVVM"),
              _buildSkillCard("MVC"),
              _buildSkillCard("Authentication"),
              _buildSkillCard("Notification"),
              _buildSkillCard("API Integration"),
              _buildSkillCard("Google Map APi"),
            ],
          ).animate()
              .fade(duration: 800.ms, delay: 400.ms)
              .slideY(begin: 0.2, end: 0, duration: 800.ms, curve: Curves.easeOut),
        ],
      ),
    );
  }

  // Skill card widget
  Widget _buildSkillCard(String skill) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        // color: Colors.blueAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: MyColors.flutterColor, width: 2),
      ),
      child: Text(
        skill,
        style: TextStyle(
          fontSize: 18,
          color: MyColors.flutterColor,
          fontWeight: FontWeight.w500,
        ),
      ).animate()
          .scaleXY(duration: 800.ms, delay: 400.ms)
          .slideY(begin: 0.2, end: 0, duration: 800.ms, curve: Curves.easeOut),
    );
  }
}
