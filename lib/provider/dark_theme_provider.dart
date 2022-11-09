
import 'package:flutter/material.dart';

import '../services/dark_theme_prefs.dart';



class DarkThemeProvider with ChangeNotifier{
  DarkThemePref darkThemePrefs=DarkThemePref();
  bool _darkTheme=false;

  bool get getDarkTheme=>_darkTheme;

  set setDarkTheme(bool value){
    _darkTheme=value;
    darkThemePrefs.setDarkTheme(value);
    notifyListeners();

  }

}