// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, sort_child_properties_last, unused_local_variable

// import 'package:flutter/material.dart';
// import 'package:homeservice/Customer/View/Settings/aboutus.dart';
// import 'package:homeservice/common/auth/signin.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class LandingPageAboutus extends ConsumerStatefulWidget {
//   const LandingPageAboutus({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _LandingPageAboutusState();
// }

// class _LandingPageAboutusState extends ConsumerState<LandingPageAboutus> {
//   bool isDarkModeEnabled = false;

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;

//     return SafeArea(
//       child: Scaffold(
//         body: Stack(children: [
//           Container(
//             height: height * 0.25,
//             // width: 370,
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment(0.8, 1),
//                   colors: <Color>[
//                     Color.fromARGB(255, 57, 8, 156),
//                     Color.fromARGB(255, 132, 66, 224),
//                   ],
//                   tileMode: TileMode.mirror,
//                 ),
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(40),
//                     bottomRight: Radius.circular(40))),
//             child: Padding(
//               padding: const EdgeInsets.all(30.0),
//               child: Align(
//                 alignment: Alignment.topCenter,
//                 child: Text(
//                   'Profile',
//                   style: TextStyle(
//                       color: Colors.white,
//                       // fontWeight: FontWeight.bold,
//                       fontSize: height * 0.03),
//                 ),
//               ),
//             ),
//           ),
//           // Padding(
//           //   padding: const EdgeInsets.all(40.0),
//           //   child: Row(
//           //     mainAxisAlignment: MainAxisAlignment.center,
//           //     children: [
//           //       // IconButton(
//           //       //   onPressed: () {
//           //       //     Navigator.push(
//           //       //         context,
//           //       //         MaterialPageRoute(
//           //       //             builder: (BuildContext context) =>
//           //       //                 BottomNavScreen()));
//           //       //   },
//           //       //   icon: Icon(Icons.arrow_back_ios),
//           //       //   color: Colors.white,
//           //       // ),
//           //       // SizedBox(
//           //       //   width: 70,
//           //       // ),
//           //       Text(
//           //         'Profile',
//           //         style: TextStyle(
//           //             color: Colors.white,
//           //             // fontWeight: FontWeight.bold,
//           //             fontSize: 18),
//           //       ),
//           //       SizedBox(
//           //         width: 115,
//           //       ),
//           //       // IconButton(
//           //       //     icon: Icon(MyApp.themeNotifier.value == ThemeMode.light
//           //       //         ? Icons.dark_mode
//           //       //         : Icons.light_mode),
//           //       //     onPressed: () {
//           //       //       MyApp.themeNotifier.value =
//           //       //           MyApp.themeNotifier.value == ThemeMode.light
//           //       //               ? ThemeMode.dark
//           //       //               : ThemeMode.light;
//           //       //     }),
//           //     ],
//           //   ),
//           // ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(130.0, 128, 18, 18),
//             child: CircleAvatar(
//               radius: 50,
//               backgroundColor: Colors.grey,
//               // backgroundImage: AssetImage('assets/worker.jpg'),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(8.0, 230, 8, 0),
//             child: Stack(children: [
//               Card(
//                 child: Container(
//                   height: 400,
//                   width: 380,
//                   color: Colors.white,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(28.0),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Image.asset(
//                             'assets/name.png',
//                             height: 40,
//                             width: 40,
//                           ),
//                           Text(
//                             '   Your Name',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       Row(
//                         children: [
//                           Image.asset(
//                             'assets/mail.png',
//                             height: 35,
//                             width: 35,
//                           ),
//                           Text(
//                             '   Your E-mail',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       Row(
//                         children: [
//                           Image.asset(
//                             'assets/call.png',
//                             height: 35,
//                             width: 35,
//                           ),
//                           Text(
//                             '   Your Number',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       Row(
//                         children: [
//                           Image.asset(
//                             'assets/location.png',
//                             height: 35,
//                             width: 35,
//                           ),
//                           Text(
//                             '   Your Location',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       InkWell(
//                         child: Row(
//                           children: [
//                             Image.asset(
//                               'assets/about.png',
//                               height: 35,
//                               width: 35,
//                             ),
//                             Text(
//                               '   About Us',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             )
//                           ],
//                         ),
//                         onTap: (() {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (BuildContext context) =>
//                                       CustomerAboutus()));
//                         }),
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       // Row(
//                       //   children: [
//                       //     Image.asset(
//                       //       'assets/profile_setting.png',
//                       //       height: 35,
//                       //       width: 35,
//                       //     ),
//                       //     InkWell(
//                       //       child: Text(
//                       //         '   Edit Profile',
//                       //         style: TextStyle(fontWeight: FontWeight.bold),
//                       //       ),
//                       //       onTap: () {
//                       //         Navigator.push(
//                       //             context,
//                       //             MaterialPageRoute(
//                       //                 builder: (BuildContext context) =>
//                       //                     Edit_ProfilePage()));
//                       //       },
//                       //     )
//                       //   ],
//                       // ),
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.pushAndRemoveUntil(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (BuildContext context) => Signin()),
//                             (route) => false,
//                           );
//                         },
//                         child: Text('Sign In'),
//                         style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.all(
//                                 Colors.deepPurpleAccent)),
//                       )
//                     ],
//                   ),
//                 ),
//               ),

//               // Padding(
//               //   padding: const EdgeInsets.fromLTRB(30, 278, 0, 0),
//               //   child: DayNightSwitcher(
//               //       isDarkModeEnabled: isDarkModeEnabled,
//               //       onStateChanged: onStateChanged),
//               // ),
//               // Padding(
//               //   padding: EdgeInsets.only(top: 330, left: 30),
//               //   child: Text('Dark mode is ' +
//               //       (isDarkModeEnabled ? 'enabled' : 'disabled') +
//               //       '.'),
//               // ),
//             ]),
//           )
//         ]),
//       ),
//     );
//   }

//   // void onStateChanged(bool isDarkModeEnabled) {
//   //   setState(() {
//   //     this.isDarkModeEnabled = isDarkModeEnabled;
//   //   });
//   // }
// }
