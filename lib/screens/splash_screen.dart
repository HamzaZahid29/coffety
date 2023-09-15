import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:coffety/screens/home.dart';

class splash_screen extends StatelessWidget {
  static String screenkey = 'splashid';
  const splash_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash: Image.asset('assets/splash.png'), nextScreen: home(),splashIconSize: 180,
    splashTransition: SplashTransition.fadeTransition,
    );
  }
}
