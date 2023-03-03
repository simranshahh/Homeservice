// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print, file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import 'Customersignup.dart';

class ConfirmOTP extends ConsumerStatefulWidget {
  const ConfirmOTP({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ConfirmOTPState();
}

class _ConfirmOTPState extends ConsumerState<ConfirmOTP> {
  int secondsRemaining = 30;
  bool enableResend = false;
  Timer? timer;
  @override
  initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          builder: (BuildContext context) => CustomerSignup()));
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Confirmation',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Code has been sent!',
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
            padding: const EdgeInsets.fromLTRB(20.0, 180, 20, 0),
            child: Card(
              child: Container(
                height: 480,
                width: 410,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 108.0),
                  child: Column(
                    children: [
                      OTPTextField(
                        length: 4,
                        width: MediaQuery.of(context).size.width,
                        fieldWidth: 40,
                        style: TextStyle(fontSize: 17),
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldStyle: FieldStyle.underline,
                        onCompleted: (pin) {
                          print("Completed: " + pin);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Center(
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: enableResend ? _resendCode : null,
                                child: Text('Resend Code'),
                              ),
                              Text(
                                'after $secondsRemaining seconds',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _resendCode() {
    //other code here
    setState(() {
      secondsRemaining = 30;
      enableResend = false;
    });
  }

  @override
  dispose() {
    timer!.cancel();
    super.dispose();
  }
}
