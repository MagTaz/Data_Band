import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginAnimation extends StatelessWidget {
  const LoginAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(itemBuilder: (context,index){
                return Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    
                        child: Lottie.asset(
                          "assets/Animations/animation_llewkw9s.json",
                          repeat: true,
                          reverse: true,
                          fit: BoxFit.fitWidth
                        ),
                  ),
                );
              });
  }
}