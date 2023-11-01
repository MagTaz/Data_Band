import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorsList {
  


  static Future<Color> getPrimaryColor () async {
    
   SharedPreferences preferences = await SharedPreferences.getInstance();
    int colorValue = preferences.getInt("themeColor") ?? Colors.amber.value ;
   return Color(colorValue);
    
  }

   static setPrimaryColor(Color color) async {
   SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setInt('themeColor', color.value);
   
  }
}