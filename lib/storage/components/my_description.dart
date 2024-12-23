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
  // String text = "Flutter Developer";
  // List<String> dispString = [];
  // int iterations = 16;
  // int i = 0;

  // Stream addText() async* {
  //   while (i <= 16) {
  //     await Future.delayed(const Duration(milliseconds: 580));
  //     yield text[i++];
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        // name - animation - typing
        // ShaderMask(
        //     child: Text(
        //       "Srikantaprasadraje Urs",
        //       style: GoogleFonts.teko(color: Colors.white).copyWith(
        //           fontSize: size.width <= 370 ? 40 : 50,
        //           fontWeight: FontWeight.bold,
        //           letterSpacing: 1),
        //     ),
        //     shaderCallback: (bounds) {
        //       return const LinearGradient(
        //           end: Alignment.topRight,
        //           begin: Alignment.bottomLeft,
        //           colors: [Colors.blue, Colors.pink]).createShader(bounds);
        //     }),
        AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(name,
                textStyle: GoogleFonts.teko(color: Colors.white).copyWith(
                    fontSize: size.width <= 370 ? 40 : 50,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
                colors: [Colors.blue, Colors.pink]),
            ColorizeAnimatedText(name,
                textStyle: GoogleFonts.teko(color: Colors.white).copyWith(
                    fontSize: size.width <= 370 ? 40 : 50,
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
        // Text(
        //   chars.join(),
        //   style: GoogleFonts.spaceGrotesk(color: Colors.white).copyWith(
        //       fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 1),
        // ),
        // short description
        reusableSizedBox(context, .02, true, false),
        Text(
          'Crafting Solutions Where Code Meets Curiosity',
          style: TextStyle(
              fontSize: size.width <= 440 ? 13 : 20, color: Colors.white70),
        ),
        // Text(
        //   ' Flutter, Backend, and Infinite Learning.',
        //   style: TextStyle(
        //       fontSize: size.width <= 370 ? 15 : 20, color: Colors.white70),
        // ),
        reusableSizedBox(context, .02, true, false),
        // StreamBuilder(
        //     stream: addText(),
        //     builder: (context, add) {
        //       if(add.hasData&&add.data.toString()=='r') {
        //         isR++;
        //       }
        //       if(add.hasData&&isR<=2) {
        //         dispString.add(add.data.toString());
        //       }
        //       return Text(dispString.join(),style: mWTS.copyWith(fontWeight: FontWeight.bold,fontSize: 25),);
        //     }
        //     )
        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Flutter Developer',
              textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
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
