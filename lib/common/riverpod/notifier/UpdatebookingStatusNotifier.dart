// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Services/localkeys.dart';
import '../../Services/networkexception.dart';
import '../interface/Updatebookingstatausinterface.dart';
import '../state/UpdateBookingStatusState.dart';

class UpdateBookingStatusNotifier
    extends StateNotifier<UpdateBookingStatusState> {
  final IUpdateBookingStatusRepository _iUpdateBookingStatusRepository;

  UpdateBookingStatusNotifier(this._iUpdateBookingStatusRepository)
      : super(UpdateBookingStatusInitialState());

  Future<void> UpdateBookingStatus(
      String id, String status, BuildContext context) async {
    try {
      state = UpdateBookingStatusLoadingState();
      final sendUpdateBookingStatus = await _iUpdateBookingStatusRepository
          .updateBookingStatus(id, status, context);
      state = UpdateBookingStatusLoadedState(sendUpdateBookingStatus);
    } on NetworkException {
      state =
          UpdateBookingStatusErrorState(LocaleKeys.something_went_wrong.trim());
    }
  }
}
