// ignore_for_file: file_names
// // ignore_for_file: camel_case_types, prefer_const_constructors, file_names, unused_element, must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:homeservice/Customer/View/Bookings/Bookings.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../../../common/riverpod/provider/cancelbookingprovider.dart';

// class SPCancel_Booking extends ConsumerStatefulWidget {
//   SPCancel_Booking({this.id, super.key});
//   String? id;

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _SPCancel_BookingState();
// }

// class _SPCancel_BookingState extends ConsumerState<SPCancel_Booking> {
//   final _cancelKey = GlobalKey<FormState>();
//   final descctrl = TextEditingController();

//   Future<void> cancelBooking() async {
//     if (_cancelKey.currentState!.validate()) {
//       ref
//           .read(cancelBookingNotifierProvider.notifier)
//           .cancelBooking(widget.id!, descctrl.value.text, context);
//     }
//   }

//   Map<String, bool> numbers = {
//     'More Expensive': false,
//     'Inappropriate timing and scheduling': false,
//     'Order By Mistake': false,
//     'For reordering': false,
//     'Not needed at current': false,
//     'Wanted to check the application': false,
//   };

//   @override
//   Widget build(BuildContext context) {
//     Color getColor(Set<MaterialState> states) {
//       const Set<MaterialState> interactiveStates = <MaterialState>{
//         MaterialState.pressed,
//         MaterialState.hovered,
//       };
//       if (states.any(interactiveStates.contains)) {
//         return Color.fromARGB(255, 90, 36, 165);
//       }
//       return Color.fromARGB(255, 90, 36, 165);
//     }

//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.only(left: 18.0),
//           child: Form(
//             key: _cancelKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 IconButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (BuildContext context) => Bookings()));
//                     },
//                     icon: Icon(Icons.arrow_back_ios)),
//                 Text(
//                   'Cancel Booking',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                   'Other Reasons',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 Card(
//                     child: SizedBox(
//                         // height: 400,
//                         child: TextFormField(
//                   controller: descctrl,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     hintText: "Enter Reason",
//                   ),
//                 ))),
//                 Center(
//                     child: ElevatedButton(
//                         onPressed: () {
//                           cancelBooking();
//                         },
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: Color.fromARGB(255, 90, 36, 165)),
//                         child: Text('Submit')))
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
