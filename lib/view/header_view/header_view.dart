import 'package:flutter/material.dart';
import 'package:myportfolio/res/my_colors/my_colors.dart';
import 'package:myportfolio/res/responsive/responsive.dart';
import 'package:myportfolio/res/widgets/my_text.dart';

class HeaderView extends StatefulWidget {
  const HeaderView({super.key, this.openDrawerOnTap});
  final void Function()? openDrawerOnTap;

  @override
  State<HeaderView> createState() => _HeaderViewState();
}

class _HeaderViewState extends State<HeaderView> {
  // A map to track the hover state for each button
  final Map<String, bool> _isHovered = {
    'Home': false,
    'About': false,
    'Project': false,
    'Contact': false,
  };

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.08, vertical: height * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Drawer icon and profile
              Responsive.isMobile(context)
                  ? GestureDetector(
                      onTap: widget.openDrawerOnTap,
                      child: const Icon(Icons.menu,
                          color: MyColors.flutterColor, size: 40))
                  : const SizedBox(),
              Responsive.isMobile(context)
                  ? const SizedBox()
                  : Card(
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: MyColors.flutterColor, width: 4),
                          borderRadius: BorderRadius.circular(40)),
                      child: const CircleAvatar(
                        radius: 40,
                        backgroundColor: MyColors.flutterColor,
                        backgroundImage:
                            AssetImage('assets/images/profile.jpg'),
                      ),
                    ),
              const SizedBox(width: 20),
              Responsive.isMobile(context)
                  ? const SizedBox()
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MyText(
                          title: "M Hashim",
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          color: MyColors.whiteColor,
                          fontFamily: 'Oswald',
                          letterSpacing: 2,
                        ),
                        RichText(
                                text: const TextSpan(
                                    text: "Flutter",
                                    style: TextStyle(
                                        color: MyColors.flutterColor,
                                        fontSize: 22,
                                        fontFamily: 'Oswald',
                                        fontWeight: FontWeight.w800),
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
                                      fontWeight: FontWeight.w300))
                            ]))
                      ],
                    ),
            ],
          ),
          Responsive.isMobile(context)
              ? const SizedBox()
              : Row(
                  children: [
                    headerButton("Home"),
                    const SizedBox(width: 16),
                    headerButton("About"),
                    const SizedBox(width: 16),
                    headerButton("Project"),
                    const SizedBox(width: 16),
                    headerButton("Contact"),
                  ],
                ),
        ],
      ),
    );
  }

  Widget headerButton(String title) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          _isHovered[title] = true;
        });
      },
      onExit: (value) {
        setState(() {
          _isHovered[title] = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: EdgeInsets.only(bottom: _isHovered[title]! ? 30 : 0),
        transform: Matrix4.rotationY(_isHovered[title]! ? 0.26 : 0)
          ..rotateZ(_isHovered[title]! ? 0.2 : 0),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: _isHovered[title]!
                        ? Colors.greenAccent.withOpacity(0.9)
                        : Colors.transparent,
                    width: 4))
        ),
        child: MyText(
          title: title,
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: MyColors.flutterColor,
        ),
      ),
    );
  }
}
