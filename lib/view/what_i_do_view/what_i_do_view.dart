import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myportfolio/view.dart';
import 'package:myportfolio/view_model/scroll_offset/scroll_offset.dart';

class WhatIDoView extends StatefulWidget {
  const WhatIDoView({super.key});

  @override
  State<WhatIDoView> createState() => _WhatIDoViewState();
}

class _WhatIDoViewState extends State<WhatIDoView>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> textRevealAnimation;
  late Animation<double> textOpicatyAnimation;
  late Animation<double> animation;
  bool isAnimate = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2300),
      reverseDuration: const Duration(milliseconds: 375),
    );

    textRevealAnimation = Tween<double>(begin: 120.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.8, curve: Curves.easeOut)));

    textOpicatyAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.9, curve: Curves.easeOut)));

    animation = Tween(begin: 80.0, end: 0.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOut)
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocBuilder<DisplayOffset, ScrollOffset>(

      buildWhen: (previous, current) {
        if(Responsive.isMobile(context)){
          if ((current.scrollOffsetValue > 3500 &&
              current.scrollOffsetValue <= 3570) ||
              controller.isAnimating) {
            return true;
          } else {
            return false;
          }
        }else{
          if ((current.scrollOffsetValue > 2280 &&
              current.scrollOffsetValue <= 2889) ||
              controller.isAnimating) {
            return true;
          } else {
            return false;
          }
        }
      },

      builder: (context, state) {
        if(Responsive.isMobile(context)){
          if (state.scrollOffsetValue > 3530) {
            controller.forward();
            isAnimate = true;
          }
        }else{
          if (state.scrollOffsetValue > 2345) {
            controller.forward();
            isAnimate = true;
          } else {
            controller.reverse();
            isAnimate = false;
          }
        }

        return !isAnimate ? const SizedBox() : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: Responsive.isMobile(context)
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            Center(
                child: MyTitleText(
              title: "What I Love Doing",
              fontSize: Responsive.isMobile(context) ? 40 : 55,
              maxHeight: 90.0,
              controller: controller,
            )),
            SizedBox(
              height: height * 0.06,
            ),
            AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return SizedBox(
                    child: Responsive.isMobile(context)
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: _buildContent(context, width, height),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: _buildContent(context, width, height),
                          ),
                  );
                }),
          ],
        );
      },
    );
  }

  List<Widget> _buildContent(
      BuildContext context, double width, double height) {
    return [
      /// Web Development section
      SizedBox(
        width: Responsive.isMobile(context) ? width * 0.94 : width * 0.28,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Web icon image
            SizedBox(
              width: 120,
              height: 90,
              child: Stack(
                children: [

                  Container(
                    width: 110,
                    height: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/webIcon.png'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),

                  Align(
                    alignment: const Alignment(-1.0 , 1.0),
                    child: Container(
                      height: 300.0,
                      width: animation.value,
                      color: const Color(0xFF262626),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: height * 0.01),

            // Title
            SizedBox(
              height: height * 0.05,
              child: Padding(
                padding: EdgeInsets.only(top: textRevealAnimation.value),
                child: MyText(
                  title: "Web Development",
                  fontSize: Responsive.isMobile(context) ? 25 : 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.grey[100],
                ),
              ),
            ),
            // Description
            FadeTransition(
              opacity: textOpicatyAnimation,
              child: MyText(
                title:
                    "I like to code things from scratch, and enjoy bringing ideas to life in the browser. As a dedicated developer brings you cutting-edge programming and design.",
                fontSize: Responsive.isMobile(context) ? 18 : 23,
                textAlign: TextAlign.center,
                color: Colors.grey[300],
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        width: width * 0.03,
        height: Responsive.isMobile(context) ? height * 0.06 : 0,
      ),

      /// Mobile App Development section
      SizedBox(
        width: Responsive.isMobile(context) ? width * 0.94 : width * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // App development icon image
            SizedBox(
              width: 120,
              height: 90,
              child: Stack(
                children: [

                  Container(
                    width: 120,
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/app-development.png'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),

                  Align(
                    alignment: const Alignment(1.0 , 1.0),
                    child: Container(
                      height: 300.0,
                      width: animation.value,
                      color: const Color(0xFF262626),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: height * 0.01),

            // Title
            SizedBox(
              height: height * 0.05,
              child: Padding(
                padding: EdgeInsets.only(top: textRevealAnimation.value),
                child: MyText(
                  title: "Mobile App Development",
                  fontSize: Responsive.isMobile(context) ? 25 : 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.grey[100],
                ),
              ),
            ),

            // Description
            FadeTransition(
              opacity: textOpicatyAnimation,
              child: MyText(
                title:
                    "Experienced mobile app developer who has a track record of success creating apps that are both well-received and commercially viable.",
                fontSize: Responsive.isMobile(context) ? 18 : 23,
                textAlign: TextAlign.center,
                color: Colors.grey[300],
              ),
            ),
          ],
        ),
      )
    ];
  }
}
