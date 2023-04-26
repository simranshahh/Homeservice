// ignore_for_file: avoid_print, unused_local_variable, depend_on_referenced_packages, use_build_context_synchronously, prefer_const_constructors, deprecated_member_use, un'../interface/CustomerSignup_interface.dart'er_names, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import '../../Services/app_navigator_service.dart';
import '../../Services/basedio.dart';
import '../../config/my_config.dart';
import '../interface/customer_signup.dart';
import '../models/customer_signup.dart';

class CustomerSignupRepository implements ICustomerSignupRepository {
  @override
  Future<CustomerRegister?> customerregister(
    String email,
    String password,
    String cordinates,
    String phone,
    String address,
    String fullName,
    String role,
    BuildContext context,
  ) async {
    var data = {
      'email': email,
      'password': password,
      "cordinates": cordinates,
      "phone": phone,
      "address": address,
      "full_name": fullName,
      "role": role,
    };
    print(data);

    try {
      var response = await Api().post(MyConfig.register, data: data);

      var a = json.decode(response.toString());
      print(response.statusCode);
      if (response.statusCode == 200) {
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
}
