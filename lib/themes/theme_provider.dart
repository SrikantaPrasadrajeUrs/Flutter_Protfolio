import 'package:flutter/material.dart';
import 'package:srikanta_protfolio/themes/my_light_and_dark_mode_themes.dart';
class ThemeProvider extends ChangeNotifier{
 static ThemeData themeData=MyThemes.MylightThemeData;
 bool toggle=true;
}
