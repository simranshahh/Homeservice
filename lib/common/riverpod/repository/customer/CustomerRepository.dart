// ignore_for_file: file_names, avoid_print, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:homeservice/common/Dialogs.dart';
import 'package:homeservice/common/riverpod/models/ServiceDetails.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../Services/basedio.dart';
import '../../../config/my_config.dart';
import '../../../helper/constants.dart';
import '../../models/AllrolesModel.dart';
import '../../models/NotificationModel.dart';
import '../../models/customerprofile.dart';
import '../../models/servicestatus_model.dart';

class CustomerRepository {
  Future<List<ServiceDetails>> serviceDetails(
      String? servicename, BuildContext context) async {
    try {
      final serviceDetails = "/api/service/all/$servicename";

      var response = await Api().get(MyConfig.appUrl + serviceDetails);
      print(response.statusCode);
      if (response.statusCode == 200) {
        // final value = jsonDecode(response.data);
        List<dynamic> data = json.decode(response.data);
        print(data);

        var n = jsonDecode(response.data)[0]["full_name"];
        dialog(n, context);

        // var serviceId = jsonDecode(response.data)["_id"];

        // print(n);
        await setValue(r, n);
        // await setValue(serId, serviceId);
        // print(value);
        // Map<String, dynamic> responsedata = json.decode(response.data);
        return data.map((e) => ServiceDetails.fromJson(e)).toList();
      }
    } catch (e) {
      print(e.toString());
    }
    List<ServiceDetails> b = [];
    return b;
  }

  Future<List<ServiceStatus>> serviceStatus(String? servicetype) async {
    try {
      final servicestatus = "/api/booking/mybookings?type=$servicetype";

      var response = await Api().get(MyConfig.appUrl + servicestatus);
      print(response.statusCode);
      if (response.statusCode == 200) {
        List<dynamic> responsedata = jsonDecode(response.data);

        // var serviceId = jsonDecode(response.data)["_id"];

        // print(n);
        // var data = json.decode(response.data);
        // List data = responsedata[0]['user'];
        return responsedata.map((e) => ServiceStatus.fromJson(e)).toList();
      }
    } catch (e) {
      print(e.toString());
    }
    List<ServiceStatus> b = [];
    return b;
  }

  Future<List<Roles>> allRoles() async {
    try {
      var response = await Api().get(MyConfig.allroles);
      print(response.statusCode);
      if (response.statusCode == 200) {
        Map<String, dynamic> responsedata = json.decode(response.data);
        List<dynamic> data = responsedata["roles"];
        return data.map((e) => Roles.fromJson(e)).toList();
      }
    } catch (e) {
      print(e.toString());
    }
    List<Roles> b = [];
    return b;
  }

  Future<User?> customerinfo() async {
    try {
      final response = await Api().get(MyConfig.cusinfo);

      // var a = json.decode(response.toString());
      print(response.statusCode);
      print(json.decode(response.data)['user']);
      if (response.statusCode == 200) {
        // var value = json.decode(response.data);
        // responsedata = json.decode(response.data)["user"];
        // print(value);
        //  await setString(userId, a['email']["password"].toString());
        // var data = User.fromJson(json.decode(response.data));
        // print(data);
        return User.fromJson(jsonDecode(response.data)['user']);

        // AppNavigatorService.pushNamedAndRemoveUntil("Signin");
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<List<Notifications>> notificationinfo() async {
    try {
      final response = await Api().get(MyConfig.notification);

      // var a = json.decode(response.toString());
      print(response.statusCode);
      print(json.decode(response.data)['notifications']);
      if (response.statusCode == 200) {
        Map<String, dynamic> responsedata = json.decode(response.data);
        print(responsedata);
        List<dynamic> data = responsedata["notifications"];
        return data.map((e) => Notifications.fromJson(e)).toList();

        // AppNavigatorService.pushNamedAndRemoveUntil("Signin");
      }
    } catch (e) {
      print(e.toString());
    }
    List<Notifications> b = [];
    return b;
  }
  
}
// Future<User?> customerinfo() async {
//   try {
//     final response = await Api().get(MyConfig.cusinfo);

//     // var a = json.decode(response.toString());
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       var value = json.decode(response.data);
//       // responsedata = json.decode(response.data)["user"];
//       print(value);
//       //  await setString(userId, a['email']["password"].toString());
//       var data = User.fromJson(value);
//       print(data);
//       return data;
//       // AppNavigatorService.pushNamedAndRemoveUntil("Signin");
//     }
//   } catch (e) {
//     print(e.toString());
//   }
//   return null;
// }
String scheduled = "scheduled";
String current = "current";
String completed = "completed";

final customerRepositoryProvider =
    Provider<CustomerRepository>((ref) => CustomerRepository());

// final customerSignupNotifierProvider =
//     StateNotifierProvider<CustomerSignupNotifier, CustomerSignupState>((ref) =>
//         CustomerSignupNotifier(ref.watch(_customerSignupRepositoryProvider)));

final allrolesprovider = FutureProvider.autoDispose<List<Roles>>(
  (ref) async {
    return ref.read(customerRepositoryProvider).allRoles();
  },
);
final roleinfo = FutureProvider.autoDispose<User?>(
  (ref) async {
    return ref.read(customerRepositoryProvider).customerinfo();
  },
);
final scheduledprovider =
    FutureProvider.autoDispose<List<ServiceStatus>>((ref) async {
  return ref.read(customerRepositoryProvider).serviceStatus(scheduled);
});
final currentprovider =
    FutureProvider.autoDispose<List<ServiceStatus>>((ref) async {
  return ref.read(customerRepositoryProvider).serviceStatus(current);
});
final completedprovider =
    FutureProvider.autoDispose<List<ServiceStatus>>((ref) async {
  return ref.read(customerRepositoryProvider).serviceStatus(completed);
});
final notificationprovider =
    FutureProvider.autoDispose<List<Notifications>>((ref) async {
  return ref.read(customerRepositoryProvider).notificationinfo();
});
// final cusprofileprovider = FutureProvider.autoDispose<User?>(
//   (ref) async {
//     return ref.read(customerRepositoryProvider).customerinfo();
//   },
// );


