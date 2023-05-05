// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Services/localkeys.dart';
import '../../Services/networkexception.dart';
import '../interface/AddRating_interface.dart';
import '../state/addratingState.dart';

class AddRatingNotifier extends StateNotifier<AddRatingState> {
  final IAddRatingRepository _iAddRatingRepository;

  AddRatingNotifier(this._iAddRatingRepository)
      : super(AddRatingInitialState());

  Future<void> AddRating(
    String serviceId,
    int rating,
    String description,
    BuildContext context,
  ) async {
    try {
      state = AddRatingLoadingState();
      final sendAddRating = await _iAddRatingRepository.addRating(
          serviceId, rating, description, context);
      state = AddRatingLoadedState(sendAddRating);
    } on NetworkException {
      state = AddRatingErrorState(LocaleKeys.something_went_wrong.trim());
    }
  }
}
