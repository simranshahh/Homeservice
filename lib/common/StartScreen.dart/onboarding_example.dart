// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import '../auth/chooseSignin.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  final Color kDarkBlueColor = const Color.fromARGB(255, 90, 36, 165);

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: 'Continue',
      onFinish: () {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => const ChooseSigninPage(),
          ),
        );
      },
      finishButtonColor: kDarkBlueColor,
      skipTextButton: const Text(
        'Skip',
        style: TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 90, 36, 165),
          fontWeight: FontWeight.w600,
        ),
      ),
      totalPage: 3,
      headerBackgroundColor: Colors.white,
      pageBackgroundColor: Colors.white,
      background: [
        Image.asset(
          'assets/dash1.png',
          height: 400,
          width: 370,
          fit: BoxFit.fitWidth,
        ),
        Image.asset(
          'assets/dash2.png',
          height: 400,
          width: 370,
          fit: BoxFit.fitWidth,
        ),
        Image.asset(
          'assets/dash3.png',
          height: 400,
          width: 370,
          fit: BoxFit.fitWidth,
        ),
      ],
      speed: 1.8,
      pageBodies: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const <Widget>[
              SizedBox(
                height: 450,
              ),
              Text(
                'On your way...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 90, 36, 165),
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'to find the perfect looking app for your service to doorstepssssss',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              SizedBox(
                height: 440,
              ),
              Text(
                "With better Experience & Ease",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 90, 36, 165),
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Just A click Away',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              SizedBox(
                height: 450,
              ),
              Text(
                'Start now!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 90, 36, 165),
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Where every service is found out to doorway',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
