import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes{
    static ThemeData myDarkThemeData = ThemeData(
        colorScheme: const ColorScheme.dark(
            surface: Colors.black,
            primary: Colors.black87,
            secondary: Colors.black45,
            tertiary: Colors.black26,

        ),
    );
    static ThemeData myLightThemeData = ThemeData(
        textTheme: TextTheme(
            titleSmall: GoogleFonts.roboto(fontSize: 15, color: Colors.white),
            titleMedium:  GoogleFonts.roboto(fontSize: 18, color: Colors.white),
            bodySmall: GoogleFonts.roboto(fontSize: 16, color: Colors.white),
            bodyMedium: GoogleFonts.ubuntu(fontSize: 20, color: Colors.white),
            bodyLarge: GoogleFonts.spaceGrotesk(fontSize: 24, color: Colors.white),
            displayMedium: GoogleFonts.openSans(fontSize: 20, color: Colors.white),
            headlineMedium: GoogleFonts.openSansCondensed(fontSize: 17,letterSpacing:1.5,color:Colors.grey.shade700),
        ),
        iconTheme: const IconThemeData(
            color: Colors.white70,
            size: 22,
        ),
        colorScheme: ColorScheme.light(
            surface: Colors.grey.shade900,
            primary: Colors.grey.shade800,
            secondary: Colors.grey.shade400,
            onTertiary: Colors.grey.shade300,
            outline: Colors.grey.shade100,
            tertiary: Colors.grey.shade200,
        ),
    );

}