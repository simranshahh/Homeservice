// ignore_for_file: avoid_print, unused_local_variable, depend_on_referenced_packages, use_build_context_synchronously, prefer_const_constructors, deprecated_member_use, un'../interface/CustomerSignup_interface.dart'er_names, non_constant_identifier_names, file_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:homeservice/common/riverpod/models/SignupModel.dart';
import '../../../Dialogs.dart';
import '../../../Services/app_navigator_service.dart';
import '../../../Services/basedio.dart';
import '../../../config/my_config.dart';
import '../../interface/Signup_interface.dart';

class SignupRepository implements ISignupRepository {
  @override
  Future<Register?> serviceregister(
      String email,
      String password,
      String role,
      String cordinates,
      String phone,
      String address,
      String fullName,
      int price,
      BuildContext context) async {
    var data = {
      "email": email,
      "password": password,
      "role": role,
      "cordinates": cordinates,
      "phone": phone,
      "address": address,
      "full_name": fullName,
      "price": price
    };
    print(data);

    try {
      var response = await Api().post(MyConfig.register, data: data);

      var a = json.decode(response.toString());
      print(response.statusCode);
      if (response.statusCode == 201) {
        var responsedata = json.decode(response.data);
        print(responsedata);
        //  await setString(userId, a['email']["password"].toString());
        print(response.data);
        await showConfirmationDialog(
          context,
        );
        AppNavigatorService.pushNamedAndRemoveUntil("Signin");
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}

  // @override
  // Future<Register?> serviceregister(
  //     String email,
  //     String password,
  //     String role,
  //     String cordinates,
  //     String phone,
  //     String address,
  //     int price,
  //     String fullName,
  //     BuildContext context) async {
  //   var data = {
  //     "email": email,
  //     "password": password,
  //     "cordinates": coordinates,
  //     "phone": phone,
  //     "address": address,
  //     "full_name": fullname,
  //     "role": role,
  //     "price": price
  //   };
  //   print(data);

  //   try {
  //     var response = await Api().post(MyConfig.register, data: data);

  //     var a = json.decode(response.toString());
  //     print(response.statusCode);
  //     if (response.statusCode == 201) {
  //       var responsedata = json.decode(response.data);
  //       print(responsedata);
  //       //  await setString(userId, a['email']["password"].toString());
  //       print(response.data);
  //       AppNavigatorService.pushNamedAndRemoveUntil("Signin");
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return null;
  // }
