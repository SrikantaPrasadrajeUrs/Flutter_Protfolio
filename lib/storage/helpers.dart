import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    debugPrint("Could not open $url");
  }
}


List<Color> generateRandomColors(int seed) {
  final List<List<Color>> colorPalettes = [
    [Colors.purple, Colors.blueAccent],
    [Colors.redAccent, Colors.orangeAccent],
    [Colors.teal, Colors.cyan],
    [Colors.pinkAccent, Colors.deepPurpleAccent],
    [Colors.amber, Colors.deepOrange],
    [Colors.green, Colors.lightGreenAccent],
    [Colors.indigo, Colors.lightBlueAccent],
    [Colors.lime, Colors.yellow],
  ];

  final Random random = Random();
  return colorPalettes[random.nextInt(colorPalettes.length)];
}