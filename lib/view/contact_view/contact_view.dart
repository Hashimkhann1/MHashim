

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:myportfolio/res/my_colors/my_colors.dart';
import 'package:myportfolio/res/responsive/responsive.dart';
import 'package:myportfolio/res/widgets/my_text_button.dart';
import 'package:myportfolio/res/widgets/my_textfromfield.dart';
import 'package:myportfolio/res/widgets/my_title_text.dart';

class ContactView extends StatelessWidget {
  ContactView({super.key});

  final nameContorller = TextEditingController();
  final emailContorller = TextEditingController();
  final messegeContorller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: Responsive.isMobile(context) ? width * 0.96 : width * 0.5,
      padding: EdgeInsets.symmetric(horizontal: width * 0.01,vertical: height * 0.03),
      decoration: BoxDecoration(
        color: MyColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: MyColors.flutterColor.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 6
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          MyTitleText(title: "Contact",fontSize: Responsive.isMobile(context) ? 34 : 42,),
          SizedBox(height: height * 0.02,),
          
          MyTextFormField(hintText: "Name", controller: nameContorller,fillColor: MyColors.whiteColor,),
          SizedBox(height: height * 0.02,),
          MyTextFormField(hintText: "Email", controller: emailContorller,fillColor: MyColors.whiteColor),
          SizedBox(height: height * 0.02,),
          MyTextFormField(hintText: "Message", controller: messegeContorller,fillColor: MyColors.whiteColor,maxLines: Responsive.isMobile(context) ? 3 : 5,),
          SizedBox(height: height * 0.02,),
          Align(alignment: Alignment.topLeft, child: MyTextButton(title: "Send Message", fontSize: 18, onPressed: (){},width: 140,height: 48,))

        ],
      ),
    );
  }
}
