// ignore_for_file: file_names


import '../models/AddRatingModel.dart';

abstract class AddRatingState {
  AddRatingState();
}

class AddRatingInitialState extends AddRatingState {
  AddRatingInitialState();
}

class AddRatingLoadingState extends AddRatingState {
  AddRatingLoadingState();
}

class AddRatingLoadedState extends AddRatingState {
  final AddRating? addRating;
  AddRatingLoadedState(this.addRating);
}

class AddRatingErrorState extends AddRatingState {
  final String? message;
  AddRatingErrorState(
    String tr, {
    this.message,
  });
}
