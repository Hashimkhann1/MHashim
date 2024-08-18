import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:myportfolio/res/my_colors/my_colors.dart';
import 'package:myportfolio/res/responsive/responsive.dart';
import 'package:myportfolio/res/widgets/my_drawer/my_drawer.dart';
import 'package:myportfolio/res/widgets/my_text.dart';
import 'package:myportfolio/res/widgets/my_title_text.dart';
import 'package:myportfolio/view/about_view/about_view.dart';
import 'package:myportfolio/view/contact_view/contact_view.dart';
import 'package:myportfolio/view/fotter_view/fotter_view.dart';
import 'package:myportfolio/view/header_view/header_view.dart';
import 'package:myportfolio/view/projects_view/projects_view.dart';
import 'package:myportfolio/view/what_i_do_view/what_i_do_view.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTopButton = false;
  bool _showProjects = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _showScrollToTopButton = _scrollController.offset > 300;
        if(MediaQuery.of(context).size.width < 750){
          if(_scrollController.offset > 494){
            _showProjects = true;
          }else{
            _showProjects = false;
          }
        }else{
          if(_scrollController.offset > 320){
            _showProjects = true;
          }else{
            _showProjects = false;
          }
        }

      });
    });
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: MyColors.whiteColor,
      drawer: MyDrawer(
        closeDrawerOnTap: () {
          _scaffoldKey.currentState!.closeDrawer();
        },
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HeaderView(
              openDrawerOnTap: () {
                _scaffoldKey.currentState!.openDrawer();
              },
            ),
            SizedBox(height: Responsive.isMobile(context) ? height * 0.08 : 0),
            Column(
              children: [
                CircleAvatar(
                  radius: Responsive.isMobile(context) ? 70 : 90,
                  backgroundColor: MyColors.flutterColor,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
                SizedBox(height: Responsive.isMobile(context) ? height * 0.05 : height * 0.01),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: height * 0.009,
                      child: Container(
                        height: 22,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent.withOpacity(0.4),
                        ),
                        child: const MyText(
                          title: "Flutter Developer",
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Oswald',
                          letterSpacing: 3,
                          color: Colors.transparent,
                        ),
                      ),
                    ).animate().fade(duration: 200.ms).scaleX(duration: Duration(milliseconds: 2300)),
                    MyText(
                      title: "Flutter Developer",
                      fontSize: Responsive.isMobile(context) ? 34 : 38,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Oswald',
                      letterSpacing: 3,
                    ).animate().fade(duration: 300.ms).shakeX(duration: Duration(milliseconds: 2000)),
                  ],
                ),
                SizedBox(height: height * 0.01),
                Container(
                  width: Responsive.isMobile(context) ? width * 0.92 : width * 0.68,
                  child: MyText(
                    title:
                    "For over a decade, I’ve mastered the craft of turning code into dynamic, functional experiences. As a Flutter developer, I create seamless cross-platform apps, blending creativity with technical skill. From bringing ideas to life on the web to crafting elegant mobile solutions, I have the expertise to transform visions into reality.",
                    fontSize: Responsive.isMobile(context) ? 18 : 26,
                    letterSpacing: 1.3,
                    color: MyColors.blacColor.withOpacity(0.5),
                    textAlign: Responsive.isMobile(context) ? TextAlign.start : TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(height: Responsive.isMobile(context) ? height * 0.08 : height * 0.14),
            AboutView(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: Responsive.isMobile(context) ? 8.0 : 0),
                  child: MyTitleText(
                    title: "Projects",
                    fontSize: Responsive.isMobile(context) ? 34 : 42,
                  ),
                ),
                SizedBox(height: height * 0.02),
                _showProjects ? ProjectsView() : SizedBox(),
                SizedBox(height: height * 0.06),
              ],
            ),
            SizedBox(height: Responsive.isMobile(context) ? height * 0.03 : height * 0.06),
            const WhatIDoView(),
            SizedBox(height: Responsive.isMobile(context) ? height * 0.09 : height * 0.17),
            ContactView(),
            SizedBox(height: height * 0.05),
            const FotterView(),
          ],
        ),
      ),
      floatingActionButton: _showScrollToTopButton
          ? FloatingActionButton(
        onPressed: _scrollToTop,
        child: Icon(Icons.arrow_upward),
        backgroundColor: MyColors.flutterColor,
      )
          : null,
    );
  }
}
