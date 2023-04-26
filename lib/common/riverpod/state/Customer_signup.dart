// ignore_for_file: file_names

import '../models/customer_signup.dart';

abstract class CustomerSignupState {
  CustomerSignupState();
}

class CustomerSignupInitialState extends CustomerSignupState {
  CustomerSignupInitialState();
}

class CustomerSignupLoadingState extends CustomerSignupState {
  CustomerSignupLoadingState();
}

class CustomerSignupLoadedState extends CustomerSignupState {
  final CustomerRegister? customerSignup;
  CustomerSignupLoadedState(this.customerSignup);
}

class CustomerSignupErrorState extends CustomerSignupState {
  final String? message;
  CustomerSignupErrorState(
    String tr, {
    this.message,
  });
}
