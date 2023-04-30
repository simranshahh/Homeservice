// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';

import '../models/SignupModel.dart';

abstract class ISignupRepository {
  Future<Register?> serviceregister(
    String email,
    String password,
    String role,
    String cordinates,
    String phone,
    String address,
    String fullName,
    int price,
    BuildContext context,
  );
}
