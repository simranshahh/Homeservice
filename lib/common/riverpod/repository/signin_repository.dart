// ignore_for_file: avoid_print, deprecated_member_use, depend_on_referenced_packages, use_build_context_synchronously, unused_import, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:homeservice/Customer/View/BottomnavScreen/BottomNabBar.dart';
import 'package:homeservice/Customer/Model/Home/usermodel.dart';
import 'package:homeservice/common/Services/app_navigator_service.dart';
import 'package:homeservice/common/Services/basedio.dart';
import 'package:homeservice/Customer/View/Home/Homepage.dart';
import 'package:homeservice/Serviceprovider/Dashboard/bottomnavbar.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../Services/constants.dart';
import '../../config/my_config.dart';
import '../../helper/constants.dart';
import '../interface/signin_interface.dart';
import 'package:http/http.dart' as http;

class UserRepository implements IUserRepository {
  @override
  Future<Signininfo?> signin(
      String email, String password, BuildContext context) async {
    var data = {
      'email': email,
      'password': password,
    };
    print(data);

    final response = await Api().post(MyConfig.signin, data: data);
    print(response.data);

    print(response.statusCode);

    if (response.statusCode == 200) {
      var token = json.decode(response.data)['accessToken'];
      var usertype = json.decode(response.data)['user']['role'];
      print(usertype);
      await setValue(loggedIn, "true");
      await setValue(firsttime, "false");

      await setValue(accessToken, token);
      await setValue(role, usertype);
      var roles = getStringAsync(role);
      print(roles);

      if (usertype == '6446bbdf67f4eacfe7487195') {
        AppNavigatorService.pushNamed("bnv");
      } else {
        AppNavigatorService.pushNamed("bnb");
      }
      //else if (usertype == 'users') {
      //   AppNavigatorService.pushNamed("bnv");
      // } else {
      //   Fluttertoast.showToast(msg: 'Invalid Signin authorization');
      //   print('Invalid Signin authorization');
      // }
    }

    return null;
  }
}
