import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';
import 'DetailsCardWidget.dart';

class TaskDescriptionWidget extends StatefulWidget {
  const TaskDescriptionWidget({super.key,  required this.color});
  final Color color;
  @override
  State<TaskDescriptionWidget> createState() => _TaskDescriptionWidgetState();
}

class _TaskDescriptionWidgetState extends State<TaskDescriptionWidget> {
  
  
  
  

  @override
  Widget build(BuildContext context) {
     List _Cards = [
      DetailsCardWidget(
          title: S.of(context).TaskDetails_Description_Classify, vlaue: " ", color: widget.color,),
      DetailsCardWidget(
          title: S.of(context).TaskDetails_Description_Summary, vlaue: " ", color: widget.color,),
          DetailsCardWidget(
          title: S.of(context).TaskDetails_Description_ProblemDescription, vlaue: " ", color: widget.color,),
          DetailsCardWidget(
          title: S.of(context).TaskDetails_Description_Description, vlaue: " ", color: widget.color,),
          DetailsCardWidget(
          title: S.of(context).TaskDetails_Description_Attachments, vlaue: " ", color: widget.color,),
      ];

    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
                itemCount: _Cards.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemBuilder: (context , index){
                  return _Cards[index];
              })),
          
      
    );
  }
}