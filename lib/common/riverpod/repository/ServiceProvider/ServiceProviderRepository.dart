// ignore_for_file: file_names, avoid_print

import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../Services/basedio.dart';
import '../../../config/my_config.dart';
import '../../models/SpServicsStatusModel.dart';

class ServiceProviderRepository {
  Future<List<SBooking>> spsBooking(String? servicetype) async {
    try {
      final sBooking = "/api/booking/getbookings?type=$servicetype";

      var response = await Api().get(MyConfig.appUrl + sBooking);
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        List<dynamic> responsedata = jsonDecode(response.data)["bookings"];
        // var spbid = jsonDecode(response.data)["bookings"]["_id"];
        print(responsedata);
        // print(spbid);
        return responsedata.map((e) => SBooking.fromJson(e)).toList();
      }
    } catch (e) {
      print(e.toString());
    }
    List<SBooking> b = [];
    return b;
  }
}

String scheduled = "scheduled";
String current = "current";
String completed = "completed";

final customerRepositoryProvider =
    Provider<ServiceProviderRepository>((ref) => ServiceProviderRepository());

final spscheduledprovider =
    FutureProvider.autoDispose<List<SBooking>>((ref) async {
  return ref.read(customerRepositoryProvider).spsBooking(scheduled);
});
final spcurrentprovider =
    FutureProvider.autoDispose<List<SBooking>>((ref) async {
  return ref.read(customerRepositoryProvider).spsBooking(current);
});
final spcompletedprovider =
    FutureProvider.autoDispose<List<SBooking>>((ref) async {
  return ref.read(customerRepositoryProvider).spsBooking(completed);
});
