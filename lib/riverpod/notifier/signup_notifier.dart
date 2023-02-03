// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:homeservice/Services/localkeys.dart';
import 'package:homeservice/Services/networkexception.dart';
import 'package:homeservice/riverpod/interface/signup_interface.dart';
import 'package:homeservice/riverpod/state/signup_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignupNotifier extends StateNotifier<SignupState> {
  final ISignupRepository _iSignupRepository;

  SignupNotifier(this._iSignupRepository) : super(SignupInitialState());

  Future<void> Register(
      String name,
      String surname,
      String username,
      String emailAddress,
      String password,
      String phoneNumber,
      BuildContext context) async {
    try {
      state = SignupLoadingState();
      final sendSignupSms = await _iSignupRepository.Register(name, surname,
          username, emailAddress, password, phoneNumber, context);
      state = SignupLoadedState(sendSignupSms);
    } on NetworkException {
      state = SignupErrorState(LocaleKeys.something_went_wrong.trim());
    }
  }
}
