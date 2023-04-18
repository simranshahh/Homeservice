// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, unused_import

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homeservice/CustomerPanel/View/OTP.dart';
import 'package:homeservice/CustomerPanel/View/SignIn.dart';
import 'package:homeservice/CustomerPanel/View/SignIn/customersignin.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  int secondsRemaining = 30;
  bool enableResend = false;
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                child: Icon(Icons.arrow_back_ios),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => Sign()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 42.0, bottom: 20, left: 80),
              child: Text(
                'Forget your password?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48.0),
              child: Text(
                'Please enter the Email address associated\nwith your account and we will send you the\ninstructions to reset your password!',
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 122, 122, 123),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 48.0, bottom: 38),
                child: Image.asset(
                  'assets/luck.png',
                  height: 180,
                  width: 170,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 8, 15, 20),
              child: SizedBox(
                height: 45,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    labelText: 'Email',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 98.0, bottom: 30),
              child: Row(
                children: [
                  Text(
                    'Remember Password?',
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                  InkWell(
                    child: Text(
                      ' Login',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                    // onTap: () {
                    //   Navigator.of(context).pushReplacement(MaterialPageRoute(
                    //       builder: (BuildContext context) => CustomerSignin()));
                    //},
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48.0),
              child: InkWell(
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color.fromARGB(255, 90, 36, 165),
                  ),
                  child: Center(
                    child: Text(
                      'Send',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => OTP()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
