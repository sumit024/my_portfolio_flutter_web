import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive(
      {super.key,
      required this.desktop,
      required this.mobile,
      required this.tablet,
      });

  final Widget desktop;
  final Widget mobile;
  final Widget? tablet;

  static bool isMobile(BuildContext context) {
    return MediaQuery.sizeOf(context).width <= 500;
  }


  static bool isTablet(BuildContext context) {
    return MediaQuery.sizeOf(context).width < 1080;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.sizeOf(context).width > 1024;
  }

  @override
  Widget build(BuildContext context) {
     if (isDesktop(context)) {
      return desktop;
    } else if (isMobile(context)) {
      return mobile;
    }  else if(tablet != null && isTablet(context)) {
      return tablet!;
    }else{
       return const SizedBox();
     }
  }
}
