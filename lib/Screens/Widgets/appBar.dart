import 'package:data_band/Utils/ColorsList.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key, required this.color});
  final Color color;
  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  int index = 0;
  bool _floatbtm = true;
  Color _primaryColor = Colors.blue;
  @override
  void initState() {
   ColorsList.getPrimaryColor().then((value) {
    _primaryColor = value;
   } );
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.height;

  setState(() {
      ColorsList.getPrimaryColor().then((value) {
    _primaryColor = value;
   } );
  });


    return  GNav(
          onTabChange: (value) {
            setState(() {
              index = value;
              
              
            });
          },
          gap: 8,
          iconSize: 25,
          activeColor: _primaryColor,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: width / 28),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          backgroundColor: Colors.transparent,
          tabs: [
            GButton(
              onPressed:()=> _floatbtm = true,
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              onPressed:()=> _floatbtm = false,
              icon: Icons.search,
              text: "Search",),
            GButton(
              onPressed:()=> _floatbtm = false,
              icon: Icons.settings,
              text: "Settings",
            ),
          ],
        );
  
  }
}