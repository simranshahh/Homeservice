// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../Services/app_navigator_service.dart';
import '../../../Services/basedio.dart';
import '../../../config/my_config.dart';
import '../../interface/AddRating_interface.dart';
import '../../models/AddRatingModel.dart';

class AddRatingRepository implements IAddRatingRepository {
  @override
  Future<AddRating?> addRating(String serviceId, int rating, String description,
      BuildContext context) async {
    var data = {
      "serviceId": serviceId,
      "rating": rating,
      "description": description,
    };
    print(data);

    try {
      var response = await Api().post(MyConfig.addrating, data: data);

      var a = json.decode(response.toString());
      print(response.statusCode);
      if (response.statusCode == 201) {
        var responsedata = json.decode(response.data);
        print(responsedata);

        AppNavigatorService.pushNamedAndRemoveUntil("bnv");
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
