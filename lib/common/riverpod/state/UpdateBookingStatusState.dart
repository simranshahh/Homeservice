// ignore_for_file: file_names

import '../models/UpdatebookingStatusModel.dart';

abstract class UpdateBookingStatusState {
  UpdateBookingStatusState();
}

class UpdateBookingStatusInitialState extends UpdateBookingStatusState {
  UpdateBookingStatusInitialState();
}

class UpdateBookingStatusLoadingState extends UpdateBookingStatusState {
  UpdateBookingStatusLoadingState();
}

class UpdateBookingStatusLoadedState extends UpdateBookingStatusState {
  final UpdateBookingStatus? updateBookingStatus;
  UpdateBookingStatusLoadedState(this.updateBookingStatus);
}

class UpdateBookingStatusErrorState extends UpdateBookingStatusState {
  final String? message;
  UpdateBookingStatusErrorState(
    String tr, {
    this.message,
  });
}
