import '../models/Signup_model.dart';

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
  final Signupclass? signup;
  SignupLoadedState(this.signup);
}

class SignupErrorState extends SignupState {
  final String? message;
  SignupErrorState(
    String tr, {
    this.message,
  });
}
