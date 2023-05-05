// ignore_for_file: file_names

import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../interface/Updatebookingstatausinterface.dart';
import '../notifier/UpdatebookingStatusNotifier.dart';
import '../repository/ServiceProvider/UpdatebookingStatusRepository.dart';
import '../state/UpdateBookingStatusState.dart';

final _updateBookingStatusRepositoryProvider =
    Provider<IUpdateBookingStatusRepository>(
        (ref) => UpdateBookingStatusRepository());

final updateBookingStatusNotifierProvider = StateNotifierProvider<
        UpdateBookingStatusNotifier, UpdateBookingStatusState>(
    (ref) => UpdateBookingStatusNotifier(
        ref.watch(_updateBookingStatusRepositoryProvider)));
