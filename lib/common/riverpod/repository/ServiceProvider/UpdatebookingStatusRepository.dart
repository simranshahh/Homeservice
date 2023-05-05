// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';

import '../../../Services/app_navigator_service.dart';
import '../../../Services/basedio.dart';
import '../../../config/my_config.dart';
import '../../interface/Updatebookingstatausinterface.dart';
import '../../models/UpdatebookingStatusModel.dart';

class UpdateBookingStatusRepository implements IUpdateBookingStatusRepository {
  @override
  Future<UpdateBookingStatus?> updateBookingStatus(
      String id, String status, BuildContext context) async {
    var data = {
      "id": id,
      "status": status,
    };

    try {
      var response = await Api().post(MyConfig.updateBookingStatus, data: data);

      if (response.statusCode == 200) {
        print(response.data);
        AppNavigatorService.pushNamedAndRemoveUntil("bnb");
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
