import 'package:flutter/material.dart';
import 'package:myportfolio/res/my_colors/my_colors.dart';
import 'package:myportfolio/res/widgets/my_text.dart';
import 'package:myportfolio/view/header_view/header_view.dart';
import 'package:myportfolio/view/projects_view/projects_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderView(),
        
            /// main section
            Column(
              children: [
                /// my image
                CircleAvatar(
                  radius: 90,
                  backgroundColor: MyColors.flutterColor,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
                SizedBox(
                  height: height * 0.01,
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
                        child: MyText(
                          title: "Flutter Developer",
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Oswald',
                          letterSpacing: 3,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    Container(
                      child: MyText(
                        title: "Flutter Developer",
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Oswald',
                        letterSpacing: 3,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01,),
        
                Container(
                  width: width * 0.68,
                    child: MyText(
                        title:
                            "For over a decade, I’ve mastered the craft of turning code into dynamic, functional experiences. As a Flutter developer, I create seamless cross-platform apps, blending creativity with technical skill. From bringing ideas to life on the web to crafting elegant mobile solutions, I have the expertise to transform visions into reality.",
                      fontSize: 26,
                      letterSpacing: 1.3,
                      color: MyColors.blacColor.withOpacity(0.5),
                      textAlign: TextAlign.center,
                    ))
              ],
            ),
            SizedBox(height: height * 0.1,),

            /// all projects view
            ProjectsView(),
            SizedBox(height: height * 0.06,),
          ],
        ),
      ),
    );
  }
}
