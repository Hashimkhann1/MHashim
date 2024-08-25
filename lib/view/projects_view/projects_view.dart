import 'package:flutter/material.dart';
import 'package:myportfolio/res/responsive/responsive.dart';
import 'package:myportfolio/res/widgets/my_title_text.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({super.key});

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> with TickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3500),
      reverseDuration: Duration(milliseconds: 375),
    );
    super.initState();
  }

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
            maxHeight: 90.0,
            controller: controller,
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
              );
            },
          ),
        ),
      ],
    );

  }
}
