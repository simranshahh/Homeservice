// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Services/localkeys.dart';
import '../../Services/networkexception.dart';
import '../interface/CancelBookingInterfacee.dart';
import '../state/CancelBookingState.dart';

class CancelBookingNotifier extends StateNotifier<CancelBookingState> {
  final ICancelBookingRepository _iCancelBookingRepository;

  CancelBookingNotifier(this._iCancelBookingRepository)
      : super(CancelBookingInitialState());

  Future<void> cancelBooking(
    String id,
    String reason,
    BuildContext context,
  ) async {
    try {
      state = CancelBookingLoadingState();
      final sendCancelBooking =
          await _iCancelBookingRepository.cancelBooking(id, reason, context);
      state = CancelBookingLoadedState(sendCancelBooking);
    } on NetworkException {
      state = CancelBookingErrorState(LocaleKeys.something_went_wrong.trim());
    }
  }
}
