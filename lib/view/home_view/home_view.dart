import 'package:myportfolio/view.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTopButton = false;
  bool _showProjects = false;
  bool _showWhatIDo = false;
  bool _showContact = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        /// for scroll to top button
        _showScrollToTopButton = _scrollController.offset > 300;
        if(MediaQuery.of(context).size.width < 750){
          _showProjects = _scrollController.offset > 790;
          _showWhatIDo = _scrollController.offset > 2520;
          _showContact = _scrollController.offset > 3150;
        }else{
          _showProjects = _scrollController.offset > 430;
          _showWhatIDo = _scrollController.offset > 1440;
          _showContact = _scrollController.offset > 1940;
        }
      });
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
            SizedBox(height: Responsive.isMobile(context) ? height * 0.08 : 0),


            /// initial view
            const InitialView(),
            SizedBox(height: Responsive.isMobile(context) ? height * 0.03 : height * 0.14),

            /// about section
            const AboutView(),

            /// project section
            _showProjects ? const ProjectsView() : const SizedBox(),
            SizedBox(height: height * 0.04),
            SizedBox(height: Responsive.isMobile(context) ? height * 0.03 : height * 0.06),

            /// what i love to do section
            _showWhatIDo ? const WhatIDoView() : const SizedBox(),
            SizedBox(height: Responsive.isMobile(context) ? height * 0.09 : height * 0.17),

            /// contact section
            _showContact ? ContactView() : const SizedBox(),
            SizedBox(height: height * 0.05),

            /// fotter sectino
            const FotterView(),
          ],
        ),
      ),
      floatingActionButton: _showScrollToTopButton
          ? FloatingActionButton(
        onPressed: _scrollToTop,
        backgroundColor: MyColors.flutterColor,
        child: const Icon(Icons.keyboard_double_arrow_up_sharp,color: MyColors.whiteColor,size: 32,),
      )
          : null,
    );
  }
}
