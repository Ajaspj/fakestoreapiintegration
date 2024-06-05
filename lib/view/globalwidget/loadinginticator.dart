import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loadinginticator extends StatelessWidget {
  const Loadinginticator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset("assets/animations/Animation - 1713508984347.json"),
    );
  }
}
