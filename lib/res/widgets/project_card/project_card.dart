

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myportfolio/view.dart';

class ProjectCard extends StatefulWidget {
  final AnimationController controller;
  final Animation<double> imageOpacity;
  final Animation<double> imageReveal;
  const ProjectCard({super.key , required this.controller , required this.imageOpacity , required this.imageReveal});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {


  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final animation = Tween<double>(begin: 0.0, end: 1.0).animate(widget.controller);


    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context , child) {
        return FadeTransition(
          opacity: widget.imageOpacity,
          child: Transform.scale(
            scale: animation.value,
            child: Container(
              // width: widget.imageReveal.value + 100,
              // height: widget.imageReveal.value,
              color: Colors.white,
            ),
          ),
        );
      }
    );
  }
}
