// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';

import '../models/signup_model.dart';

abstract class ISignupRepository {
  Future<SignupClass?> Register(
      String name,
      String surname,
      String username,
      String emailAddress,
      String password,
      String phoneNumber,
      BuildContext context);
}
