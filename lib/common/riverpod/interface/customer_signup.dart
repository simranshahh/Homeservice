// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../models/customer_signup.dart';

abstract class ICustomerSignupRepository {
  Future<CustomerRegister?> customerregister(
    String fullName,
    String email,
    String phone,
    String address,
    String password,
    String cordinates,
    BuildContext context,
  );
}
