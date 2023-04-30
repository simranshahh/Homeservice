// ignore_for_file: file_names, avoid_print

import 'dart:convert';

import 'package:homeservice/common/riverpod/models/ServiceDetails.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../Services/basedio.dart';
import '../../../config/my_config.dart';
import '../../models/AllrolesModel.dart';
import '../../models/customerprofile.dart';

class CustomerRepository {
  Future<List<Service>> serviceDetails(String? serviceid) async {
    try {
      final serviceDetails = "/api/service/all/$serviceid";

      var response = await Api().get(MyConfig.appUrl + serviceDetails);
      print(response.statusCode);
      if (response.statusCode == 200) {
        Map<String, dynamic> responsedata = json.decode(response.data);
        List<dynamic> data = responsedata["services"];
        return data.map((e) => Service.fromJson(e)).toList();
      }
    } catch (e) {
      print(e.toString());
    }
    List<Service> b = [];
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
}

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
// final cusprofileprovider = FutureProvider.autoDispose<User?>(
//   (ref) async {
//     return ref.read(customerRepositoryProvider).customerinfo();
//   },
// );