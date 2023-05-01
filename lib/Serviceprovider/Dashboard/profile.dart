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
                padding: const EdgeInsets.fromLTRB(8.0, 150, 8, 0),
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
        // cusinfo.when(
        //   data: (data) => data == null
        //       ? Center(child: Text("No data"))
        //       : Padding(
        //           padding: const EdgeInsets.fromLTRB(8.0, 150, 8, 0),
        //           child: Card(
        //             elevation: 5,
        //             child: SizedBox(
        //               height: height * 0.6,
        //               child: Column(
        //                 children: [
        //                   // Padding(
        //                   //   padding: const EdgeInsets.fromLTRB(130.0, 0, 18, 18),
        //                   //   child: CircleAvatar(
        //                   //     radius: 50,
        //                   //     backgroundImage: AssetImage('assets/worker.jpg'),
        //                   //   ),
        //                   // ),
        //                   Padding(
        //                     padding: const EdgeInsets.fromLTRB(8.0, 2, 8, 0),
        //                     child: Column(children: [
        //                       Padding(
        //                         padding: const EdgeInsets.all(28.0),
        //                         child: SingleChildScrollView(
        //                           child: Column(
        //                             children: [
        //                               Row(
        //                                 children: [
        //                                   Image.asset(
        //                                     'assets/name.png',
        //                                     height: 40,
        //                                     width: 40,
        //                                   ),
        //                                   Text(
        //                                     data.fullName.toString(),
        //                                     style: TextStyle(
        //                                         fontWeight: FontWeight.bold),
        //                                   )
        //                                 ],
        //                               ),
        //                               SizedBox(
        //                                 height: 15,
        //                               ),
        //                               Row(
        //                                 children: [
        //                                   Image.asset(
        //                                     'assets/mail.png',
        //                                     height: 35,
        //                                     width: 35,
        //                                   ),
        //                                   Text(
        //                                     data.email.toString(),
        //                                     style: TextStyle(
        //                                         fontWeight: FontWeight.bold),
        //                                   )
        //                                 ],
        //                               ),
        //                               SizedBox(
        //                                 height: 15,
        //                               ),
        //                               Row(
        //                                 children: [
        //                                   Image.asset(
        //                                     'assets/call.png',
        //                                     height: 35,
        //                                     width: 35,
        //                                   ),
        //                                   Text(
        //                                     data.phone.toString(),
        //                                     style: TextStyle(
        //                                         fontWeight: FontWeight.bold),
        //                                   )
        //                                 ],
        //                               ),
        //                               SizedBox(
        //                                 height: 15,
        //                               ),
        //                               Row(
        //                                 children: [
        //                                   Image.asset(
        //                                     'assets/location.png',
        //                                     height: 35,
        //                                     width: 35,
        //                                   ),
        //                                   Text(
        //                                     data.address.toString(),
        //                                     style: TextStyle(
        //                                         fontWeight: FontWeight.bold),
        //                                   )
        //                                 ],
        //                               ),
        //                               SizedBox(
        //                                 height: 15,
        //                               ),
        //                               InkWell(
        //                                 child: Row(
        //                                   children: [
        //                                     Image.asset(
        //                                       'assets/about.png',
        //                                       height: 35,
        //                                       width: 35,
        //                                     ),
        //                                     Text(
        //                                       '   About Us',
        //                                       style: TextStyle(
        //                                           fontWeight: FontWeight.bold),
        //                                     )
        //                                   ],
        //                                 ),
        //                                 onTap: (() {
        //                                   Navigator.push(
        //                                       context,
        //                                       MaterialPageRoute(
        //                                           builder:
        //                                               (BuildContext context) =>
        //                                                   AboutUs()));
        //                                 }),
        //                               ),
        //                               SizedBox(
        //                                 height: 15,
        //                               ),
        //                               // Row(
        //                               //   children: [
        //                               //     Image.asset(
        //                               //       'assets/profile_setting.png',
        //                               //       height: 35,
        //                               //       width: 35,
        //                               //     ),
        //                               //     InkWell(
        //                               //       child: Text(
        //                               //         '   Edit Profile',
        //                               //         style: TextStyle(
        //                               //             fontWeight:
        //                               //                 FontWeight.bold),
        //                               //       ),
        //                               //       onTap: () {
        //                               //         Navigator.push(
        //                               //             context,
        //                               //             MaterialPageRoute(
        //                               //                 builder: (BuildContext
        //                               //                         context) =>
        //                               //                     Edit_ProfilePage()));
        //                               //       },
        //                               //     )
        //                               //   ],
        //                               // ),
        //                             ],
        //                           ),
        //                         ),
        //                       ),

        //                       // Padding(
        //                       //   padding: const EdgeInsets.fromLTRB(30, 278, 0, 0),
        //                       //   child: DayNightSwitcher(
        //                       //       isDarkModeEnabled: isDarkModeEnabled,
        //                       //       onStateChanged: onStateChanged),
        //                       // ),
        //                       // Padding(
        //                       //   padding: EdgeInsets.only(top: 330, left: 30),
        //                       //   child: Text('Dark mode is ' +
        //                       //       (isDarkModeEnabled ? 'enabled' : 'disabled') +
        //                       //       '.'),
        //                       // ),
        //                     ]),
        //                   )
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ),
        //   error: (error, stackTrace) => Text(error.toString()),
        //   loading: () => Center(
        //     child: CircularProgressIndicator(),
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.fromLTRB(130.0, 128, 18, 18),
        //   child: CircleAvatar(
        //     radius: 50,
        //     backgroundImage: AssetImage('assets/worker.jpg'),
        //     child: Padding(
        //       padding: const EdgeInsets.all(65.0),
        //       child: IconButton(
        //         icon: Icon(
        //           Icons.camera,
        //           color: Colors.black,
        //         ),
        //         onPressed: (() async {
        //           String uniqueFilename =
        //               DateTime.now().millisecondsSinceEpoch.toString();
        //           Reference referenceRoot = FirebaseStorage.instance.ref();
        //           Reference referenceDirImages =
        //               referenceRoot.child('images');

        //           Reference referenceImageToUpload =
        //               referenceDirImages.child(uniqueFilename);
        //           try {
        //             await referenceImageToUpload.putFile(File(image!.path));

        //             imageUrl = await referenceImageToUpload.getDownloadURL();
        //           } catch (error) {}

        //           image = await picker.pickImage(source: ImageSource.gallery);
        //           setState(() {
        //             //update UI
        //           });

        //           // image = await picker.pickImage(source: ImageSource.gallery);
        //           // setState(() {});
        //           image == null ? Container() : Image.file(File(image!.path));
        //         }),
        //       ),
        //     ),
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.fromLTRB(8.0, 230, 8, 0),
        //   child: Stack(children: [
        //     Card(
        //       child: Container(
        //         height: 400,
        //         width: 380,
        //         color: Colors.white,
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(28.0),
        //       child: SingleChildScrollView(
        //         child: Column(
        //           children: [
        //             Row(
        //               children: [
        //                 Image.asset(
        //                   'assets/name.png',
        //                   height: 40,
        //                   width: 40,
        //                 ),
        //                 Text(
        //                   '   Ram Shrestha',
        //                   style: TextStyle(fontWeight: FontWeight.bold),
        //                 )
        //               ],
        //             ),
        //             SizedBox(
        //               height: 15,
        //             ),
        //             Row(
        //               children: [
        //                 Image.asset(
        //                   'assets/mail.png',
        //                   height: 35,
        //                   width: 35,
        //                 ),
        //                 Text(
        //                   '   rammma123@gmail.com',
        //                   style: TextStyle(fontWeight: FontWeight.bold),
        //                 )
        //               ],
        //             ),
        //             SizedBox(
        //               height: 15,
        //             ),
        //             Row(
        //               children: [
        //                 Image.asset(
        //                   'assets/call.png',
        //                   height: 35,
        //                   width: 35,
        //                 ),
        //                 Text(
        //                   '   9805367848',
        //                   style: TextStyle(fontWeight: FontWeight.bold),
        //                 )
        //               ],
        //             ),
        //             SizedBox(
        //               height: 15,
        //             ),
        //             Row(
        //               children: [
        //                 Image.asset(
        //                   'assets/job.png',
        //                   height: 35,
        //                   width: 35,
        //                 ),
        //                 Text(
        //                   '   Carpenter',
        //                   style: TextStyle(fontWeight: FontWeight.bold),
        //                 )
        //               ],
        //             ),
        //             SizedBox(
        //               height: 15,
        //             ),
        //             Row(
        //               children: [
        //                 Image.asset(
        //                   'assets/location.png',
        //                   height: 35,
        //                   width: 35,
        //                 ),
        //                 Text(
        //                   '   Biratnagar,Morang',
        //                   style: TextStyle(fontWeight: FontWeight.bold),
        //                 )
        //               ],
        //             ),
        //             SizedBox(
        //               height: 15,
        //             ),
        //             InkWell(
        //               child: Row(
        //                 children: [
        //                   Image.asset(
        //                     'assets/about.png',
        //                     height: 35,
        //                     width: 35,
        //                   ),
        //                   Text(
        //                     '   About Us',
        //                     style: TextStyle(fontWeight: FontWeight.bold),
        //                   )
        //                 ],
        //               ),
        //               onTap: (() {
        //                 Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                         builder: (BuildContext context) =>
        //                             AboutUs()));
        //               }),
        //             ),
        //             SizedBox(
        //               height: 15,
        //             ),
        //             Row(
        //               children: [
        //                 Image.asset(
        //                   'assets/profile_setting.png',
        //                   height: 35,
        //                   width: 35,
        //                 ),
        //                 InkWell(
        //                   child: Text(
        //                     '   Edit Profile',
        //                     style: TextStyle(fontWeight: FontWeight.bold),
        //                   ),
        //                   onTap: () {
        //                     Navigator.push(
        //                         context,
        //                         MaterialPageRoute(
        //                             builder: (BuildContext context) =>
        //                                 EditServiceman_setting()));
        //                   },
        //                 )
        //               ],
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),

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
