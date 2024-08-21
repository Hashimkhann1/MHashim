import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:myportfolio/res/responsive/responsive.dart';
import 'package:myportfolio/res/widgets/my_title_text.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Column(
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
        SizedBox(
          width: Responsive.isMobile(context) ? width * 0.98 :  1250,
          child: GridView.builder(
            // controller: _scrollController,
            itemCount: 6,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Responsive.isMobile(context)
                  ? 1
                  : Responsive.isTablet(context)
                  ? 2
                  : 3,
              childAspectRatio: Responsive.isMobile(context) ? 0.35 / 0.22 : 0.35 / 0.3,
              mainAxisSpacing: Responsive.isMobile(context) ? 8 : 5,
              crossAxisSpacing: Responsive.isTablet(context) ? 0 : 5,
            ),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: Responsive.isDesktop(context) ? 0 : 5),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(Responsive.isTablet(context) ? 10 : 5),
                ),
              ).animate(
                delay: (100 * index).ms, // Delay each item to create a staggered effect
              ).scaleXY(
                duration: Responsive.isMobile(context) ? index == 0 ? 1850.ms : index == 1 ? 2150.ms : (index * 740 ).ms : index == 0 ? 1450.ms : index == 1 ? 1650.ms : (index * 600 ).ms,
                curve: Curves.easeOut
                // curve: Curves.easeOut,
              );
            },
          ),
        ),
      ],
    );

  }
}
