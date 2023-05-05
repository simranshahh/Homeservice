// ignore_for_file: file_names


import '../models/CancelBookingModel.dart';

abstract class CancelBookingState {
  CancelBookingState();
}

class CancelBookingInitialState extends CancelBookingState {
  CancelBookingInitialState();
}

class CancelBookingLoadingState extends CancelBookingState {
  CancelBookingLoadingState();
}

class CancelBookingLoadedState extends CancelBookingState {
  final CancelBooking? cancelBooking;
  CancelBookingLoadedState(this.cancelBooking);
}

class CancelBookingErrorState extends CancelBookingState {
  final String? message;
  CancelBookingErrorState(
    String tr, {
    this.message,
  });
}
