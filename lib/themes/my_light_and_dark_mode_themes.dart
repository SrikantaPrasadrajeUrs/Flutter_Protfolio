import 'package:flutter/material.dart';

class MyThemes{
    static ThemeData MyDarkThemeData = ThemeData(
        colorScheme: const ColorScheme.dark(
            background: Colors.black,
            primary: Colors.black87,
            secondary: Colors.black45,
            tertiary: Colors.black26,

        ),
    );
    static ThemeData MylightThemeData = ThemeData(
        colorScheme: ColorScheme.light(
            background: Colors.grey.shade900,
            primary: Colors.grey.shade700,
            secondary: Colors.grey.shade400,
            tertiary: Colors.grey.shade200,
        ),
    );

}