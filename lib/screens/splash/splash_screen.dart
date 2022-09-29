import 'package:flutter/material.dart';
import '../../configs/themes/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: mainGradient(),
        ),
        child: Image.asset(
          "assets/images/app_splash_logo.png",
          height: 200.0,
          width: 200.0,
        ),
      ),
    );
  }
}
