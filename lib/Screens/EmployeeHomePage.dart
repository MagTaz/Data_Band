import 'package:data_band/Api/ApiHandle.dart';
import 'package:data_band/Screens/AddRequest.dart';
import 'package:data_band/Screens/EmployeeHome.dart';
import 'package:data_band/Screens/EmployeeSettings.dart';
import 'package:data_band/Services/changeLanguage.dart';
import 'package:data_band/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'EmployeeFilter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EmployeeHomePage extends StatefulWidget {
  const EmployeeHomePage({super.key});

  @override
  State<EmployeeHomePage> createState() => _EmployeeHomePageState();
}

class _EmployeeHomePageState extends State<EmployeeHomePage> {
  int index = 0;
  Color _primaryColor = Colors.blue;
  bool _floatbtm = true;
  bool _isLoading = false;
  @override
  void initState() {
    ChangeLanguage.getLanguage();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.height;

    return ModalProgressHUD(
      inAsyncCall: _isLoading,
      color: Colors.white,
      opacity: 0.5,
      progressIndicator: SpinKitThreeBounce(
        color: _primaryColor,
        size: 50,
      ),
      child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterFloat,
          floatingActionButton: _floatbtm
              ? FloatingActionButton.small(
                  backgroundColor: Colors.blue[800],
                  onPressed: () async {
                             Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddRequest()),
                    );
                  },
                  child: Icon(Icons.add),
                )
              : null,
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
                onPressed: () => _floatbtm = true,
                icon: Icons.home,
                text: S.of(context).AppBar_Home,
              ),
              GButton(
                onPressed: () => _floatbtm = false,
                icon: Icons.search,
                text: S.of(context).AppBar_Search,
              ),
              GButton(
                onPressed: () => _floatbtm = false,
                icon: Icons.settings,
                text: S.of(context).AppBar_Settings,
              ),
            ],
          )),
    );
  }

  switchPages(int index) {
    List pagesList = [
      const EmployeeHome(),
      const EmployeeFilter(),
      const EmployeeSettings()
    ];
    return pagesList[index];
  }
}
