
import 'package:myportfolio/view.dart';

class WhatIDoView extends StatefulWidget  {
  const WhatIDoView({super.key});

  @override
  State<WhatIDoView> createState() => _WhatIDoViewState();
}

class _WhatIDoViewState extends State<WhatIDoView> with TickerProviderStateMixin {

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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: Responsive.isMobile(context) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Center(child: MyTitleText(title: "What I Love Doing",fontSize: Responsive.isMobile(context) ? 40 :  55,maxHeight: 90.0,controller: controller,)),
        SizedBox(height: height * 0.06,),

        Responsive.isMobile(context)
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
      ],
    );
  }

List<Widget> _buildContent(BuildContext context, double width, double height) {
  return [
    /// Web Development section
    SizedBox(
      width: Responsive.isMobile(context) ? width * 0.94 : width * 0.28,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Web icon image
          Container(
            width: 80,
            height: 62,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: AssetImage('assets/images/webIcon.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: height * 0.01),

          // Title
          MyText(
            title: "Web Development",
            fontSize: Responsive.isMobile(context) ? 25 : 30,
            fontWeight: FontWeight.w900,
            color: Colors.grey[100],
          ),
          SizedBox(height: height * 0.01),

          // Description
          MyText(
            title:
            "I like to code things from scratch, and enjoy bringing ideas to life in the browser. As a dedicated developer brings you cutting-edge programming and design.",
            fontSize: Responsive.isMobile(context) ? 18 : 23,
            textAlign: TextAlign.center,
            color: Colors.grey[300],
          ),
        ],
      ),
    ),
    SizedBox(width: width * 0.03 , height: Responsive.isMobile(context) ? height * 0.06 : 0,),

    /// Mobile App Development section
    SizedBox(
      width: Responsive.isMobile(context) ? width * 0.94 : width * 0.28,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // App development icon image
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
          SizedBox(height: height * 0.01),

          // Title
          MyText(
            title: "Mobile App Development",
            fontSize: Responsive.isMobile(context) ? 25 : 30,
            fontWeight: FontWeight.w900,
            color: Colors.grey[100],
          ),
          SizedBox(height: height * 0.01),

          // Description
          MyText(
            title:
            "Experienced mobile app developer who has a track record of success creating apps that are both well-received and commercially viable.",
            fontSize: Responsive.isMobile(context) ? 18 : 23,
            textAlign: TextAlign.center,
            color: Colors.grey[300],
          ),
        ],
      ),
    )
  ];
}}
