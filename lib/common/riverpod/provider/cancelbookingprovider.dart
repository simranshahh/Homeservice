// ignore_for_file: file_names

import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../interface/CancelBookingInterfacee.dart';
import '../notifier/cancelbookingNotifier.dart';
import '../repository/customer/CancelBookingRepository.dart';
import '../state/CancelBookingState.dart';

final _cancelBookingRepositoryProvider =
    Provider<ICancelBookingRepository>((ref) => CancelBookingRepository());

final cancelBookingNotifierProvider =
    StateNotifierProvider<CancelBookingNotifier, CancelBookingState>(
        (ref) => CancelBookingNotifier(ref.watch(_cancelBookingRepositoryProvider)));
