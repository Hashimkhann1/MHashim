import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:myportfolio/res/widgets/my_text.dart';
import 'package:myportfolio/res/widgets/my_text_button.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    print(width);
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: width,
            height: height * 0.34,
            decoration: BoxDecoration(
              color: Colors.yellowAccent,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  width: width * 0.78,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        title: 'M Hashim',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                      MyTextButton(
                        title: "About me",
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.black54,
                        // width: width > 1420 ? width * 0.06 : width > 1120 ? width * 0.08 : width > 910 ? width * 0.11 : width > 690 ? width * 0.14 : width > 510 ? width * 0.17 : width * 0.20,
                        height: height * 0.03,
                        padding: EdgeInsets.symmetric(horizontal: 11),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: height * 0.07,
          ),
          Expanded(
            child: SizedBox(
              width: width * 0.70,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.8 / 1.4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 12),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          // color: Colors.grey,
                        borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade400, blurRadius: 10)
                          ]),
                      child: Stack(
                        children: [
                          Container(
                            width: width,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                              borderRadius: BorderRadius.circular(12)
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              width: width,
                              height: height * 0.09,
                              clipBehavior: Clip.hardEdge,

                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(12),
                                      bottomLeft: Radius.circular(12))),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
