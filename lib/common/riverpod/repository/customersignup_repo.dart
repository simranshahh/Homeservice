// ignore_for_file: avoid_print, unused_local_variable, depend_on_referenced_packages, use_build_context_synchronously, prefer_const_constructors, deprecated_member_use, un'../interface/CustomerSignup_interface.dart'er_names, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import '../../Services/app_navigator_service.dart';
import '../../Services/basedio.dart';
import '../../config/my_config.dart';
import '../interface/customer_signup.dart';
import '../models/customer_signup.dart';
import '../models/customerprofile.dart';

class CustomerSignupRepository implements ICustomerSignupRepository {
  @override
  Future<CustomerRegister?> customerregister(
    // String email,
    // String password,
    // String cordinates,
    // String phone,
    // String address,
    // String fullName,
    // String role,
    BuildContext context,
  ) async {
    var data = {
      "email": "p@gmail.com",
      "password": "S@ndhya12345",
      "cordinates": "26.6660761,87.2708559",
      "phone": 76692789273,
      "address": "itaharui",
      "full_name": "67758",
      "role": "6446b631df4fb8661ce20a80"
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
        AppNavigatorService.pushNamedAndRemoveUntil("Signin");
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  @override
  Future<CInfo?> customerinfo() async {
    try {
      var response = await Api().get(MyConfig.cusinfo);

      var a = json.decode(response.toString());
      print(response.statusCode);
      if (response.statusCode == 200) {
        var responsedata = json.decode(response.data)["user"];
        print(responsedata);
        //  await setString(userId, a['email']["password"].toString());
        print(response.data);
        var data = CInfo.fromJson(responsedata);
        return data;
        // AppNavigatorService.pushNamedAndRemoveUntil("Signin");
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
