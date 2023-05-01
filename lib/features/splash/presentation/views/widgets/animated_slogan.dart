import 'package:flutter/material.dart';

class AnimatedSlogan extends StatelessWidget {
  final Animation<Offset> slidingAnimation;
  const AnimatedSlogan({super.key, required this.slidingAnimation});

  @override
  Widget build(BuildContext context) {
    //? To rebuild this widget only and no need to use setstate
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: const Text(
            "Read free books",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        );
      },
    );
  }
}
