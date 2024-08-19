


import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:myportfolio/res/my_colors/my_colors.dart';
import 'package:myportfolio/res/responsive/responsive.dart';
import 'package:myportfolio/res/widgets/my_text.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key,this.openDrawerOnTap});
  final void Function()? openDrawerOnTap;

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

              /// drawer icon
              Responsive.isMobile(context) ? GestureDetector(onTap: openDrawerOnTap, child: const Icon(Icons.menu,color: MyColors.flutterColor,size: 40,)) : const SizedBox(),
              Responsive.isMobile(context) ? const SizedBox() :   Card(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: MyColors.flutterColor,width: 4),
                  borderRadius: BorderRadius.circular(40)
                ),
                child: const CircleAvatar(
                  radius: 40,
                  backgroundColor: MyColors.flutterColor,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
              ),
              const SizedBox(width: 20,),
              Responsive.isMobile(context) ? const SizedBox() :   Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// name
                  const MyText(title: "M Hashim",fontSize: 26,fontWeight: FontWeight.w900,color: MyColors.whiteColor,fontFamily: 'Oswald',letterSpacing: 2,).animate().fade(duration: 700.ms,delay: 800.ms).shimmer(duration: const Duration(milliseconds: 2500),color: Colors.black),
                  RichText(
                      text: const TextSpan(
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
                                    color: MyColors.whiteColor,
                                    fontWeight: FontWeight.w300
                                )
                            )
                          ]
                      )
                  ).animate().fade(duration: 700.ms,delay: 800.ms).shimmer(duration: const Duration(milliseconds: 2500),color: MyColors.flutterColor),
                ],
              )
            ],
          ),

          Responsive.isMobile(context) ? const SizedBox() :   const Row(
            children: [
              MyText(title: "Home",fontSize: 20,fontWeight: FontWeight.w800,color: MyColors.flutterColor,),
              SizedBox(width: 16,),
              MyText(title: "About",fontSize: 20,fontWeight: FontWeight.w800,color: MyColors.flutterColor,),
              SizedBox(width: 16,),
              MyText(title: "Project",fontSize: 20,fontWeight: FontWeight.w800,color: MyColors.flutterColor,),
              SizedBox(width: 16,),
              MyText(title: "Contact",fontSize: 20,fontWeight: FontWeight.w800,color: MyColors.flutterColor,),
            ],
          )
        ],
      ),
    );
  }
}
