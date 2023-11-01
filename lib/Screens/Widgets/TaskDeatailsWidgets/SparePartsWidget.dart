import 'package:data_band/Screens/Widgets/TaskDeatailsWidgets/sparPartsCardWidget.dart';
import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';


class SparePartsWidget extends StatefulWidget {
  const SparePartsWidget({super.key,  required this.color});
  final Color color;
  @override
  State<SparePartsWidget> createState() => _SparePartsWidgetState();
}

class _SparePartsWidgetState extends State<SparePartsWidget> {
  
  
  
  

  @override
  Widget build(BuildContext context) {
     List _Cards = [
      SparePartsCardWidget(
          title: S.of(context).TaskDetails_Description_Classify, vlaue: "dasfasd ", index: 1, color: widget.color,),
      SparePartsCardWidget(
          title: S.of(context).TaskDetails_Description_Summary, vlaue: " ", index: 2, color: widget.color,),
          SparePartsCardWidget(
          title: S.of(context).TaskDetails_Description_ProblemDescription, vlaue: " ",index: 3, color: widget.color,),
          SparePartsCardWidget(
          title: S.of(context).TaskDetails_Description_Description, vlaue: " ",index: 4, color: widget.color,),
          SparePartsCardWidget(
          title: S.of(context).TaskDetails_Description_Attachments, vlaue: " ",index: 5, color: widget.color,),
      ];

    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          
                itemCount: _Cards.length,
               
                 itemBuilder: (context , index){
                  return _Cards[index];
              })),
          
      
    );
  }
}