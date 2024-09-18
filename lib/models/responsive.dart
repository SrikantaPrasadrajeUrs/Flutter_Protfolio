import 'package:flutter/material.dart';

class Responsive extends StatelessWidget{
  final Widget desktop;
  final Widget mobile;
  final Widget tablet;
  final Widget largeMobile;
  const Responsive({super.key,
    required this.desktop,required this.mobile,required this.tablet,required this.largeMobile
  });
  @override
  Widget build(BuildContext context){
     if(Responsive.isMobile(context)) {
       return mobile;
     }
    if(Responsive.isLargeMobile(context)) {
      return largeMobile;
    } else {
      return desktop;
    }

  }
  // for checking  mobile
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 740;
  }

  // for check large mobile
  static bool isLargeMobile(BuildContext context) {
    return MediaQuery.of(context).size.width >= 740;
  }

  //for tablet
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 601 &&
        MediaQuery.of(context).size.height <= 1024;
  }

  //for desktop
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1024 &&
        MediaQuery.of(context).size.height >= 768;
  }
}
