// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, unused_import, file_names, sort_child_properties_last

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:homeservice/CustomerPanel/Bottomnavbar/BottomNabBar.dart';
import 'package:homeservice/Serviceprovider/Dashboard/edit_profile.dart';
import 'package:homeservice/CustomerPanel/View/Settings/Edit_Profile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Container(
            height: 180,
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
                    icon: Icon(MyApp.themeNotifier.value == ThemeMode.light
                        ? Icons.dark_mode
                        : Icons.light_mode),
                    onPressed: () {
                      MyApp.themeNotifier.value =
                          MyApp.themeNotifier.value == ThemeMode.light
                              ? ThemeMode.dark
                              : ThemeMode.light;
                    }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(130.0, 128, 18, 18),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/worker.jpg'),
              child: Padding(
                padding: const EdgeInsets.all(65.0),
                child: IconButton(
                  icon: Icon(Icons.camera),
                  onPressed: (() async {
                    image = await picker.pickImage(source: ImageSource.gallery);
                    setState(() {});
                    // image == null ? Container() : Image.file(File(image!.path));
                  }),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 230, 8, 0),
            child: Stack(children: [
              Card(
                child: Container(
                  height: 400,
                  width: 380,
                  color: Colors.white,
                ),
              ),
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
                            '   Ram Shrestha',
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                            '   rammma123@gmail.com',
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                            '   9805367848',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/job.png',
                            height: 35,
                            width: 35,
                          ),
                          Text(
                            '   Carpenter',
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                            '   Biratnagar,Morang',
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      AboutUs()));
                        }),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/profile_setting.png',
                            height: 35,
                            width: 35,
                          ),
                          InkWell(
                            child: Text(
                              '   Edit Profile',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          EditServiceman_setting()));
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.fromLTRB(30, 278, 0, 0),
              //   child: DayNightSwitcher(
              //       isDarkModeEnabled: isDarkModeEnabled,
              //       onStateChanged: onStateChanged),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(top: 330, left: 30),
              //   child: Text('Dark mode is ' +
              //       (isDarkModeEnabled ? 'enabled' : 'disabled') +
              //       '.'),
              // ),
            ]),
          )
        ]),
      ),
    );
  }

  // void onStateChanged(bool isDarkModeEnabled) {
  //   setState(() {
  //     this.isDarkModeEnabled = isDarkModeEnabled;
  //   });
  // }
}
