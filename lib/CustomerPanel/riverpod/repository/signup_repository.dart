// ignore_for_file: non_constant_identifier_names, avoid_print, deprecated_member_use, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:homeservice/CustomerPanel/Services/basedio.dart';
import 'package:homeservice/CustomerPanel/View/zzzzzzzz/loginpost.dart';
import 'package:homeservice/CustomerPanel/config/my_config.dart';
import 'package:homeservice/CustomerPanel/helper/constants.dart';
import 'package:homeservice/CustomerPanel/riverpod/interface/signup_interface.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/signup_model.dart';

class SignupRepository implements ISignupRepository {
  @override
  Future<SignupClass?> Register(
      String name,
      String surname,
      String username,
      String emailAddress,
      String password,
      String phoneNumber,
      BuildContext context) async {
    var data = {
      'name': name,
      'surname': surname,
      'userName': username,
      'phoneNo': phoneNumber,
      'emailAddress': emailAddress,
      'password': password,
    };

    print('data');

    try {
      var response = await Api().post(data: data, MyConfig.registerURL);

      var a = json.decode(response.toString());
      print(response.statusCode);
      if (response.statusCode == 200) {
        var responsedata = json.decode(response.data)['result'];
        print(responsedata);
        await setString(userId, a['result']["userId"].toString());
        print(response.data);
        await Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const Login(),
            ),
            (route) => false);
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}







// import 'package:firebase_auth/firebase_auth.dart';

// class ServicemanSignup{
//   AuthRepository( required this.auth);

//   final FirebaseAuth _auth;

//   Future<User?> signInWithEmailAndPassword{
//     String? name;
//   S
//   }
// }