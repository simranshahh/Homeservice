// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unnecessary_import

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Sign extends StatefulWidget {
  const Sign({super.key});

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  googleLogin() async {
    print("googleLogin method Called");

    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      var result = await _googleSignIn.signIn();

      print(result);
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 58.0),
                child: Image.asset(
                  'assets/signin.png',
                  height: 200,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Let's You in",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                child: Container(
                  height: 50,
                  width: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/facebook.png',
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(width: 20),
                      Text('Continue with Facebook'),
                    ],
                  ),
                ),
                onTap: (() => ['']),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 5, 20, 20),
              child: InkWell(
                child: Container(
                  height: 50,
                  width: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/google.png',
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(width: 20),
                      Text('Continue with Google'),
                    ],
                  ),
                ),
                onTap: (() {
                  GoogleSignIn().signIn();
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
