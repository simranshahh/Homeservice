// ignore_for_file: file_names

import 'package:homeservice/common/riverpod/models/PlaceOrder_model.dart';

abstract class OrderState {
  OrderState();
}

class OrderInitialState extends OrderState {
  OrderInitialState();
}

class OrderLoadingState extends OrderState {
  OrderLoadingState();
}

class OrderLoadedState extends OrderState {
  final PlaceOrder? order;
  OrderLoadedState(this.order);
}

class OrderErrorState extends OrderState {
  final String? message;
  OrderErrorState(
    String tr, {
    this.message,
  });
}
