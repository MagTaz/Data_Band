import 'package:data_band/Utils/TextStyle.dart';
import 'package:data_band/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../Utils/ColorsList.dart';

class TasksRecentListWidget extends StatefulWidget {
  const TasksRecentListWidget();

  @override
  State<TasksRecentListWidget> createState() => _TasksRecentListWidgetState();
}

class _TasksRecentListWidgetState extends State<TasksRecentListWidget> {
  Color _primaryColor = Colors.blue;
  @override
  void initState() {
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
    List<Widget> recentList = [
      recrentCard(
          title: "The air conditioner needs to be fixed",
          subtitle: "Room 2 had a problem with the air conditioner ",
          status: S.of(context).pending),
      recrentCard(
          title: "The computer",
          subtitle: "The computer is not working",
          status: S.of(context).open),
      recrentCard(
          title: "Refrigerator",
          subtitle: "There are some problems with the refrigerator ",
          status: S.of(context).completed),
      recrentCard(
          title: "The computer",
          subtitle: "The computer is not working",
          status: S.of(context).canceled),
      recrentCard(
          title: "The computer",
          subtitle: "The computer is not working",
          status: S.of(context).rejected),
      recrentCard(
          title: "The computer",
          subtitle: "The computer is not working",
          status: S.of(context).progress),
    ];

    setState(() {
      recentList;
    });
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: recentList.length,
          itemBuilder: (context, index) {
            return recentList[index];
          },
        ),
      ),
    );
  }

  Container recrentCard(
      {required String title,
      required String subtitle,
      required String status}) {
    Color _color = _primaryColor;
    switch (status) {
      case "Pending" || "قيد الانتظار":
        _color = Colors.green[700] as Color;
        break;
      case "In Progress" || "جاري العمل":
        _color = Colors.amber[900] as Color;
        break;
      case "Open" || "قيد التقدم":
        _color = Colors.yellow[800] as Color;
        break;
      case "Completed" || "مكتمل":
        _color = Colors.blue;
        break;
      case "Canceled"|| "ملغي":
        _color = Colors.red[800] as Color;
        break;
      case "Rejected" || "مرفوض":
        _color = Colors.orange[900] as Color;
        break;
      default:
    }
    return Container(
      height: 150,
      margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: _color, spreadRadius: 1, blurRadius: 10)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomLeft: Radius.circular(20))),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/TaskDetails',
            arguments: {
              'title': title,
              'subtitle': subtitle,
              'color': _color,
              'status': status
            },
          );
        },
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                child: Center(
                    child: Text(
                  status,
                  style: TextStyle(color: Colors.white),
                )),
                decoration: BoxDecoration(
                    color: _color,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(10))),
                height: 20,
                width: 80,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    margin: EdgeInsets.all(5),
                    child: IconButton(
                      icon: Icon(
                        Icons.info,
                        color: _color,
                      ),
                      onPressed: () {},
                    )),
              ],
            ),
            ListTile(
              title: Text(
                title,
                style: Text_Style.textStyleBold(Colors.black, 16),
              ),
              subtitle: Text(subtitle),
            ),
          ],
        ),
      ),
    );
  }
}
