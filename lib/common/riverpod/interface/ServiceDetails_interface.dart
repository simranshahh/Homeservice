// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';

import '../models/ServiceDetails.dart';

abstract class ICustomerSignupRepository {
  Future<ServiceDetails?> customerregister(
    String? id,
    String? name,
    String? user,
    String? description,
    String? location,
    String? cordinates,
    String? price,
    String? type,
    List<dynamic>? ratings,
    String? category,
    int? v,
    BuildContext context,
  );
  // Future<Service?> customerinfo();
}
