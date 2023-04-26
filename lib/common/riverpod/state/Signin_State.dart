// ignore_for_file: file_names

import '../../../Customer/Model/Home/usermodel.dart';

abstract class UserState {
  UserState();
}

class UserInitialState extends UserState {
  UserInitialState();
}

class UserLoadingState extends UserState {
  UserLoadingState();
}

class UserLoadedState extends UserState {
  final Signininfo? user;
  UserLoadedState(this.user);
}

class UserErrorState extends UserState {
  final String? message;
  UserErrorState(
    String tr, {
    this.message,
  });
}
