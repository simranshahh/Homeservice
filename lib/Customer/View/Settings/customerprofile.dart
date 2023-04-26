// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:homeservice/Customer/View/BottomnavScreen/BottomNabBar.dart';
import 'package:homeservice/Customer/View/Settings/Edit_Profile.dart';
import 'package:homeservice/Customer/View/Settings/aboutus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/riverpod/provider/customerSignup_provider.dart';

class Customer_setting extends ConsumerStatefulWidget {
  const Customer_setting({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _Customer_settingState();
}

class _Customer_settingState extends ConsumerState<Customer_setting> {
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final cusinfo = ref.watch(customerinfoprovider);
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Container(
            height: height * 0.3,
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
                            builder: (BuildContext context) =>
                                BottomNavScreen()));
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
                // IconButton(
                //     icon: Icon(MyApp.themeNotifier.value == ThemeMode.light
                //         ? Icons.dark_mode
                //         : Icons.light_mode),
                //     onPressed: () {
                //       MyApp.themeNotifier.value =
                //           MyApp.themeNotifier.value == ThemeMode.light
                //               ? ThemeMode.dark
                //               : ThemeMode.light;
                //     }),
              ],
            ),
          ),
          cusinfo.when(
            data: (data) => data == null
                ? Text("No data")
                : Padding(
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
                                              data.fullName.toString(),
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
                                              data.email.toString(),
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
                                              data.phone.toString(),
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
                                              data.address.toString(),
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
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          onTap: (() {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        CustomerAboutus()));
                                          }),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        // Row(
                                        //   children: [
                                        //     Image.asset(
                                        //       'assets/profile_setting.png',
                                        //       height: 35,
                                        //       width: 35,
                                        //     ),
                                        //     InkWell(
                                        //       child: Text(
                                        //         '   Edit Profile',
                                        //         style: TextStyle(
                                        //             fontWeight:
                                        //                 FontWeight.bold),
                                        //       ),
                                        //       onTap: () {
                                        //         Navigator.push(
                                        //             context,
                                        //             MaterialPageRoute(
                                        //                 builder: (BuildContext
                                        //                         context) =>
                                        //                     Edit_ProfilePage()));
                                        //       },
                                        //     )
                                        //   ],
                                        // ),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Text('Log Out'),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.deepPurpleAccent)),
                                        )
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
                          ],
                        ),
                      ),
                    ),
                  ),
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
          ),
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
