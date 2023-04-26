// ignore_for_file: implementation_imports, inference_failure_on_untyped_parameter, depend_on_referenced_packages, file_names, non_constant_identifier_names

// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../Services/localkeys.dart';
import '../../Services/networkexception.dart';
import '../interface/Signup_interface.dart';
import '../state/Signup_state.dart';

class SignupNotifier extends StateNotifier<SignupState> {
  final ISignupRepository _iSignupRepository;

  SignupNotifier(this._iSignupRepository) : super(SignupInitialState());

  Future<void> Register(
    String email,
    String password,
    String role,
    String cordinates,
    String phone,
    String address,
    String fullName,
    BuildContext context,
  ) async {
    try {
      state = SignupLoadingState();
      final sendSignupSms = await _iSignupRepository.register(
          email, password, role, cordinates, phone, address, fullName, context);
      state = SignupLoadedState(sendSignupSms);
    } on NetworkException {
      state = SignupErrorState(LocaleKeys.something_went_wrong.trim());
    }
  }
}
