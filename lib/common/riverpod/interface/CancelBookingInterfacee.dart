// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../models/CancelBookingModel.dart';

abstract class ICancelBookingRepository {
  Future<CancelBooking?> cancelBooking(
      String id, String reason, BuildContext context);
}
