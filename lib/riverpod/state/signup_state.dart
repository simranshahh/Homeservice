import '../models/signup_model.dart';

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
  final SignupClass? signup;
  SignupLoadedState(this.signup);
}

class SignupErrorState extends SignupState {
  final String? message;
  SignupErrorState(
    String tr, {
    this.message,
  });
}
