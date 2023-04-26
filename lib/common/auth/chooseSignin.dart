// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, avoid_print, no_leading_underscores_for_local_identifiers, file_names, unused_import

import 'package:flutter/material.dart';
import 'package:homeservice/common/auth/signin.dart';
import 'package:homeservice/Serviceprovider/ServiceProviderSignup/ServicemanSignup.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Guest/LandingPage/landingpage.dart';
import '../../Customer/Model/Home/usermodel.dart';

class ChooseSigninPage extends ConsumerStatefulWidget {
  const ChooseSigninPage({super.key});

  @override
  ChooseSigninPageState createState() => ChooseSigninPageState();
}

class ChooseSigninPageState extends ConsumerState<ChooseSigninPage> {
  late Signininfo user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 90, 36, 165),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Sign In',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Sign in to experience the best serivces\naround you',
                      style: TextStyle(
                          //fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            Form(
              // key: userKey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 200, 20, 0),
                child: Card(
                  shadowColor: Color.fromARGB(255, 90, 36, 165),
                  elevation: 5,
                  child: Container(
                    height: 350,
                    width: 410,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 90, 20, 20),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Signin()));
                            },
                            child: Container(
                              height: 50,
                              width: 250,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 90, 36, 165),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                  'Sign In as User',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LandingPage()),
                                (route) => false,
                              );
                            },
                            child: Container(
                              height: 50,
                              width: 250,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 90, 36, 165),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                  'Sign in as Guest',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
