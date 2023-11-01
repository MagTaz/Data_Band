
import 'package:data_band/Utils/TextStyle.dart';
import 'package:data_band/generated/l10n.dart';
import 'package:flutter/material.dart';


import '../../Utils/ColorsList.dart';


class EmployeeListRequsistsWidget extends StatefulWidget {
  const EmployeeListRequsistsWidget(this._Status);


  final _Status;
  @override
  State<EmployeeListRequsistsWidget> createState() =>
      _EmployeeListRequsistsWidgetState();
}

class _EmployeeListRequsistsWidgetState extends State<EmployeeListRequsistsWidget> {
  Color _primaryColor = Colors.blue;
  double size = 280;
  @override
  void initState() {
    getSeachResult(widget._Status?? "Pending");
    ColorsList.getPrimaryColor().then((value) {
      setState(() {
        _primaryColor = value;
      });
    });
    super.initState();
  }
  var recentList = [
        {
          "title": "The air conditioner needs to be fixed",
          "subtitle": "Room 2 had a problem with the air conditioner ", 
          "status": 'Pending'},
          
       {
          "title": "The air conditioner needs to be fixed",
          "subtitle": "Room 2 had a problem with the air conditioner ", 
          "status": 'Holding'},
          {
            "title": "The air conditioner needs to be fixed",
          "subtitle": "Room 2 had a problem with the air conditioner ", 
          "status": 'Pending'},
           {
            "title": "The air conditioner needs to be fixed",
          "subtitle": "Room 2 had a problem with the air conditioner ", 
          "status": 'Completed'},
           {
            "title": "The air conditioner needs to be fixed",
          "subtitle": "Room 2 had a problem with the air conditioner ", 
          "status": 'In progress'},
           {
            "title": "The air conditioner needs to be fixed",
          "subtitle": "Room 2 had a problem with the air conditioner ", 
          "status": 'Pending'},
           {
            "title": "The air conditioner needs to be fixed",
          "subtitle": "Room 2 had a problem with the air conditioner ", 
          "status": 'In Progress'}
          ];
          List recenSearchtList = [] ;


  @override
  Widget build(BuildContext context) {
     
    setState(() {
      switch (widget._Status) {
      case "Pending" || "قيد الانتظار":
        _primaryColor = Colors.green[700] as Color;
        break;
      case "In Progress" || "جاري العمل":
        _primaryColor = Colors.amber[900] as Color;
        break;
      case "Open" || "قيد التقدم":
        _primaryColor = Colors.yellow[800] as Color;
        break;
      case "Completed" || "مكتمل":
        _primaryColor = Colors.blue;
        break;
      case "Canceled"|| "ملغي":
        _primaryColor = Colors.red[800] as Color;
        break;
      case "Rejected" || "مرفوض":
        _primaryColor = Colors.orange[900] as Color;
        break;
      default:
    }
      
      _primaryColor;
      recenSearchtList;
      recentList;
    });
      
   
   

    
    return FutureBuilder(
      future: getSeachResult(widget._Status),
      builder: (context, snapshot) {
        return Container(
          height: size,
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.only(bottom: 10),
          child: ListView.builder(
            itemCount: recenSearchtList.length == 0 
            ? 1
            : recenSearchtList.length,
            itemBuilder: (context, index) {
              if (recenSearchtList.length == 0) {
                
                  size = 80;
                
                return Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text(S.of(context).EmployeeFilter_ThereIsNoRequests,style: Text_Style.textStyleBold(Colors.black45, 20),)),
                );}
              size = 280;
              return recrentCard(title: recenSearchtList[index]["title"], subtitle: recenSearchtList[index]["subtitle"], status: recenSearchtList[index]["status"]);
              },
          ),
        );
      }
    );
  }

  Container recrentCard({required String title, required String subtitle , required String status}) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(bottom: 10 , right: 10,left: 10,top: 10),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
        blurRadius: 12,
        spreadRadius: 2,
        color: _primaryColor.withOpacity(0.7)
        )],
          color: Colors.white,
          
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
      child:
       Stack(
        
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              child: Center(child: Text(status , style: TextStyle(color: Colors.white),)),
              decoration: BoxDecoration(
                color: _primaryColor,
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
  Future getSeachResult(String _status) async{
    recenSearchtList=[];
    for (var element in recentList) {
    if (element["status"] == _status) {
      recenSearchtList.add(element);
    }  
    }
    return recenSearchtList;

  

}

}

