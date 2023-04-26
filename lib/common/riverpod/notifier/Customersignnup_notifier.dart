// ignore_for_file: implementation_imports, inference_failure_on_untyped_parameter, depend_on_referenced_packages, file_names, non_constant_identifier_names

// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../Services/localkeys.dart';
import '../../Services/networkexception.dart';
import '../interface/customer_signup.dart';
import '../state/Customer_signup.dart';

class CustomerSignupNotifier extends StateNotifier<CustomerSignupState> {
  final ICustomerSignupRepository _iCustomerSignupRepository;

  CustomerSignupNotifier(this._iCustomerSignupRepository)
      : super(CustomerSignupInitialState());

  Future<void> CustomerRegister(
    String email,
    String password,
    String cordinates,
    String phone,
    String address,
    String fullName,
    String role,
    BuildContext context,
  ) async {
    try {
      state = CustomerSignupLoadingState();
      final sendCustomerSignupSms =
          await _iCustomerSignupRepository.customerregister(email, password,
              cordinates, phone, address, fullName, role, context);
      state = CustomerSignupLoadedState(sendCustomerSignupSms);
    } on NetworkException {
      state = CustomerSignupErrorState(LocaleKeys.something_went_wrong.trim());
    }
  }
}
