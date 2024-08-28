import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myportfolio/res/responsive/responsive.dart';
import 'package:myportfolio/res/widgets/my_title_text.dart';
import 'package:myportfolio/view_model/scroll_offset/scroll_offset.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({super.key});

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> imageReveal;
  late Animation<double> imageOpacity;
  bool isAnimate = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500),
      reverseDuration: const Duration(milliseconds: 500),
    );

    imageReveal = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: const Interval(0.0, 0.8, curve: Curves.easeOut)));

    imageOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: const Interval(0.0, 0.9, curve: Curves.easeOut)));


    super.initState();
  }
  List<String> projectsData = [
    'https://i.imgur.com/TWOPsTV_d.jpg?maxwidth=520&shape=thumb&fidelity=high',
    'https://i.imgur.com/uwGy0rE_d.jpg?maxwidth=520&shape=thumb&fidelity=high',
    'https://i.imgur.com/0A2TNwL_d.jpg?maxwidth=520&shape=thumb&fidelity=high',
    'https://i.imgur.com/n5EiYGR_d.jpg?maxwidth=520&shape=thumb&fidelity=high',
    'https://i.imgur.com/fFS9GSG_d.jpg?maxwidth=520&shape=thumb&fidelity=high',
    'https://i.imgur.com/RlDoRLR_d.jpg?maxwidth=520&shape=thumb&fidelity=high',
  ];

  List<String> projectsDataForMobile = [
    'https://i.imgur.com/TWOPsTV_d.jpg?maxwidth=520&shape=thumb&fidelity=high',
    'https://i.imgur.com/n5EiYGR_d.jpg?maxwidth=520&shape=thumb&fidelity=high',
    'https://i.imgur.com/uwGy0rE_d.jpg?maxwidth=520&shape=thumb&fidelity=high',
    'https://i.imgur.com/fFS9GSG_d.jpg?maxwidth=520&shape=thumb&fidelity=high',
    'https://i.imgur.com/0A2TNwL_d.jpg?maxwidth=520&shape=thumb&fidelity=high',
    'https://i.imgur.com/RlDoRLR_d.jpg?maxwidth=520&shape=thumb&fidelity=high',
  ];


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocBuilder<DisplayOffset, ScrollOffset>(

      buildWhen: (previous, current) {
        if (Responsive.isMobile(context)) {
          if ((current.scrollOffsetValue > 1690 && current.scrollOffsetValue <= 1920) || controller.isAnimating) {
            return true;
          } else if (current.scrollOffsetValue < 1690) {
            isAnimate = false;
            // controller.reverse();
            return true;
          } else {
            return false;
          }
        } else {
          if ((current.scrollOffsetValue > 1690 && current.scrollOffsetValue <= 1920) || controller.isAnimating) {
            return true;
          } else if (current.scrollOffsetValue < 1690) {
            isAnimate = false;
            controller.reverse();
            return true;
          } else {
            return false;
          }
        }
      },

  builder: (context, state) {
        if(Responsive.isMobile(context)) {
          if (state.scrollOffsetValue > 1758) {
            controller.forward();
            isAnimate = true;
          }
        }else{
          if (state.scrollOffsetValue > 1430) {
            controller.forward();
              isAnimate = true;
          } else {
            controller.reverse();
            isAnimate = false;
          }
        }

    return !isAnimate ? const SizedBox() : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: Responsive.isMobile(context) ? 8.0 : 0),
          child: MyTitleText(
            title: "Projects",
            fontSize: Responsive.isMobile(context) ? 37 : 42,
            maxHeight: 90.0,
            controller: controller,
          ),
        ),
        SizedBox(height: height * 0.02),
        SizedBox(
          width: Responsive.isMobile(context) ? width * 0.98 : Responsive.isTablet(context) ? width * 0.86 : width * 0.70,
          child: GridView.builder(
            itemCount: projectsData.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Responsive.isMobile(context) ? 1 : 3,
              childAspectRatio:
                  Responsive.isMobile(context) ? 0.3 / 0.22 : 0.12 / 0.09,
              mainAxisSpacing: Responsive.isMobile(context) ? 4 : 5,
              crossAxisSpacing: Responsive.isTablet(context) ? 12 : 7,
            ),
            itemBuilder: (context, index) {

              return AnimatedBuilder(
                animation: controller,
                builder: (context , child) {
                  return FadeTransition(
                    opacity: imageOpacity,
                    child: Transform.scale(
                      scale: imageReveal.value,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1),
                          image: DecorationImage(
                            image: NetworkImage(Responsive.isMobile(context) ? projectsDataForMobile[index] : projectsData[index].toString()),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                    ),
                  );
                }
              );
            },
          ),
        ),
      ],
    );
  },
);
  }
}
