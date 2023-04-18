// ignore_for_file: avoid_print, unused_local_variable, depend_on_referenced_packages, use_build_context_synchronously, prefer_const_constructors, deprecated_member_use, un'../interface/Signup_interface.dart'er_names, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../config/my_config.dart';
import '../../helper/constants.dart';
import '../../services/app_navigator_service.dart';
import '../../services/baseDio.dart';

import '../interface/Signup_interface.dart';
import '../models/Signup_model.dart';

class SignupRepository implements ISignupRepository {
  @override
  Future<Signupclass?> Register(
    String email,
    String password,
    BuildContext context,
  ) async {
    var data = {
      'email': email,
      'password': password,
    };
    print(data);

    try {
      var response = await Api().post(MyConfig.register, data: data);

      var a = json.decode(response.toString());
      print(response.statusCode);
      if (response.statusCode == 200) {
        var responsedata = json.decode(response.data)['user'];
        print(responsedata);
        await setString(userId, a['email']["password"].toString());
        print(response.data);
        AppNavigatorService.pushNamedAndRemoveUntil("confirmotp");
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
