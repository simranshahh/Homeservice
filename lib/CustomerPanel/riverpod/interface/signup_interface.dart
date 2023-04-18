// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../models/Signup_model.dart';

abstract class ISignupRepository {
  Future<Signupclass?> Register(
      String email, String password, BuildContext context);
}
