
import 'package:myportfolio/view.dart';

class InitialView extends StatelessWidget {
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(height: Responsive.isMobile(context) ? height * 0.02 : height * 0.1,),
        CircleAvatar(
          radius: Responsive.isMobile(context) ? 90 : 110,
          backgroundColor: Colors.transparent,
          backgroundImage: const AssetImage('assets/images/profile.jpg'),
        ).animate().fade(duration: 600.ms,delay: 400.ms).slideY(duration: const Duration(milliseconds: 1500)),
        SizedBox(height: Responsive.isMobile(context) ? height * 0.04 : height * 0.03),
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: height * 0.009,
              child: Container(
                height: 22,
                decoration: BoxDecoration(
                  color: Colors.greenAccent.withOpacity(0.8),
                ),
                child: MyText(
                  title: "Flutter Developer",
                  fontSize: Responsive.isMobile(context) ? 38 : 38,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Oswald',
                  letterSpacing: 3,
                  color: Colors.transparent,
                ),
              ),
            ).animate().fade(duration: 600.ms,delay: 500.ms).scaleX(duration: const Duration(milliseconds: 2300)),
            MyText(
              title: "Flutter Developer",
              fontSize: Responsive.isMobile(context) ? 38 : 38,
              fontWeight: FontWeight.bold,
              fontFamily: 'Oswald',
              color: Colors.white,
              letterSpacing: 3,
            ).animate().fade(duration: 700.ms,delay: 800.ms).shimmer(duration: const Duration(milliseconds: 2500),color: Colors.black),
          ],
        ),
        SizedBox(height: height * 0.03),
        SizedBox(
          width: Responsive.isMobile(context) ? width * 0.92 : width * 0.68,
          child: MyText(
            title:
            "For over a decade, I’ve mastered the craft of turning code into dynamic, functional experiences. As a Flutter developer, I create seamless cross-platform apps, blending creativity with technical skill. From bringing ideas to life on the web to crafting elegant mobile solutions, I have the expertise to transform visions into reality.",
            fontSize: Responsive.isMobile(context) ? 20 : 26,
            letterSpacing: 1.3,
            color: MyColors.whiteColor.withOpacity(0.7),
            textAlign: Responsive.isMobile(context) ? TextAlign.start : TextAlign.center,
          ).animate().fade(duration: 600.ms,delay: 500.ms).saturate(duration: const Duration(milliseconds: 3400)),
        ),

        SizedBox(height: height * 0.02,),
        AnimatedButton(
          height: 60,
          width: 200,
          text: 'About me',
          textStyle: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),
          isReverse: true,
          selectedTextColor: Colors.white,
          transitionType: TransitionType.LEFT_TO_RIGHT,
          // textStyle: submitTextStyle,
          selectedBackgroundColor: Colors.greenAccent.withOpacity(0.8),
          backgroundColor: Colors.black38,
          borderColor: Colors.greenAccent.withOpacity(0.5),
          borderRadius: 12,
          borderWidth: 2,
          onPress: () {  },
        ).animate().fade(delay: 500.ms).scaleY(delay: 1600.ms,duration: const Duration(milliseconds: 300)).shimmer(delay: 2000.ms, duration: const Duration(milliseconds: 1400)),

        SizedBox(height: Responsive.isMobile(context) ? height * 0.02 : height * 0.04,)
      ],
    );
  }
}
