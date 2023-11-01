import 'package:data_band/Utils/TextStyle.dart';
import 'package:flutter/material.dart';

import 'Fonts.dart';

class TextFieldStyle {
  primaryTexrField(String text, Icon icon, Color color) {
    return InputDecoration(
        labelText: text,
        prefixIcon: icon,
        prefixIconColor: color,
        labelStyle: TextStyle(
            fontFamily: Fonts.PrimaryFont, fontSize: 20, color: Colors.black54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(width: 1.9, color: color.withOpacity(0.6))));
  }
  DescriptionTexrField(String text,  Color color ,) {
    return InputDecoration(
        hintText: text,
        hintStyle: Text_Style.textStyleBold(color, 17) ,border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1.9, color: color.withOpacity(0.6))));
  }

}
