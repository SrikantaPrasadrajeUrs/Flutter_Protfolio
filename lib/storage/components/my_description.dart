import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../constants.dart';
import '../constants/my_enums.dart';

class MyDescription extends StatefulWidget {
  const MyDescription({super.key});

  @override
  State<MyDescription> createState() => _MyDescriptionState();
}

class _MyDescriptionState extends State<MyDescription> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isLessThan500 = size.width<=501;
    print(size.width);
    return Column(
      children: [
        AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(name,
                textStyle: GoogleFonts.teko(color: Colors.white).copyWith(
                    fontSize: isLessThan500 ? 40 : 50,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
                colors: [Colors.blue, Colors.pink]),
            ColorizeAnimatedText(name,
                textStyle: GoogleFonts.teko(color: Colors.white).copyWith(
                    fontSize: isLessThan500 ? 40 : 50,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
                colors: [
                  Colors.pink,
                  Colors.blue,
                ]),
          ],
          repeatForever: true,
          // pause: Duration(seconds: 5),
        ),
        reusableSizedBox(context, .02, true, false),
        Text(
          'Crafting Solutions Where Code Meets Curiosity',
          style: TextStyle(
              fontSize: isLessThan500 ? 18 : 20, color: Colors.white70),
        ),
        reusableSizedBox(context, .02, true, false),
        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Flutter Developer',
              textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold,fontSize: isLessThan500?21:28),
              speed: const Duration(milliseconds: 700),
            ),
          ],
          totalRepeatCount: 1,
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
        )
      ],
    );
  }
}
