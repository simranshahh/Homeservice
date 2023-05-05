// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:homeservice/common/riverpod/models/AddRatingModel.dart';

abstract class IAddRatingRepository {
  Future<AddRating?> addRating(
 String serviceId,
  int rating,
  String description,
  BuildContext context);
}