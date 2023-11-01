import 'package:flutter/material.dart';
import '../../../Utils/TextStyle.dart';

class SparePartsCardWidget extends StatefulWidget {
  const SparePartsCardWidget(
      {super.key, required this.title, required this.vlaue,required this.index, required this.color});
  final String title;
  final String vlaue;
  final int index;

  final color ;

  @override
  State<SparePartsCardWidget> createState() => _SparePartsCardWidgetState();
}

class _SparePartsCardWidgetState extends State<SparePartsCardWidget> {
 
  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Card(
            shadowColor: Colors.black,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.white,
            child: Container(
              height: 80,
              width: width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Expanded(
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.index.toString(),
                                    style: Text_Style.textStyleBold(Colors.black45, 15),
                                  ),

                                  Icon(Icons.build , color: Colors.black12,size: 70,)
                                ],
                              ),
                            ), 
                          ),
                          
                          Container(
                            
                              padding: EdgeInsets.all(2),
                              child: Center(
                                child: Text(
                                  widget.title,
                                  style: Text_Style.textStyleBold(Colors.black, 15),
                                ),
                              )
                              ),
                        ],
                      ),
                    ),
                    
                    Container(
                      height: 10,
                      decoration: BoxDecoration(
                          color: widget.color,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      width: width,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            
                          )),
                    ),
                  ]),
            )),
     SizedBox(height: 20,)
      ],
    );
  }
}
