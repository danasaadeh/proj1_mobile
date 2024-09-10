import 'package:flutter/material.dart';
import 'package:tourism/pages/boarding_pages.dart';
import 'package:tourism/pages/first.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';


class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        backgroundColor: Color.fromARGB(220, 255, 240, 188),
        splash: Image.asset("lib/images/photo_2024-05-01_05-52-34.jpg"),
        splashIconSize: double.infinity,
        nextScreen:Onbording() ,
      ),
    );
  }
}