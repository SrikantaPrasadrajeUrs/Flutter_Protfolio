import 'package:flutter/cupertino.dart';

class Responsive extends StatelessWidget{
  final Widget Desktop;
  final Widget Mobile;
  final Widget Tablet;
  final Widget LargeMobile;
  const Responsive({
    required this.Desktop,required this.Mobile,required this.Tablet,required this.LargeMobile
  });
  @override
  Widget build(BuildContext context){
    Size size=MediaQuery.of(context).size;
     if(Responsive.isMobile(context)) return Mobile;
    if(Responsive.isLargeMobile(context)) return LargeMobile;
    else{
      return Desktop;
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
