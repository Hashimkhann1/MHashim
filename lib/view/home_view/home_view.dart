import 'package:flutter/material.dart';
import 'package:myportfolio/header_view/header_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderView(),
        ],
      ),
    );
  }
}
