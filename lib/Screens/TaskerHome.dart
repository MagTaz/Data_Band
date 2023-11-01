import 'package:data_band/Screens/Widgets/TasksChart.dart';
import 'package:data_band/Services/changeLanguage.dart';
import 'package:data_band/Utils/ColorsList.dart';
import 'package:data_band/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../Utils/TextStyle.dart';
import 'Widgets/TasksRecentListWidget.dart';

class TaskerHome extends StatefulWidget {
  const TaskerHome({super.key});

  @override
  State<TaskerHome> createState() => _TaskerHomeState();
}

class _TaskerHomeState extends State<TaskerHome> {
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
    double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          color: _primaryColor.withOpacity(0.8),
        ),
        SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mohamed Barakat",
                      style: Text_Style.textStyleBold(Colors.white, 23),
                    ),
                    Text("test1@gmail.com",
                        style: Text_Style.textStyleBold(Colors.white60, 15))
                  ],
                ),
                Container(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.notifications,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
         Container(
          height: height,
           child: DraggableScrollableSheet(
            
              initialChildSize: 0.8, // حجم القطعة عند الظهور الأولي
              minChildSize: 0.8, // أدنى حجم للقطعة
              maxChildSize: 1, // أقصى حجم للقطعة
              builder: (BuildContext context, ScrollController scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child:  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Container(
                      
                      height: height  ,
                      width: width,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                spreadRadius: 1,
                                blurRadius: 20,
                                offset: Offset(0, -10))
                          ],
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
                         Container(
                          margin: EdgeInsets.only(top: 15),
                          width: width/10,
                          child: Divider(
                            thickness: 5,
                          ),),
                          SizedBox(height: 50,),
                        
                        TasksChart(),
                        
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(
                            thickness: 2,
                          ),),
                        SizedBox(height: 20,),
                        Text(
                          "${S.of(context).recent}:",
                          style: Text_Style.textStyleBold(Colors.black, 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TasksRecentListWidget()
                      ]),
                    ),
                  ),
               
                  )
                ;}
           ),
         )],
    );
  }
}
