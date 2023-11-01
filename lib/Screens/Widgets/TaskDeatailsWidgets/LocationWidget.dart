import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';
import 'DetailsCardWidget.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key, required this.color});
  final Color color;

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  @override
  Widget build(BuildContext context) {
    List _Cards = [
      DetailsCardWidget(
        title: S.of(context).TaskDetails_Location_LocationZone,
        vlaue: "Riyadh",
        color: widget.color,
      ),
      DetailsCardWidget(
        title: S.of(context).TaskDetails_Location_Building,
        vlaue: "Ministry Of Human Resourrces and Social Affairs",
        color: widget.color,
      ),
      DetailsCardWidget(
        title: S.of(context).TaskDetails_Location_Floors,
        vlaue: "Ground Floor",
        color: widget.color,
      ),
      DetailsCardWidget(
        title: S.of(context).TaskDetails_Location_Units,
        vlaue: " ",
        color: widget.color,
      ),
      DetailsCardWidget(
        title: S.of(context).TaskDetails_Location_Rooms,
        vlaue: " ",
        color: widget.color,
      ),
    ];
  
    return Expanded(
      child: Container(
          padding: EdgeInsets.all(10),
          child: GridView.builder(
              itemCount: _Cards.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return _Cards[index];
              })),
    );
  }
}
