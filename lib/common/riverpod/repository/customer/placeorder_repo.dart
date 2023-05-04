// ignore_for_file: avoid_print, deprecated_member_use, depend_on_referenced_packages, use_build_context_synchronously, unused_import, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:homeservice/Customer/View/BottomnavScreen/BottomNabBar.dart';
import 'package:homeservice/common/Services/app_navigator_service.dart';
import 'package:homeservice/common/Services/basedio.dart';
import 'package:homeservice/Customer/View/Home/Homepage.dart';
import 'package:homeservice/Serviceprovider/Dashboard/bottomnavbar.dart';
import 'package:homeservice/common/riverpod/models/PlaceOrder_model.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:http/http.dart' as http;

import '../../../../Customer/View/Bookings/Bookings.dart';
import '../../../config/my_config.dart';
import '../../interface/placeorder_interface.dart';

class OrderRepository implements IOrderRepository {
  @override
  Future<PlaceOrder?> order(String? time, String? date, String? note,
      String? serviceId, BuildContext context) async {
    var data = {
      "serviceId": serviceId,
      "note": note,
      "time": time,
      "date": date,
    };
    print(data);

    try {
      var response = await Api().post(MyConfig.placeorder, data: data);

      // Map<String, dynamic> a = jsonDecode(response.data.toString());
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.data);
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/done.png',
                    height: 100,
                    width: 100,
                  ),
                  Text(
                      '     Your Service has been    \n      Booked successfully!'),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Bookings()));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepPurpleAccent),
                    ),
                    child: Text(
                      'See My Order',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            );
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
