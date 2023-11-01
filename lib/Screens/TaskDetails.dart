import 'package:data_band/Screens/Widgets/TaskDeatailsWidgets/LocationWidget.dart';
import 'package:data_band/Screens/Widgets/TaskDeatailsWidgets/SparePartsWidget.dart';
import 'package:data_band/Screens/Widgets/TaskDeatailsWidgets/TaskInfoWidget.dart';
import 'package:data_band/Utils/ColorsList.dart';
import 'package:data_band/Utils/TextStyle.dart';
import 'package:data_band/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'Widgets/TaskDeatailsWidgets/AssetInfoWidget.dart';
import 'Widgets/TaskDeatailsWidgets/TaskDescriptionWidget.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails({super.key});

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
     late Color _btm1 = _primColor ;
     Color _btm2 = Colors.black87;
     Color _btm3 = Colors.black87;
     Color _btm4 = Colors.black87;
     Color _btm5 = Colors.black87;
     Color _btm6 = Colors.black87;
     bool _isChanged = false;
     Color _primColor = Colors.blue;

     @override
  void initState() {
    ColorsList.getPrimaryColor().then((value) {
      setState(() {
        _primColor = value;
      });
    });
    
    
    super.initState();
  }

    
 
  @override
  Widget build(BuildContext context) {
    
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double fontsize = 12;
    double iconsSize = 22;

    
    Color _subColor = Colors.black87;
    

    
    
    var _Pages = [
                          TaskInfoWidget(color: args['color'],),
                          AssetInfoWidget(color: args['color'],),
                          TaskDescriptionWidget(color: args['color'],),
                          LocationWidget(color: args['color'],),
                          SparePartsWidget(color: args['color'])

                          ];
    return Scaffold(
      body: Container(
        color: args['color'],
        child: Stack(children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                margin: EdgeInsets.only(top: 50),
                child: Text(
                  args['status'],
                  style: Text_Style.textStyleBold(Colors.white60, 40),
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: height * 4/5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  color: Colors.white),
              child: Container(
                color: Colors.black12.withOpacity(0.05),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.info , color: _isChanged ? _btm1 :_primColor,size: iconsSize,),
                              SizedBox(height: 5,),
                              Text(S.of(context).TaskDetails_TaskInfo,style: Text_Style.textStyleBold(_isChanged ? _btm1 :_primColor, fontsize),)
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.home_filled, color: _btm2,size: iconsSize,),
                              SizedBox(height: 5,),
                              Text(S.of(context).TaskDetails_AssetInfo,style: Text_Style.textStyleBold(_btm2, fontsize),)
                            
                            ],
                          ),
                          Column(
                            children: [
                                Icon(Icons.library_books, color: _btm3,size: iconsSize,),
                              SizedBox(height: 5,),
                              Text(S.of(context).TaskDetails_Description,style: Text_Style.textStyleBold(_btm3, fontsize),)
                            
                            ],
                          ),
                          
                          
                          
                          Column(
                            children: [
                               Icon(Icons.location_on ,color: _btm4,size: iconsSize,),
                              SizedBox(height: 5,),
                              Text(S.of(context).TaskDetails_Location,style: Text_Style.textStyleBold(_btm4, fontsize),)
                            
                            ],
                          ),
                          Column(
                            children: [
                               Icon(Icons.build ,color: _btm5,size: iconsSize,),
                              SizedBox(height: 5,),
                              Text(S.of(context).TaskDetails_SpareParts,style: Text_Style.textStyleBold(_btm5, fontsize),)
                            
                            ],
                          ),
                         
                         
                        
                         
                          ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Divider(thickness: 2,)),
                      Expanded(
                        child: PageView(
                          
                          children: _Pages,
                          onPageChanged: (Index){
                            switch (Index) {
      case 0:
        setState(() {
          _btm1 = _primColor;
          _btm2 = _subColor;
          
        });
        break;
      case 1:
        setState(() {
          
          _btm1 = _subColor;
          _btm2 = _primColor;
          _btm3 = _subColor;
          _isChanged =true;
         
        });
        break;
      case 2:
        setState(() {
           _btm2 = _subColor;
          _btm3 = _primColor;
          _btm4 = _subColor;
        });
        break;
      case 3:
       setState(() {
          _btm3 = _subColor;
          _btm4 = _primColor;
          _btm5 = _subColor;
        });
        break;
      case 4:
        setState(() {
          _btm4 = _subColor;
          _btm5 = _primColor;
          _btm6 = _subColor;
          
        });
        break;
     
        
      default:
    }
                          },
                        ),
                      ),
                    ],
                  )),
            ),
          )
        ]),
      ),
    );
    
  }
}
