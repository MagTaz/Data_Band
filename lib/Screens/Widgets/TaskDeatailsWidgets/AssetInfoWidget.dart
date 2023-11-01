
import 'package:data_band/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';

import 'DetailsCardWidget.dart';

class AssetInfoWidget extends StatefulWidget {
  const AssetInfoWidget({super.key, required this.color});
  final Color color;
  @override
  State<AssetInfoWidget> createState() => _AssetInfoWidgetState();
}

class _AssetInfoWidgetState extends State<AssetInfoWidget> {
  @override
  Widget build(BuildContext context) {
    List _Cards = [
      DetailsCardWidget(
          title: S.of(context).TaskDetails_AssetInfo_AssetCode, vlaue: "#65",color: widget.color),
      DetailsCardWidget(
          title: S.of(context).TaskDetails_AssetInfo_AssetName, vlaue: "Meeting Room lighting",color: widget.color),
      DetailsCardWidget(
          title: S.of(context).TaskDetails_AssetInfo_AssetType, vlaue: "Light",color: widget.color),
      DetailsCardWidget(
          title: S.of(context).TaskDetails_AssetInfo_AssetGroup, vlaue: "Electrical Appliances",color: widget.color),
    ];
    
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          Container(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: 20),
              child: GridView.builder(
                itemCount: _Cards.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemBuilder: (context , index){
                  return _Cards[index];
                
              })),
          )],
            ),
          ),
          Expanded(
            child: FullScreenWidget(
              disposeLevel: DisposeLevel.Medium,
              child: Container(
                width: width,
                child: Image.network(
                  "https://www.expatriates.com/img/53784692.2.jpg",
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
