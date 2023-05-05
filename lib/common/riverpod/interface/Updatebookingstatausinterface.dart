// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../models/UpdatebookingStatusModel.dart';

abstract class IUpdateBookingStatusRepository {
  Future<UpdateBookingStatus?> updateBookingStatus(
      String id, String status, BuildContext context);
}
