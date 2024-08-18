

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myportfolio/res/my_colors/my_colors.dart';
import 'package:myportfolio/res/widgets/my_text_button.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key,this.closeDrawerOnTap});

  final void Function()? closeDrawerOnTap;

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Drawer(
    child: Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: Column(
          children: [
            /// close Icon
            Align(alignment: Alignment.topRight, child: GestureDetector(onTap: closeDrawerOnTap, child: Icon(Icons.clear,size: 40, color: MyColors.flutterColor,))),
            SizedBox(height: height * 0.05,),

            /// my image
            Card(
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: MyColors.flutterColor,width: 4),
                  borderRadius: BorderRadius.circular(84)
              ),
              child: CircleAvatar(
                radius: 74,
                backgroundColor: MyColors.flutterColor,
                backgroundImage: AssetImage('assets/images/profile.jpg',),
              ),
            ),
            SizedBox(height: height * 0.08,),

            /// section button
            Column(
              children: [

                /// about button
                MyTextButton(
                  width: width * 0.60,
                    height: 44,
                    title: "About",
                    fontSize: 22,
                    onPressed: (){},
                ),
                SizedBox(height: 14,),

                /// project buttons
                MyTextButton(
                  width: width * 0.60,
                    height: 44,
                    title: "Projects",
                    fontSize: 22,
                    onPressed: (){},
                ),
                SizedBox(height: 14,),

                ///contact button
                MyTextButton(
                  width: width * 0.60,
                    height: 44,
                    title: "Contact",
                    fontSize: 22,
                    onPressed: (){},
                ),

              ],
            ),
            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.linkedin , size: 30,),color: Colors.blueAccent),
                SizedBox(width: 12,),
                IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.github , size: 30,),color: MyColors.blacColor),
                SizedBox(width: 12,),
                IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.facebook , size: 30,),color: Colors.blueAccent),
              ],
            )
          ],
        ),
      ),
    ),
    );
  }
}
