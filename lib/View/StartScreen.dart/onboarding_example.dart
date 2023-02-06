// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:homeservice/View/SignIn.dart';
import 'package:homeservice/View/Login.dart';
import 'package:homeservice/View/SignIn/customersignin.dart';
import 'package:homeservice/View/StartScreen.dart/Welcome.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  final Color kDarkBlueColor = Color.fromARGB(255, 90, 36, 165);

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: 'Continue',
      onFinish: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => Welcome(),
          ),
        );
      },
      finishButtonColor: kDarkBlueColor,
      skipTextButton: Text(
        'Skip',
        style: TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 90, 36, 165),
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Text(
        'Login',
        style: TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 90, 36, 165),
          fontWeight: FontWeight.w600,
        ),
      ),
      trailingFunction: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => CustomerSignin(),
          ),
        );
      },
      controllerColor: Color.fromARGB(255, 90, 36, 165),
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
          'assets/dash1.png',
          height: 400,
          width: 370,
          fit: BoxFit.fitWidth,
        ),
      ],
      speed: 1.8,
      pageBodies: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
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
                'to find the perfect looking Onboarding for your app?',
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
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 440,
              ),
              Text(
                "You’ve reached your destination.",
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
                'Sliding with animation',
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
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
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
                'Where everything is possible and customize your onboarding.',
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
  



// import 'package:concentric_transition/concentric_transition.dart';
// import 'package:flutter/material.dart';
// import 'package:homeservice/View/SignIn.dart';

// class OnBoard extends StatefulWidget {
//   const OnBoard({super.key});

//   @override
//   State<OnBoard> createState() => _OnBoardState();
// }

// class _OnBoardState extends State<OnBoard> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: InkWell(
//         child: ConcentricPageView(
//           // reverse: true,
//           radius: 200,
//           colors: <Color>[Colors.white, Color(0xffa259ff), Color(0xfff9c553)],
//           itemCount: 3,
//           itemBuilder: (int index) {
//             return Center(
//               child: Container(
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 55.0),
//                       child: Image.asset('assets/dash1.png'),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       '   Welcome to\n Sajhaa Kaarya',
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//         onTap: () => Sign(),
//       ),
//     );
//     ;
//   }
// }



// import 'package:concentric_transition/concentric_transition.dart';
// import 'package:flutter/material.dart';

// final pages = [
//   const PageData(
//     icon: Icons.bubble_chart,
//     title: "Every Service to \nYour Doorstep",
//     bgColor: Color(0xFF0043D0),
//     textColor: Colors.white,
//   ),
//   const PageData(
//     icon: Icons.format_size,
//     title: "Choose your\work",
//     textColor: Colors.white,
//     bgColor: Color(0xFFFDBFDD),
//   ),
//   const PageData(
//     icon: Icons.hdr_weak,
//     title: "Book and \nEnjoy",
//     bgColor: Color(0xFFFFFFFF),
//   ),
// ];

// class OnboardingExample extends StatelessWidget {
//   const OnboardingExample({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: ConcentricPageView(
//         colors: pages.map((p) => p.bgColor).toList(),
//         radius: screenWidth * 0.8,
//         // curve: Curves.ease,
//         nextButtonBuilder: (context) => Padding(
//           padding: const EdgeInsets.only(left: 3), // visual center
//           child: Icon(
//             Icons.navigate_next,
//             size: screenWidth * 0.08,
//           ),
//         ),

//         itemBuilder: (index) {
//           final page = pages[index % pages.length];
//           return SafeArea(
//             child: _Page(page: page),
//           );
//         },
//       ),
//     );
//   }
// }

// class PageData {
//   final String? title;
//   final IconData? icon;
//   final Color bgColor;
//   final Color textColor;

//   const PageData({
//     this.title,
//     this.icon,
//     this.bgColor = Colors.white,
//     this.textColor = Colors.black,
//   });
// }

// class _Page extends StatelessWidget {
//   final PageData page;

//   const _Page({Key? key, required this.page}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     space(double p) => SizedBox(height: screenHeight * p / 100);
//     return Column(
//       children: [
//         space(2),
//         _Image(
//           page: page,
//           size: 270,
//           iconSize: 170,
//         ),
//         space(4),
//         _Text(
//           page: page,
//           style: TextStyle(
//             fontSize: screenHeight * 0.034,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _Text extends StatelessWidget {
//   const _Text({
//     Key? key,
//     required this.page,
//     this.style,
//   }) : super(key: key);

//   final PageData page;
//   final TextStyle? style;

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       page.title ?? '',
//       style: TextStyle(
//         color: page.textColor,
//         fontWeight: FontWeight.w600,
//         fontFamily: 'Helvetica',
//         letterSpacing: 0.0,
//       ).merge(style),
//       textAlign: TextAlign.center,
//     );
//   }
// }

// class _Image extends StatelessWidget {
//   const _Image({
//     Key? key,
//     required this.page,
//     required this.size,
//     required this.iconSize,
//   }) : super(key: key);

//   final PageData page;
//   final double size;
//   final double iconSize;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: size,
//       height: size,
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadius.all(Radius.circular(60.0)),
//       ),
//       child: Image.asset(
//         'assets/dash1.png',
//         height: 120,
//         width: 30,
//       ),
//     );
//   }
// }
