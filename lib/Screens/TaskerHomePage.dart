
import 'package:data_band/Services/changeLanguage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../generated/l10n.dart';
import 'TaskerFilter.dart';
import 'TaskerHome.dart';
import 'TaskerSettings.dart';


class TaskerHomePage extends StatefulWidget {
  const TaskerHomePage({super.key});

  @override
  State<TaskerHomePage> createState() => _TaskerHomePageState();
}

class _TaskerHomePageState extends State<TaskerHomePage> {
  int index = 0;
  
  
  @override
  void initState() {
    ChangeLanguage.getLanguage();
   

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    double width = MediaQuery.of(context).size.height;

    return Scaffold(
       
        body: switchPages(index),
        bottomNavigationBar: GNav(
          onTabChange: (value) {
            setState(() {
              index = value;
              
              
            });
          },
          gap: 8,
          iconSize: 25,
          activeColor: Colors.blue[800],
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: width / 28),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          backgroundColor: Colors.transparent,
          tabs: [
            GButton(
             
              icon: Icons.home,
              text: S.of(context).AppBar_Home,
            ),
            GButton(
             
              icon: Icons.search,
              text: S.of(context).AppBar_Search,)
              ,
              
            GButton(
              
              icon: Icons.settings,
              text: S.of(context).AppBar_Settings,
            ),
          ],
        ));
  }

  switchPages(int index) {
    List pagesList = [
      const TaskerHome(),
      const TaskerFilter(),
      const TaskerSettings()
    ];
    return pagesList[index];
  }
}
