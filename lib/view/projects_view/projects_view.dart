import 'package:flutter/material.dart';
import 'package:myportfolio/res/responsive/responsive.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final heigth = MediaQuery.of(context).size.height;

    return SizedBox(
      width: 1250,
      // height: heigth * 0.5,
      child: GridView.builder(
        itemCount: 6,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Responsive.isMobile(context) ? 1 : Responsive.isTablet(context) ? 2 : 3,
            childAspectRatio: Responsive.isMobile(context) ? 0.35/0.22 : 0.35/0.3,
            mainAxisSpacing: 5,
            crossAxisSpacing: Responsive.isTablet(context) ? 0 : 5,
          ),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: Responsive.isDesktop(context) ? 0 : 5),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(Responsive.isTablet(context) ? 10 : 5)
              ),
            );
          }),
    );
  }
}
