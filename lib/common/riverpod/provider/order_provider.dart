import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../interface/placeorder_interface.dart';
import '../notifier/placeorder_notifier.dart';
import '../repository/customer/placeorder_repo.dart';
import '../state/placeorder_state.dart';

final _orderRepositoryProvider =
    Provider<IOrderRepository>((ref) => OrderRepository());

final orderNotifierProvider = StateNotifierProvider<OrderNotifier, OrderState>(
    ((ref) => OrderNotifier(ref.watch(_orderRepositoryProvider))));
