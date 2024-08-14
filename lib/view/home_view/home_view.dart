import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myportfolio/res/my_colors/my_colors.dart';
import 'package:myportfolio/res/responsive/responsive.dart';
import 'package:myportfolio/res/widgets/my_text.dart';
import 'package:myportfolio/res/widgets/my_title_text.dart';
import 'package:myportfolio/view/contact_view/contact_view.dart';
import 'package:myportfolio/view/fotter_view/fotter_view.dart';
import 'package:myportfolio/view/header_view/header_view.dart';
import 'package:myportfolio/view/projects_view/projects_view.dart';
import 'package:myportfolio/view/what_i_do_view/what_i_do_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      appBar: Responsive.isMobile(context)
          ? AppBar(
        iconTheme: IconThemeData(color: MyColors.blacColor), // Icon color
        backgroundColor: MyColors.whiteColor,
        elevation: 0, // Remove shadow under AppBar
      )
          : null, // AppBar only for mobile view

      drawer:  Responsive.isMobile(context)
          ?  Drawer(
        backgroundColor: MyColors.whiteColor,
      ) : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Responsive.isMobile(context) ? const SizedBox() : const HeaderView(),
            SizedBox(height: Responsive.isMobile(context) ? height * 0.08 : 0),

            /// main section
            Column(
              children: [
                /// my image
                CircleAvatar(
                  radius: Responsive.isMobile(context) ? 70 : 90,
                  backgroundColor: MyColors.flutterColor,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
                SizedBox(
                  height: Responsive.isMobile(context) ? height * 0.05 : height * 0.01,
                ),

                /// flutter developer title
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: height * 0.009,
                      child: Container(
                        // width: width * 0.13,
                        height: 22,
                        decoration: BoxDecoration(
                            color: Colors.greenAccent.withOpacity(0.4)),
                        child: const MyText(
                          title: "Flutter Developer",
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Oswald',
                          letterSpacing: 3,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    MyText(
                      title: "Flutter Developer",
                      fontSize: Responsive.isMobile(context) ? 34 : 38,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Oswald',
                      letterSpacing: 3,
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01,),

                Container(
                  width: Responsive.isMobile(context) ? width * 0.92 : width * 0.68,
                    child: MyText(
                        title:
                            "For over a decade, I’ve mastered the craft of turning code into dynamic, functional experiences. As a Flutter developer, I create seamless cross-platform apps, blending creativity with technical skill. From bringing ideas to life on the web to crafting elegant mobile solutions, I have the expertise to transform visions into reality.",
                      fontSize: Responsive.isMobile(context) ? 18 : 26,
                      letterSpacing: 1.3,
                      color: MyColors.blacColor.withOpacity(0.5),
                      textAlign: TextAlign.center,
                    ))
              ],
            ),
            SizedBox(height: Responsive.isMobile(context) ? height * 0.08 :  height * 0.14,),

            /// all projects view
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: Responsive.isMobile(context) ? 8.0 : 0),
                  child: MyTitleText(title: "Projects",fontSize: Responsive.isMobile(context) ? 34 : 42,),
                ),
                SizedBox(height: height * 0.02,),
                const ProjectsView(),
                SizedBox(height: height * 0.06,),
              ],
            ),
            SizedBox(height: Responsive.isMobile(context) ? height * 0.03 :  height * 0.06,),

            /// about section
            const WhatIDoView(),
            SizedBox(height: Responsive.isMobile(context) ? height * 0.09 :  height * 0.17,),

            /// contact section
            ContactView(),
            SizedBox(height: height * 0.05,),

            /// fotter view
            const FotterView()
          ],
        ),
      ),
    );
  }
}
