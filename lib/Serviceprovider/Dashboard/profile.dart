// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, unused_import, file_names, sort_child_properties_last, empty_catches, avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:homeservice/Customer/View/BottomnavScreen/BottomNabBar.dart';
import 'package:homeservice/Serviceprovider/Dashboard/edit_profile.dart';
import 'package:homeservice/Customer/View/Settings/Edit_Profile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/Services/basedio.dart';
import '../../common/config/my_config.dart';
import '../../common/riverpod/models/customerprofile.dart';
import '../../common/riverpod/provider/customerSignup_provider.dart';
import '../../common/riverpod/provider/signin_provider.dart';
import '../../common/riverpod/repository/customer/CustomerRepository.dart';
import '../../main.dart';
import 'Dashboard/Aboutus.dart';
import 'bottomnavbar.dart';

class Serviceman_setting extends ConsumerStatefulWidget {
  const Serviceman_setting({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _Serviceman_settingState();
}

class _Serviceman_settingState extends ConsumerState<Serviceman_setting> {
  bool isDarkModeEnabled = false;

  ImagePicker picker = ImagePicker();
  XFile? image;

  String imageUrl = '';
  Future<void> logout() async {
    await ref.read(userNotifierProvider.notifier).logout();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final cusinfo = ref.watch(cusprofileprovider);

    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        Container(
          height: 190,
          width: 370,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 1),
                colors: <Color>[
                  Color.fromARGB(255, 57, 8, 156),
                  Color.fromARGB(255, 132, 66, 224),
                ],
                tileMode: TileMode.mirror,
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40))),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 50, 8, 8),
            child: Center(
              child: CircleAvatar(
                radius: 50,
                foregroundImage: AssetImage('assets/worker.jpg'),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Bottomnavbar()));
                },
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.white,
              ),
              SizedBox(
                width: 70,
              ),
              Text(
                'Profile',
                style: TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(
                width: 115,
              ),
              IconButton(
                onPressed: logout,
                icon: Icon(Icons.exit_to_app, color: Colors.white),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurpleAccent)),
              ),
            ],
          ),
        ),
        FutureBuilder(
          future: customerinfo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 180, 8, 0),
                child: Card(
                  elevation: 5,
                  child: SizedBox(
                    height: height * 0.6,
                    child: Column(
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(130.0, 0, 18, 18),
                        //   child: CircleAvatar(
                        //     radius: 50,
                        //     backgroundImage: AssetImage('assets/worker.jpg'),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 2, 8, 0),
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/name.png',
                                          height: 40,
                                          width: 40,
                                        ),
                                        Text(
                                          snapshot.data!.fullName.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/mail.png',
                                          height: 35,
                                          width: 35,
                                        ),
                                        Text(
                                          snapshot.data!.email.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/call.png',
                                          height: 35,
                                          width: 35,
                                        ),
                                        Text(
                                          snapshot.data!.phone.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/location.png',
                                          height: 35,
                                          width: 35,
                                        ),
                                        Text(
                                          snapshot.data!.address.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    InkWell(
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/about.png',
                                            height: 35,
                                            width: 35,
                                          ),
                                          Text(
                                            '   About Us',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      onTap: (() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        AboutUs()));
                                      }),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )
      ]),
    ));
  }

  // void onStateChanged(bool isDarkModeEnabled) {
  //   setState(() {
  //     this.isDarkModeEnabled = isDarkModeEnabled;
  //   });
  // }
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
