
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myportfolio/res/my_colors/my_colors.dart';
import 'package:myportfolio/res/widgets/my_text.dart';

class FotterView extends StatelessWidget {
  const FotterView({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.08,
      color: Colors.grey.withOpacity(0.2),
      padding: EdgeInsets.symmetric(horizontal: width * 0.08),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const MyText(title: "HMK",fontSize: 25,fontWeight: FontWeight.w900,color: MyColors.flutterColor,fontFamily: 'Oswald',letterSpacing: 2,),

          Row(
            children: [
              IconButton(onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.linkedin , size: 30,),color: Colors.blueAccent),
              IconButton(onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.github , size: 30,),color: MyColors.blacColor),
              IconButton(onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.facebook , size: 30,),color: Colors.blueAccent),
            ],
          )
        ],
      ),
    );
  }
}
