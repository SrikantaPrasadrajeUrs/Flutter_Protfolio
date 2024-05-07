import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double defaultSize = 20;

LinearGradient colorGradient = const LinearGradient(
    end: Alignment.topRight,
    begin: Alignment.bottomLeft,
    colors: [
      // Color.fromRGBO(86, 117, 207, 1),
      // Color.fromRGBO(14, 168, 247, 1),
      // Color.fromRGBO(41, 149, 232, 1),
      // Color.fromRGBO(41, 149, 232, 1),
      // Color.fromRGBO(86, 117, 207, 1),
      // Color.fromRGBO(86, 117, 207, 1),
      // Color.fromRGBO(174, 51, 158, 1),
      // Color.fromRGBO(221, 18, 136, 1),
      // Color.fromRGBO(226, 15, 127, 1),
      // Color.fromRGBO(141, 82, 202, 1),
      // Color.fromRGBO(141, 82, 202, 1),
      // Color.fromRGBO(158, 73, 193, 1),
      // Color.fromRGBO(175, 64, 185, 1),
      // Color.fromRGBO(222, 38, 162, 1),
      // Color.fromRGBO(237, 30, 156, 1),
      // Colors.pink,
      // CupertinoColors.systemPink,
      // Color.fromRGBO(249, 24, 150, 1),
      // Color.fromRGBO(254, 21, 148, 1),
      Colors.blue,
      Colors.pinkAccent
    ]);

SizedBox reusableSizedBox(
    BuildContext context, double ratio, bool hieght, bool width) {
  if (hieght && width) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * ratio,
      width: MediaQuery.of(context).size.width * ratio,
    );
  } else if (hieght) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * ratio,
    );
  } else {
    return SizedBox(
      width: MediaQuery.of(context).size.width * ratio,
    );
  }
}

// Page controller for scrolling

class MovePage {
  static PageController pageController = PageController();
}

class FlutterDeveloperText extends ChangeNotifier {
  String text = "Flutter Developer";
  int i = 0;
  List<String> characters = [];
  void addText() {
    characters.add(text[i++]);
    notifyListeners();
  }

  void loop() async{
    while(true){
      await Future.delayed(const Duration(seconds: 1));
      if(characters.length==text.length){
        characters=List.from([]);
        i=0;
        notifyListeners();
        addText();
      }else{
        addText();
      }
    }
  }
}
