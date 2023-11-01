import 'package:flutter/material.dart';

import 'Fonts.dart';

class Text_Style
{
  static TextStyle textBoldStyle = TextStyle(fontFamily: Fonts.PrimaryBoldFont,fontSize: 20 ,);
  static TextStyle textStyle = TextStyle(fontFamily: Fonts.PrimaryFont,fontSize: 16 ,);
  
 static textCardStyle(Color color){
    return TextStyle(
      
      fontFamily: Fonts.PrimaryBoldFont,fontSize: 21 , color: color);
  }
  static textStyleBold(Color color , double size){
    return TextStyle(fontFamily: Fonts.PrimaryBoldFont,fontSize: size , color: color);
  }
  static textStyleNormal(Color color , double size){
    return TextStyle(fontFamily: Fonts.PrimaryFont,fontSize: size , color: color);
  }

}