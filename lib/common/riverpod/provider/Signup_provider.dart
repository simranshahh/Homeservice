// ignore_for_file: file_names

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../interface/Signup_interface.dart';
import '../notifier/Signup_notifier.dart';
import '../repository/ServiceProvider/serviceSignup_repo.dart';
import '../state/Signup_state.dart';

final _serviceSignupRepositoryProvider =
    Provider<ISignupRepository>((ref) => SignupRepository());

final serviceSignupNotifierProvider =
    StateNotifierProvider<SignupNotifier, SignupState>(
        (ref) => SignupNotifier(ref.watch(_serviceSignupRepositoryProvider)));
