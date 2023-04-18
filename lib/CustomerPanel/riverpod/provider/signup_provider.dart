import 'package:homeservice/CustomerPanel/riverpod/notifier/signup_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../interface/Signup_interface.dart';
import '../repository/Signup_Repository.dart';
import '../state/Signup_state.dart';

final _signupRepositoryProvider =
    Provider<ISignupRepository>((ref) => SignupRepository());

final signupNotifierProvider =
    StateNotifierProvider<SignupNotifier, SignupState>(
        (ref) => SignupNotifier(ref.watch(_signupRepositoryProvider)));
