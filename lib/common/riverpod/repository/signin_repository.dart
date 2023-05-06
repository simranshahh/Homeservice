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
import '../../Dialogs.dart';
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
      bool jsonResponse = jsonDecode(response.data)["user"]['verified'];
      print(jsonResponse);
      var token = json.decode(response.data)['accessToken'];
      var reftoken = json.decode(response.data)["user"]['refreshTokens'];
      var usertype = json.decode(response.data)['user']['role'];
      var id = json.decode(response.data)['user']['_id'];
      var address = json.decode(response.data)['user']["address"];
      await setValue(role, usertype);
      var roles = getStringAsync(role);

      print(roles);
      if (jsonResponse == false &&
          (roles == '6446bbdf67f4eacfe7487195' || roles == 'customer')) {
        // var p = json.decode(response.data)['user']["price"];
        // print(p);

        print(usertype);
        await setValue(loggedIn, "true");
        await setValue(firsttime, "false");

        await setValue(accessToken, token);
        await setValue(refreshToken, reftoken);
        await setValue(userId, id);
        await setValue(userAddress, address);
        // await setValue(cprice, p);

        await showLoginDialog(
          context,
        );

        if (roles == 'customer') {
          AppNavigatorService.pushNamedAndRemoveUntil("bnv");
        } else if (roles == '6446bbdf67f4eacfe7487195') {
          AppNavigatorService.pushNamedAndRemoveUntil("bnv");
        } else {
          AppNavigatorService.pushNamedAndRemoveUntil("bnb");
        }
      } else if (jsonResponse == true) {
        print(usertype);
        await setValue(loggedIn, "true");
        await setValue(firsttime, "false");

        await setValue(accessToken, token);
        await setValue(refreshToken, reftoken);
        await setValue(userId, id);
        await setValue(userAddress, address);
        // await setValue(cprice, p);

        await showLoginDialog(
          context,
        );

        if (roles == 'customer') {
          AppNavigatorService.pushNamedAndRemoveUntil("bnv");
        } else if (roles == '6446bbdf67f4eacfe7487195') {
          AppNavigatorService.pushNamedAndRemoveUntil("bnv");
        } else {
          AppNavigatorService.pushNamedAndRemoveUntil("bnb");
        }
      } else {
        Fluttertoast.showToast(msg: 'User is not Verified');
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

  @override
  Future logout() async {
    try {
      var response = await Api().get(MyConfig.logout);

      print(response.statusCode);
      if (response.statusCode == 200) {
        await setValue(accessToken, "");
        await setValue(refreshToken, "");
        AppNavigatorService.pushNamedAndRemoveUntil("Signin");
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
