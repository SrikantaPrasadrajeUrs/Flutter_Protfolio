import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




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

