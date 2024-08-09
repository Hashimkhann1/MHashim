


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myportfolio/res/my_colors/my_colors.dart';
import 'package:myportfolio/res/widgets/my_text.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.08,vertical: height * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: MyColors.flutterColor,width: 4),
                  borderRadius: BorderRadius.circular(40)
                ),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: MyColors.flutterColor,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
              ),
              SizedBox(width: 20,),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// name
                  Container(child: MyText(title: "M Hashim",fontSize: 26,fontWeight: FontWeight.w900,color: MyColors.blacColor,fontFamily: 'Oswald',letterSpacing: 2,)),
                  RichText(
                      text: TextSpan(
                          text: "Flutter",
                          style: TextStyle(
                              color: MyColors.flutterColor,
                              fontSize: 22,
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.w800
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: " ",
                              style: TextStyle(fontSize: 22),
                            ),
                            TextSpan(
                                text: "Developer",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: MyColors.blacColor,
                                    fontWeight: FontWeight.w300
                                )
                            )
                          ]
                      )
                  )
                ],
              )
            ],
          ),
          
          Row(
            children: [
              MyText(title: "Home",fontSize: 20,fontWeight: FontWeight.w800,color: MyColors.flutterColor,),
              SizedBox(width: width * 0.01,),
              MyText(title: "About",fontSize: 20,fontWeight: FontWeight.w800,color: MyColors.flutterColor,),
              SizedBox(width: width * 0.01,),
              MyText(title: "Project",fontSize: 20,fontWeight: FontWeight.w800,color: MyColors.flutterColor,),
              SizedBox(width: width * 0.01,),
              MyText(title: "Contact",fontSize: 20,fontWeight: FontWeight.w800,color: MyColors.flutterColor,),
            ],
          )
        ],
      ),
    );
  }
}
