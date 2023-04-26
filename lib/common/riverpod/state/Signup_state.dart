// ignore_for_file: file_names

import '../models/SignupModel.dart';

abstract class SignupState {
  SignupState();
}

class SignupInitialState extends SignupState {
  SignupInitialState();
}

class SignupLoadingState extends SignupState {
  SignupLoadingState();
}

class SignupLoadedState extends SignupState {
  final Register? signup;
  SignupLoadedState(this.signup);
}

class SignupErrorState extends SignupState {
  final String? message;
  SignupErrorState(
    String tr, {
    this.message,
  });
}
