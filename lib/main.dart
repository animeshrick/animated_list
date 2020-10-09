import 'package:animated_list/login_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated List',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedSplashScreen(
//          pageTransitionType: PageTransitionType.bottomToTop,
          duration: 3000,
          splash: Container(
            width: double.infinity,
            child: Text(
              "Animated List View",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            color: CupertinoColors.black,
          ),
          nextScreen: LoginUI(),
          splashTransition: SplashTransition.slideTransition,
          backgroundColor: Colors.blue),
    );
  }
}
