// ignore_for_file: file_names

import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../interface/AddRating_interface.dart';
import '../notifier/AddRating_notiifer.dart';
import '../repository/customer/AddRatingRepository.dart';
import '../state/addratingState.dart';

final _addRatingRepositoryProvider =
    Provider<IAddRatingRepository>((ref) => AddRatingRepository());

final addRatingNotifierProvider =
    StateNotifierProvider<AddRatingNotifier, AddRatingState>(
        (ref) => AddRatingNotifier(ref.watch(_addRatingRepositoryProvider)));
