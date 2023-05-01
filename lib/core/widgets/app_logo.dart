import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 80,
      child: Text(
        "BOOKILO",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "Controwell",
          fontSize: 80,
        ),
      ),
    );
  }
}
