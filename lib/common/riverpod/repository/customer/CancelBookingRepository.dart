// ignore_for_file: file_names, use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../Dialogs.dart';
import '../../../Services/app_navigator_service.dart';
import '../../../Services/basedio.dart';
import '../../../config/my_config.dart';
import '../../interface/CancelBookingInterfacee.dart';
import '../../models/CancelBookingModel.dart';

class CancelBookingRepository implements ICancelBookingRepository {
  @override
  Future<CancelBooking?> cancelBooking(
      String id, String reason, BuildContext context) async {
    var data = {
      "id": id,
      "reason": reason,
    };
    print(data);

    try {
      var response = await Api().post(MyConfig.cancelbooking, data: data);

      print(response.statusCode);
      if (response.statusCode == 200) {
        var responsedata = json.decode(response.data);
        print(responsedata);
        canceldialog(context);
        AppNavigatorService.pushNamedAndRemoveUntil("bnv");
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
