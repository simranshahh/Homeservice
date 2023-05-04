import 'package:flutter/material.dart';
import 'package:homeservice/common/riverpod/models/PlaceOrder_model.dart';

abstract class IOrderRepository {
  Future<PlaceOrder?> order(
      String? time, String? date, String? note, String? serviceId,BuildContext context);
}
