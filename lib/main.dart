import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:weather_now/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Now',
      home: AnimatedSplashScreen(
        nextScreen: HomePage(),
        splash: 'assets/splash_screen/earth.gif',
        duration: 2500,
        backgroundColor: Colors.black,
        splashIconSize: 500.0,
      ),
    );
  }
}
