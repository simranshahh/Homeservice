// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:homeservice/View/StartScreen.dart/onboarding_example.dart';
//import 'package:splashscreen/splashscreen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => OnBoard())));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: EasySplashScreen(
        durationInSeconds: 4,
        logo: Image.asset(
          'assets/logo.png',
          height: 600,
          width: 250,
        ),
        navigator: OnBoard(),
        showLoader: false,
      ),
    );
  }
}
