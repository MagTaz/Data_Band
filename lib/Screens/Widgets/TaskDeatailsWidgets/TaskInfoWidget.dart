import 'package:data_band/Screens/Widgets/AnimationWidget.dart';
import 'package:data_band/Screens/Widgets/TaskDeatailsWidgets/DetailsCardWidget.dart';
import 'package:data_band/Utils/ColorsList.dart';
import 'package:data_band/Utils/TextStyle.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class TaskInfoWidget extends StatefulWidget {
  const TaskInfoWidget({required this.color});
final Color color;
  
  @override
  State<TaskInfoWidget> createState() => _TaskInfoWidgetState();
}

class _TaskInfoWidgetState extends State<TaskInfoWidget> {

  
  @override
  void initState() {
    ColorsList.getPrimaryColor().then((value) {
      
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List _Cards = [  DetailsCardWidget(title: S.of(context).TaskDetails_TaskInfoWidget_WorkOrder, vlaue: "#12",color: widget.color,),
              DetailsCardWidget(title: S.of(context).TaskDetails_TaskInfoWidget_TaskNumber, vlaue: "#8",color: widget.color),
              DetailsCardWidget(title: S.of(context).TaskDetails_TaskInfoWidget_WorkType, vlaue: "Emergency Maintenance",color: widget.color),
              DetailsCardWidget(title: S.of(context).TaskDetails_TaskInfoWidget_WorkingTime, vlaue: " 66",color: widget.color),
              DetailsCardWidget(title: S.of(context).TaskDetails_TaskInfoWidget_TaskDescription, vlaue: " ",color: widget.color),
              
              
              ];
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.all(5),
      child: Column(
        
        children: [
        
        Container(
          height: 100,
          margin: EdgeInsets.only(top: 10),
          child: FutureBuilder(
            future:  ColorsList.getPrimaryColor(),
            builder: (context, snapshot) {
              return Stack(
                
                children: [
                  Opacity(
                    opacity: 0.3,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 90,
                        child: AnimationWidget(AnimationName: "Date")),
                    )),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(S.of(context).TaskDetails_TaskInfoWidget_TaskDate,style: Text_Style.textStyleBold(Colors.black45, 22),)),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(width: 20,),
                    Text(S.of(context).TaskDetails_TaskInfoWidget_From , style: Text_Style.textStyleNormal(Colors.black87, 18),),
                    Text(" 20 / 5 / 2023 ", style: Text_Style.textStyleBold(widget.color, 18),),
                    
                    Spacer(),
                    
                    Text(S.of(context).TaskDetails_TaskInfoWidget_To, style: Text_Style.textStyleNormal(Colors.black87, 18),),
                    Text(" 9 / 6 / 2023 ", style: Text_Style.textStyleBold(widget.color , 18),),
                     SizedBox(width: 20,),
                
                  ],),
                )
                ],
              );
            }
          ),
        ),
        
          
          Divider(thickness: 1.5,indent:20 ,endIndent: 20,),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: 20),
              child: GridView.builder(
                itemCount: _Cards.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemBuilder: (context , index){
                  return _Cards[index];
                
              })),
          )
      ]),
    );
    
  }
}