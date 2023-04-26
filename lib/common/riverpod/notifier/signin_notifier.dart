// ignore_for_file: nullable_type_in_catch_clause

import 'package:flutter/cupertino.dart';
import 'package:homeservice/common/riverpod/state/Signin_State.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../Services/localkeys.dart';
import '../../Services/networkexception.dart';
import '../interface/signin_interface.dart';

class UserNotifier extends StateNotifier<UserState> {
  final IUserRepository _iUserRepository;

  UserNotifier(this._iUserRepository) : super(UserInitialState());

  Future<void> signin(
      String email, String password, BuildContext context) async {
    try {
      state = UserLoadingState();
      final user = await _iUserRepository.signin(email, password, context);

      state = UserLoadedState(user);
    } on NetworkException {
      state = UserErrorState(LocaleKeys.something_went_wrong.trim());
    }
  }
}
