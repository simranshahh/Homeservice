// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:homeservice/CustomerPanel/View/ForgetPassword.dart';
import 'package:homeservice/CustomerPanel/View/StartScreen.dart/Welcome.dart';

class Newpass extends StatefulWidget {
  const Newpass({super.key});

  @override
  State<Newpass> createState() => _NewpassState();
}

class _NewpassState extends State<Newpass> {
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
                    IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => Welcome()));
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Sign In',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Sign in to experience the best serivces\naround you',
                      style: TextStyle(
                          //fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 200, 20, 0),
              child: Card(
                child: Container(
                  height: 290,
                  width: 410,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 30, 20, 20),
                    child: Column(
                      children: [
                        FormBuilder(
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mail),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              labelText: 'New Password',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            labelText: 'Password',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 90, 36, 165),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: InkWell(
                              child: Text(
                                'Sign In',
                                style: TextStyle(color: Colors.white),
                              ),
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Newpass()));
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Color.fromARGB(255, 90, 36, 165),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ForgetPassword()));
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 508.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 2,
                        width: 100,
                        color: Color.fromARGB(255, 224, 224, 224),
                      ),
                      Text(
                        'Or Continue with',
                        style: TextStyle(
                            color: Color.fromARGB(255, 103, 102, 102)),
                      ),
                      Container(
                        height: 2,
                        width: 100,
                        color: Color.fromARGB(255, 224, 224, 224),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: Container(
                      height: 40,
                      width: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          border: Border.all(
                              color: Color.fromARGB(255, 218, 215, 215))),
                      child: Center(
                        child: Image.asset(
                          'assets/google.png',
                          height: 15,
                          width: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
