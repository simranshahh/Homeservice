import 'package:homeservice/riverpod/interface/signup_interface.dart';
import 'package:homeservice/riverpod/notifier/signup_notifier.dart';
import 'package:homeservice/riverpod/repository/signup_repository.dart';
import 'package:homeservice/riverpod/state/signup_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _signupRepositoryProvider =
    Provider<ISignupRepository>((ref) => SignupRepository());

final signupNotifierProvider =
    StateNotifierProvider<SignupNotifier, SignupState>(
        (ref) => SignupNotifier(ref.watch(_signupRepositoryProvider)));
