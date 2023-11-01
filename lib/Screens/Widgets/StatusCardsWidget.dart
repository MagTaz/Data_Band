import 'package:data_band/Screens/Widgets/StatusCardsAnimation.dart';
import 'package:data_band/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../Utils/TextStyle.dart';

class StatusCardsWidget extends StatefulWidget {
  const StatusCardsWidget(
      {required this.pendingNum,
      required this.progressgNum,
      required this.rejectNum,
      required this.canceledNum,
      required this.completedNum,
      required this.openNum});
  final int pendingNum;
  final int progressgNum;
  final int rejectNum;
  final int canceledNum;
  final int completedNum;
  final int openNum;
  @override
  State<StatusCardsWidget> createState() => _StatusCardsWidgetState();
}

class _StatusCardsWidgetState extends State<StatusCardsWidget> {
  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry margin = EdgeInsets.symmetric(horizontal: 10 , vertical: 20);

    List<Widget> StutusCardList = [
      Container(
        width: 130,
        height: 180,
        margin: margin,
        decoration: decorationCard(Colors.green [700] as Color),
        child: Stack(
          children: [
            Container(
              child: Opacity(
                  opacity: 0.1,
                  child: StatusCardsAnimation(AnimationName: "Pending")),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).pending,
                    style: Text_Style.textCardStyle(Colors.black.withOpacity(0.8)),
                  ),
                  SizedBox(height: 10,),
                  
                  Text(
                    "${widget.pendingNum}",
                    style: Text_Style.textCardStyle(Colors.black.withOpacity(0.8)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        width: 130,
        height: 180,
        margin: margin,
        decoration: decorationCard(Colors.amber[900] as Color),
        child: Stack(
          children: [
            Opacity(
                opacity: 0.3,
                child: StatusCardsAnimation(AnimationName: "In Progress")),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).progress,
                    style: Text_Style.textCardStyle(Colors.black.withOpacity(0.8)),
                  ),
                   SizedBox(height: 10,),
                  Text(
                    "${widget.progressgNum}",
                    style: Text_Style.textCardStyle(Colors.black.withOpacity(0.8)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        width: 130,
        height: 180,
        margin: margin,
        decoration: decorationCard(Colors.yellow[800] as Color),
        child: Stack(
          children: [
            Opacity(
                opacity: 0.08,
                child: StatusCardsAnimation(AnimationName: "open")),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).open,
                    style: Text_Style.textCardStyle(Colors.black.withOpacity(0.8)),
                  ),
                   SizedBox(height: 10,),
                  Text(
                    "${widget.openNum}",
                    style: Text_Style.textCardStyle(Colors.black.withOpacity(0.8)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        width: 130,
        height: 180,
        margin: margin,
        decoration: decorationCard(Colors.blue),
        child: Stack(
          children: [
            Opacity(opacity: 0.1,
            child: StatusCardsAnimation(AnimationName: "Complete")),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).completed,
                    style: Text_Style.textCardStyle(Colors.black.withOpacity(0.8)),
                  ),
                   SizedBox(height: 10,),
                  Text(
                    "${widget.completedNum}",
                    style: Text_Style.textCardStyle(Colors.black.withOpacity(0.8)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        width: 130,
        height: 180,
        margin: margin,
        decoration: decorationCard(Colors.red[800] as Color),
        child: Stack(
          children: [
            Opacity(
                opacity: 0.2,
                child: StatusCardsAnimation(AnimationName: "Canceled")),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).canceled,
                    style: Text_Style.textCardStyle(Colors.black.withOpacity(0.8)),
                  ),
                   SizedBox(height: 10,),
                  Text(
                    "${widget.canceledNum}",
                    style: Text_Style.textCardStyle(Colors.black.withOpacity(0.8)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        width: 130,
        height: 180,
        margin: margin,
        decoration: decorationCard(Colors.orange[900] as Color),
        child: Stack(
          children: [
            Opacity(
                opacity: 0.1,
                child: StatusCardsAnimation(AnimationName: "reject")),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).rejected,
                    style: Text_Style.textCardStyle(Colors.black.withOpacity(0.8)),
                  ),
                   SizedBox(height: 10,),
                  Text(
                    "${widget.rejectNum}",
                    style: Text_Style.textCardStyle(Colors.black.withOpacity(0.8)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    
    ];

    return Container(
      margin: EdgeInsets.only(
        top: 50,
      ),
      height: 200,
      child: Align(
        alignment: Alignment.topCenter,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: StutusCardList.length,
          itemBuilder: (context, index) {
            return StutusCardList[index];
          },
        ),
      ),
    );
  }

  decorationCard(Color color) {
    return BoxDecoration(
        gradient: LinearGradient(colors: [color ,  color.withOpacity(0.8)]),
        boxShadow: [BoxShadow(spreadRadius: 1 , blurRadius: 10 , color: Colors.black38 )],
        borderRadius: BorderRadius.all(Radius.circular(20)));
  }
}
