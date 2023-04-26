// ignore_for_file: file_names

import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../interface/customer_signup.dart';
import '../models/customerprofile.dart';
import '../notifier/Customersignnup_notifier.dart';
import '../repository/customersignup_repo.dart';
import '../state/Customer_signup.dart';

final _customerSignupRepositoryProvider =
    Provider<ICustomerSignupRepository>((ref) => CustomerSignupRepository());

final customerSignupNotifierProvider =
    StateNotifierProvider<CustomerSignupNotifier, CustomerSignupState>((ref) =>
        CustomerSignupNotifier(ref.watch(_customerSignupRepositoryProvider)));

final customerinfoprovider = FutureProvider.autoDispose<CInfo?>(
  (ref) async {
    return ref.read(_customerSignupRepositoryProvider).customerinfo();
  },
);
