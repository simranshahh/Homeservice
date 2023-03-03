// ignore_for_file: avoid_print, deprecated_member_use, depend_on_referenced_packages, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:homeservice/CustomerPanel/Model/Home/usermodel.dart';
import 'package:homeservice/CustomerPanel/Services/basedio.dart';
import 'package:homeservice/CustomerPanel/View/Home/Homepage.dart';
import 'package:homeservice/CustomerPanel/config/my_config.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Services/constants.dart';
import '../../helper/constants.dart';
import '../interface/signin_interface.dart';

class UserRepository implements IUserRepository {
  @override
  Future<Logininfo?> logIn(String email, String password, String tenantname,
      BuildContext context) async {
    var data = {
      'tenancyName': tenantname,
      'userNameOrEmailAddress': email,
      'password': password,
    };
    try {
      final response = await Api().post(MyConfig.loginURL, data: data);

      print(response.statusCode);

      if (response.statusCode == 200) {
        var token = json.decode(response.data)['result']['accessToken'];
        await setValue(loggedIn, "true");
        await setValue(firsttime, "false");

        await setValue(accessToken, token);

        await Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const Homepage(),
            ),
            (route) => false);
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}

// saveRegisterValue(a) async {
//   final prefs = await SharedPreferences.getInstance();
//   const key = "userId";
//   final saveValue1 = a;
//   print("SaveValueRegister: $saveValue1");
//   final value = prefs.getInt(key);
//   print(value);
// }

// saveOTP(a) async {
//   final prefs = await SharedPreferences.getInstance();
//   const key = "success";
//   final saveValueOTP = a;
//   print("OTPSaveValue: $saveValueOTP");
//   prefs.setBool(key, saveValueOTP);
// }
