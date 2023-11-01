import 'package:flutter/material.dart';
import '../../../Utils/TextStyle.dart';

class DetailsCardWidget extends StatefulWidget {
  const DetailsCardWidget(
      {super.key, required this.title, required this.vlaue, required this.color});
  final String title;
  final String vlaue;
  final color ;

  @override
  State<DetailsCardWidget> createState() => _DetailsCardWidgetState();
}

class _DetailsCardWidgetState extends State<DetailsCardWidget> {
 
  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        shadowColor: Colors.black,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.white,
        child: Container(
          height: 100,
          width: 150,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Spacer(),
                Container(
                  height: 70,
                    padding: EdgeInsets.all(2),
                    child: Center(
                      child: Text(
                        widget.vlaue,
                        textAlign: TextAlign.center,
                        style: Text_Style.textStyleBold(Colors.black87, 15),
                      ),
                    )
                    ),
                Spacer(),
                Container(
                  height: 33,
                  decoration: BoxDecoration(
                      color: widget.color,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  width: 200,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          widget.title,
                          style: Text_Style.textStyleBold(Colors.white, 15),
                        ),
                      )),
                )
              ]),
        ));
  }
}
