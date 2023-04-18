// ignore_for_file: file_names
// // ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, file_names, unused_import

// import 'package:flutter/material.dart';
// import 'package:homeservice/CustomerPanel/View/SignIn/customersignin.dart';
// import 'package:homeservice/CustomerPanel/View/SignIn/signin.dart';
// import 'package:homeservice/CustomerPanel/View/Signup/Customersignup.dart';
// import 'package:homeservice/CustomerPanel/View/StartScreen.dart/onboarding_example.dart';

// import '../Signup/edfre.dart';

// class Welcome extends StatefulWidget {
//   const Welcome({super.key});

//   @override
//   State<Welcome> createState() => _WelcomeState();
// }

// class _WelcomeState extends State<Welcome> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           body: Stack(
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 90, 36, 165),
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(15),
//                     bottomRight: Radius.circular(15))),
//             height: MediaQuery.of(context).size.height * 0.6,
//             width: MediaQuery.of(context).size.width,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: IconButton(
//               color: Colors.white,
//               icon: Icon(Icons.arrow_back_ios),
//               onPressed: () {
//                 Navigator.of(context).pushReplacement(MaterialPageRoute(
//                     builder: (BuildContext context) => OnBoard()));
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(82.0),
//             child: Image.asset('assets/whitelogo.png'),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20.0, 250, 20, 0),
//             child: Card(
//               child: Container(
//                 height: 370,
//                 width: 410,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20)),
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(25, 20, 10, 0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         '         \n             Welcome to SAAJHA',
//                         style: TextStyle(
//                             color: Color.fromARGB(255, 84, 84, 84),
//                             fontWeight: FontWeight.bold,
//                             fontSize: 15),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text('Discover Amazing Facilities At Home'),
//                       SizedBox(
//                         height: 60,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Navigator.of(context).pushReplacement(
//                               MaterialPageRoute(
//                                   builder: (BuildContext context) => Signin()));
//                         },
//                         child: Container(
//                           height: 40,
//                           width: 250,
//                           decoration: BoxDecoration(
//                               color: Color.fromARGB(255, 90, 36, 165),
//                               borderRadius: BorderRadius.circular(15)),
//                           child: Center(
//                             child: Text(
//                               'Sign In',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Navigator.of(context).pushReplacement(
//                               MaterialPageRoute(
//                                   builder: (BuildContext context) => SignUp()));
//                         },
//                         child: Container(
//                           height: 40,
//                           width: 250,
//                           decoration: BoxDecoration(
//                               color: Color.fromARGB(255, 255, 255, 255),
//                               border: Border.all(
//                                 color: Color.fromARGB(255, 90, 36, 165),
//                               ),
//                               borderRadius: BorderRadius.circular(15)),
//                           child: Center(
//                             child: Text(
//                               'Sign Up',
//                               style: TextStyle(
//                                 color: Color.fromARGB(255, 90, 36, 165),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       )),
//     );
//   }
// }
