// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../models/customer_signup.dart';
import '../models/customerprofile.dart';

abstract class ICustomerSignupRepository {
  Future<CustomerRegister?> customerregister(
    // String email,
    // String password,
    // String cordinates,
    // String phone,
    // String address,
    // String fullName,
    // String role,
    BuildContext context,
  );
  Future<CInfo?> customerinfo();
}
