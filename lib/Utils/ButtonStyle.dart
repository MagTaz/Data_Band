import 'package:flutter/material.dart';

class Button_Style {
  static buttonStyle(BuildContext context, Color color , double shadow) {
    return ElevatedButton.styleFrom(
      elevation: shadow,
      fixedSize: Size(MediaQuery.of(context).size.width, 50),
      backgroundColor: color,
      shape: RoundedRectangleBorder(
          
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))),
    );
  }
 static addRequestBtmStyle(BuildContext context, Color color , double shadow) {
    return ElevatedButton.styleFrom(
      elevation: shadow,
      fixedSize: Size(MediaQuery.of(context).size.width, 50),
      backgroundColor: color,
      side: BorderSide(
        width: 3,
        color: Colors.black
      ),
      shape: RoundedRectangleBorder(
          
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))),
    );
  }

}

