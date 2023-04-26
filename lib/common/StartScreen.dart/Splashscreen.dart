// ignore_for_file: prefer_const_constructors, file_names

import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'onboarding_example.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Customer/View/BottomnavScreen/BottomNabBar.dart';
import '../../Serviceprovider/Dashboard/bottomnavbar.dart';
import '../auth/chooseSignin.dart';
import '../helper/constants.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   Timer(
  //       Duration(seconds: 5),
  //       () => Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => OnBoard())));
  // }

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
        navigator: getScreen(),
        showLoader: false,
      ),
    );
  }
}

Widget getScreen() {
  var token = getStringAsync(accessToken);
  var first = getStringAsync(firsttime);
  var roles = getStringAsync(role);

  if (token.isNotEmpty && first.isNotEmpty && roles == customer) {
    return const BottomNavScreen();
  } else if (token.isNotEmpty && first.isNotEmpty) {
    return const Bottomnavbar();
  } else if (first.isNotEmpty && token.isEmptyOrNull) {
    return const ChooseSigninPage();
  } else {
    return const OnBoard();
  }
}
