// ignore_for_file: file_names
// // ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, unused_field

// import 'package:flutter/material.dart';

// class NewPassword extends StatefulWidget {
//   const NewPassword({super.key});

//   @override
//   State<NewPassword> createState() => _NewPasswordState();
// }

// class _NewPasswordState extends State<NewPassword> {
//   bool isChecked = true;
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     Color getColor(Set<MaterialState> states) {
//       const Set<MaterialState> interactiveStates = <MaterialState>{
//         MaterialState.pressed,
//         MaterialState.hovered,
//         //MaterialState.focused,
//       };
//       if (states.any(interactiveStates.contains)) {
//         return Color.fromARGB(255, 90, 36, 165);
//       }
//       return Color.fromARGB(255, 90, 36, 165);
//     }

//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: Colors.white,
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.fromLTRB(18, 18, 0, 45),
//               child: Row(
//                 children: [
//                   Icon(Icons.arrow_back_ios_new),
//                   SizedBox(
//                     width: 15,
//                   ),
//                   Text(
//                     'Create New Password',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                   ),
//                 ],
//               ),
//             ),
//             Center(
//               child: Image.asset(
//                 'assets/newpass.png',
//                 height: 230,
//                 width: 250,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 25.0, top: 23),
//               child: Text('Create Your New Password'),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
//               child: SizedBox(
//                 height: 45,
//                 child: TextField(
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.lock),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5)),
//                     labelText: 'Email',
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(18.0, 18, 18, 5),
//               child: SizedBox(
//                 height: 45,
//                 child: TextField(
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.lock),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5)),
//                     labelText: 'Password',
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 88.0),
//               child: Row(
//                 children: [
//                   Checkbox(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                     checkColor: Colors.white,
//                     fillColor: MaterialStateProperty.resolveWith(getColor),
//                     value: isChecked,
//                     onChanged: (bool? value) {
//                       setState(() {
//                         isChecked = value!;
//                       });
//                     },
//                   ),
//                   Text('Remember me')
//                 ],
//               ),
//             ),
//             Center(
//               child: InkWell(
//                 child: Container(
//                   height: 50,
//                   width: 320,
//                   decoration: BoxDecoration(
//                       color: Color.fromARGB(255, 90, 36, 165),
//                       borderRadius: BorderRadius.circular(25)),
//                   child: Center(
//                     child: Text(
//                       'Continue',
//                       style: TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//                 onTap: () => {
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         content: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Image.asset(
//                               'assets/popup.png',
//                               height: 110,
//                               width: 110,
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               'Congratulations',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Color.fromARGB(255, 90, 36, 165)),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               '   Your account is ready to use.You will be redirected to the Home Pafe in few seconds!',
//                               style: TextStyle(fontSize: 10),
//                             ),
//                             SizedBox(
//                               height: 15,
//                             ),
//                             CircleAvatar(
//                                 backgroundColor:
//                                     Color.fromARGB(255, 90, 36, 165),
//                                 child: IconButton(
//                                     icon:
//                                         Center(child: Icon(Icons.done_rounded)),
//                                     onPressed: () {
//                                       Navigator.pop(context);
//                                     })),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
