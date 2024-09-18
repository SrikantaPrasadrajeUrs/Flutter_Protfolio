import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double height;
  final List<Color> colors;
  final double horizontalMargin;
  final double verticalMargin;
  final Alignment begin;
  final Alignment end;
  const CustomDivider({super.key, required this.height, required this.colors, required this.horizontalMargin, required this.verticalMargin, required this.begin, required this.end});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin,vertical: verticalMargin),
      height: height, // Thickness of the divider
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin:begin,
          end: end,
        ),
      ),
    );
  }
}
