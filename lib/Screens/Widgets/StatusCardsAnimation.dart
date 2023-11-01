import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StatusCardsAnimation extends StatefulWidget {
  const StatusCardsAnimation({super.key, required this.AnimationName});
  final String AnimationName;

  @override
  State<StatusCardsAnimation> createState() => _StatusCardsAnimationState();
}

class _StatusCardsAnimationState extends State<StatusCardsAnimation> {
  @override
  Widget build(BuildContext context) {
    return Align(
      child:Container(
        width: 200,
        child: Expanded(
          
          
          child: Lottie.asset("assets/Animations/${widget.AnimationName}.json",
              repeat: true, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
