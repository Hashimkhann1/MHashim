
import 'package:flutter/material.dart';
import 'package:myportfolio/res/widgets/my_text.dart';
import 'package:myportfolio/res/widgets/my_title_text.dart';

class WhatIDoView extends StatelessWidget {
  const WhatIDoView({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: MyTitleText(title: "What I Love Doing",fontSize: 55,)),
        SizedBox(height: height * 0.06,),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            /// web work
            SizedBox(
              width: width * 0.28,
              child: Column(
                children: [
                  /// web icon image
                  Container(
                    width: 80,
                    height: 62,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage('assets/images/webIcon.png'),
                      fit: BoxFit.cover
                    )
                  ),),
                  SizedBox(height: height * 0.01,),

                  /// title
                  MyText(title: "Web Development",fontSize: 30,fontWeight: FontWeight.w900,),
                  SizedBox(height: height * 0.01,),
                  /// descripition
                  MyText(title: "I like to code things from scratch, and enjoy bringing ideas to life in the browser. As dedicated developer brings you cutting-edge programming and design.",fontSize: 23,textAlign: TextAlign.center,),
                ],
              ),
            ),
            SizedBox(width: width * 0.03,),

            /// app word
            SizedBox(
              width: width * 0.28,
              child: Column(
                children: [
                  /// web icon image
                  Container(
                    width: 120,
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage('assets/images/app-development.png'),
                      fit: BoxFit.fitHeight
                    )
                  ),),
                  SizedBox(height: height * 0.01,),

                  /// title
                  MyText(title: "Mobile App Development",fontSize: 30,fontWeight: FontWeight.w900,),
                  SizedBox(height: height * 0.01,),

                  /// descripition
                  MyText(title: "Experienced mobile app developer who has a track record of success creating apps that are both well-received and commercially viable.",fontSize: 23,textAlign: TextAlign.center,),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
