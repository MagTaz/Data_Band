import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({super.key, required this.AnimationName});
  final String AnimationName;

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> {
  @override
  Widget build(BuildContext context) {
    return Lottie.asset("assets/Animations/${widget.AnimationName}.json",
        repeat: true, fit: BoxFit.cover);
  }
}
