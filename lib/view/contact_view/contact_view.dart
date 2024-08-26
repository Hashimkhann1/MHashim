


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myportfolio/res/my_colors/my_colors.dart';
import 'package:myportfolio/res/responsive/responsive.dart';
import 'package:myportfolio/res/widgets/my_text_button.dart';
import 'package:myportfolio/res/widgets/my_textfromfield.dart';
import 'package:myportfolio/res/widgets/my_title_text.dart';
import 'package:myportfolio/view_model/scroll_offset/scroll_offset.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> with TickerProviderStateMixin{
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messegeController = TextEditingController();

  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500),
      reverseDuration: const Duration(milliseconds: 375),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: Responsive.isMobile(context) ? width * 0.96 : width * 0.5,
      padding: EdgeInsets.symmetric(horizontal: width * 0.01,vertical: height * 0.03),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: MyColors.whiteColor.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 6
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          BlocBuilder<DisplayOffset, ScrollOffset>(

            buildWhen: (previous, current) {
              if ((current.scrollOffsetValue > 2829 &&
                  current.scrollOffsetValue <= 2974) ||
                  controller.isAnimating) {
                return true;
              } else {
                return false;
              }
            },

            builder: (context, state) {
              if (state.scrollOffsetValue > 2859) {
                controller.forward();
              } else {
                controller.reverse();
              }

              return MyTitleText(title: "Contact",fontSize: Responsive.isMobile(context) ? 34 : 42,maxHeight: 90.0,controller: controller,);
  },
),
          SizedBox(height: height * 0.02,),

          MyTextFormField(hintText: "Name", controller: nameController,fillColor: Colors.transparent, textColor: MyColors.whiteColor,hintTextColor: CupertinoColors.white,focusedBorderSide: const BorderSide(color: MyColors.flutterColor),),
          SizedBox(height: height * 0.02,),
          MyTextFormField(hintText: "Email", controller: emailController,fillColor: Colors.transparent , textColor: MyColors.whiteColor,hintTextColor: CupertinoColors.white,),
          SizedBox(height: height * 0.02,),
          MyTextFormField(hintText: "Message", controller: messegeController,fillColor: Colors.transparent, maxLines: Responsive.isMobile(context) ? 3 : 5, textColor: MyColors.whiteColor,hintTextColor: CupertinoColors.white,),
          SizedBox(height: height * 0.02,),
          Align(alignment: Alignment.topLeft, child: MyTextButton(title: "Send Message", fontSize: 18, onPressed: (){},width: 140,height: 48,backgroundColor: Colors.greenAccent.withOpacity(0.8),))

        ],
      ),
    );
  }
}
