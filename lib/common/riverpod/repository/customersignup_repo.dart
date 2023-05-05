// ignore_for_file: avoid_print, unused_local_variable, depend_on_referenced_packages, use_build_context_synchronously, prefer_const_constructors, deprecated_member_use, un'../interface/CustomerSignup_interface.dart'er_names, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import '../../Dialogs.dart';
import '../../Services/app_navigator_service.dart';
import '../../Services/basedio.dart';
import '../../config/my_config.dart';
import '../interface/customer_signup.dart';
import '../models/customer_signup.dart';

class CustomerSignupRepository implements ICustomerSignupRepository {
  @override
  Future<CustomerRegister?> customerregister(
    String fullName,
    String email,
    String phone,
    String address,
    String password,
    String cordinates,
    BuildContext context,
  ) async {
    var data = {
      "full_name": fullName,
      "email": email,
      "phone": phone,
      "address": address,
      "password": password,
      "cordinates": cordinates,
    };
    print(data);

    try {
      var response = await Api().post(MyConfig.register, data: data);

      var a = json.decode(response.toString());
      print(response.statusCode);
      if (response.statusCode == 201) {
        var responsedata = json.decode(response.data);
        // print(responsedata);
        //  await setString(userId, a['email']["password"].toString());
        // print(response.data);
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
