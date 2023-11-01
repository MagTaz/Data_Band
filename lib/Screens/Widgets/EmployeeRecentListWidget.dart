
import 'package:flutter/material.dart';


import '../../Utils/ColorsList.dart';


class EmployeeRecentListWidget extends StatefulWidget {
  const EmployeeRecentListWidget();

  @override
  State<EmployeeRecentListWidget> createState() =>
      _EmployeeRecentListWidgetState();
}

class _EmployeeRecentListWidgetState extends State<EmployeeRecentListWidget> {
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
          subtitle: "Room 2 had a problem with the air conditioner ", status: 'Pending'),
          recrentCard(
          title: "The computer", subtitle: "The computer is not working", status: 'Open'),
      recrentCard(
          title: "Refrigerator",
          subtitle: "There are some problems with the refrigerator ", status: 'Completed'),
      recrentCard(
          title: "The computer", subtitle: "The computer is not working", status: 'Canceled'),
      recrentCard(
          title: "The computer", subtitle: "The computer is not working", status: 'Rejected'),
      recrentCard(
          title: "The computer", subtitle: "The computer is not working", status: 'Completed'),
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

  Container recrentCard({required String title, required String subtitle , required String status}) {
    Color _color = _primaryColor;
    switch (status) {
      case "Pending":
        _color = Colors.green [700] as Color;
        break;
         case "In Progress":
        _color = Colors.amber[900] as Color;
        break;
         case "Open":
        _color = Colors.yellow[800] as Color;
        break;
         case "Completed":
        _color = Colors.blue;
        break;
         case "Canceled":
        _color = Colors.red[800] as Color;
        break;
         case "Rejected":
        _color = Colors.orange[900] as Color;
        break;
      default:
    }
    return Container(
      height: 100,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        
          color: Colors.white,
          
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
      child: Stack(

        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              child: Center(child: Text(status , style: TextStyle(color: Colors.white),)),
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10))
              ),
              height: 20,
              width: 80,
              ),
          ),
          ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
          ),
        ],
      ),
    );
  }
}
