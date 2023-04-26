import 'package:homeservice/common/riverpod/notifier/signin_notifier.dart';
import 'package:homeservice/common/riverpod/state/Signin_State.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../interface/signin_interface.dart';
import '../repository/signin_repository.dart';

final _userRepositoryProvider =
    Provider<IUserRepository>((ref) => UserRepository());

final userNotifierProvider = StateNotifierProvider<UserNotifier, UserState>(
    ((ref) => UserNotifier(ref.watch(_userRepositoryProvider))));
