import 'package:data_band/Services/changeLanguage.dart';
import 'package:data_band/Utils/ColorsList.dart';
import 'package:data_band/Screens/Widgets/EmployeeRecentListWidget.dart';
import 'package:data_band/Screens/Widgets/StatusCardsWidget.dart';
import 'package:data_band/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../Utils/TextStyle.dart';

class EmployeeHome extends StatefulWidget {
  const EmployeeHome({super.key});

  @override
  State<EmployeeHome> createState() => _EmployeeHomeState();
}

class _EmployeeHomeState extends State<EmployeeHome> {
  Color _primaryColor = Colors.blue;
  @override
  void initState() {
    ChangeLanguage.getLanguage();
    ColorsList.getPrimaryColor().then((value) {
      setState(() {
        _primaryColor = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _primaryColor;
    });
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          color: _primaryColor.withOpacity(0.8),
        ),
       const StatusCardsWidget(
          pendingNum: 10,
          progressgNum: 5,
          rejectNum: 1,
          canceledNum: 0,
          completedNum: 4,
          openNum: 3,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.all(20),
            height: (height * 5 / 8 + 5),
            width: width,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0, -5),
                      spreadRadius: 1,
                      blurRadius: 20)
                ],
                color: _primaryColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.all(20),
            height: (height * 5 / 8),
            width: width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      _primaryColor,
                      Colors.white70,
                    ]),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            child: Column(children: [
              Text(
                "${S.of(context).recent}:",
                style: Text_Style.textBoldStyle,
              ),
              SizedBox(
                height: 10,
              ),
              EmployeeRecentListWidget()
            ]),
          ),
        )
      ],
    );
  }
}
