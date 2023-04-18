// ignore_for_file: avoid_print, deprecated_member_use, depend_on_referenced_packages, use_build_context_synchronously, unused_import, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:homeservice/CustomerPanel/BottomnavScreen/BottomNabBar.dart';
import 'package:homeservice/CustomerPanel/Model/Home/usermodel.dart';
import 'package:homeservice/CustomerPanel/Services/app_navigator_service.dart';
import 'package:homeservice/CustomerPanel/Services/basedio.dart';
import 'package:homeservice/CustomerPanel/View/Home/Homepage.dart';
import 'package:homeservice/CustomerPanel/config/my_config.dart';
import 'package:homeservice/Serviceprovider/Dashboard/bottomnavbar.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Services/constants.dart';
import '../../helper/constants.dart';
import '../interface/signin_interface.dart';
import 'package:http/http.dart' as http;

class UserRepository implements IUserRepository {
  @override
  Future<Logininfo?> logIn(
      String email, String password, BuildContext context) async {
    var data = {
      'email': email,
      'password': password,
    };
    print(data);
    // String a = "http://192.168.1.75:5000/api/auth/login";

    final response =
        await Api().post("${MyConfig.appUrl}/api/auth/login", data: data);

    print(response.statusCode);

    if (response.statusCode == 200) {
      var token = json.decode(response.data)['accessToken'];
      await setValue(loggedIn, "true");
      await setValue(firsttime, "false");

      await setValue(accessToken, token);

      // await Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => const Homepage(),
      //     ),
      //     (route) => false);
    }

    return null;
  }
}

Future<void> UserDetails() async {
  var usertype;

  if (usertype == 'Customer') {
    AppNavigatorService.pushNamed("bnv");
  } else if (usertype == 'Serviceprovider') {
    AppNavigatorService.pushNamed("bnb");
  } else {
    print('Invalid Login authorization');
  }
}
