// ignore_for_file: nullable_type_in_catch_clause

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Services/localkeys.dart';
import '../../Services/networkexception.dart';
import '../interface/placeorder_interface.dart';
import '../state/placeorder_state.dart';

class OrderNotifier extends StateNotifier<OrderState> {
  final IOrderRepository _iOrderRepository;

  OrderNotifier(this._iOrderRepository) : super(OrderInitialState());

  Future<void> order(
      String? time, String? date, String? note, String? serviceId,BuildContext contex) async {
    try {
      state = OrderLoadingState();
      final order = await _iOrderRepository.order(time, date, note, serviceId,contex);

      state = OrderLoadedState(order);
    } on NetworkException {
      state = OrderErrorState(LocaleKeys.something_went_wrong.trim());
    }
  }
}
