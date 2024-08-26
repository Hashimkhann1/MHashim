import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myportfolio/view.dart';
import 'package:myportfolio/view_model/scroll_offset/scroll_offset.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      context.read<DisplayOffset>().changeDisplayOffset(
          (MediaQuery.of(context).size.height +
                  _scrollController.position.pixels)
              .toInt());
    });
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.black87,
        drawer: MyDrawer(
          closeDrawerOnTap: () {
            _scaffoldKey.currentState!.closeDrawer();
          },
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              HeaderView(
                openDrawerOnTap: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
              ),
              SizedBox(
                  height: Responsive.isMobile(context) ? height * 0.08 : 0),

              /// initial view
              const InitialView(),
              SizedBox(
                  height: Responsive.isMobile(context)
                      ? height * 0.03
                      : height * 0.14),

              /// about section
              const AboutView(),

              /// project section
              const ProjectsView(),
              SizedBox(height: height * 0.04),
              SizedBox(
                  height: Responsive.isMobile(context)
                      ? height * 0.03
                      : height * 0.06),

              /// what i love to do section
              const WhatIDoView(),
              SizedBox(
                  height: Responsive.isMobile(context)
                      ? height * 0.09
                      : height * 0.17),

              /// contact section
              const ContactView(),
              SizedBox(height: height * 0.05),

              /// fotter sectino
              const FotterView(),
            ],
          ),
        ),
        floatingActionButton: BlocBuilder<DisplayOffset, ScrollOffset>(
          builder: (context, state) {
            return state.scrollOffsetValue > 1140
                ? FloatingActionButton(
                    onPressed: _scrollToTop,
                    backgroundColor: MyColors.flutterColor,
                    child: const Icon(
                      Icons.keyboard_double_arrow_up_sharp,
                      color: MyColors.whiteColor,
                      size: 32,
                    ),
                  )
                : const SizedBox();
          },
        ));
  }
}
