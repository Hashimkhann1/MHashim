import 'package:flutter/material.dart';

class Responsive {
  /// for mobile
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 750;

  /// for tablet
  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width < 1100 && MediaQuery.of(context).size.width >= 760;

  /// for desktop
  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1100;
}