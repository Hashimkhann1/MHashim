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

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _showScrollToTopButton = _scrollController.offset > 300;
        if(MediaQuery.of(context).size.width < 750){
          if(_scrollController.offset > 494){
            _showProjects = true;
          }else{
            _showProjects = false;
          }
        }else{
          if(_scrollController.offset > 320){
            _showProjects = true;
          }else{
            _showProjects = false;
          }
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
    final width = MediaQuery.of(context).size.width;
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
            SizedBox(height: Responsive.isMobile(context) ? height * 0.08 : height * 0.14),

            /// about section
            Container(
              color: Colors.white,
              width: width,
                child: const AboutView()),

            /// project section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: Responsive.isMobile(context) ? 8.0 : 0),
                  child: MyTitleText(
                    title: "Projects",
                    fontSize: Responsive.isMobile(context) ? 34 : 42,
                  ),
                ),
                SizedBox(height: height * 0.02),
                _showProjects ? const ProjectsView() : const SizedBox(),
                SizedBox(height: height * 0.06),
              ],
            ),
            SizedBox(height: Responsive.isMobile(context) ? height * 0.03 : height * 0.06),

            /// what i love to do section
            const WhatIDoView(),
            SizedBox(height: Responsive.isMobile(context) ? height * 0.09 : height * 0.17),

            /// contact section
            ContactView(),
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
        child: const Icon(Icons.arrow_upward),
      )
          : null,
    );
  }
}
