// ignore_for_file: camel_case_types, prefer_const_constructors, file_names, unused_element, must_be_immutable

import 'package:flutter/material.dart';
import 'package:homeservice/Customer/View/BottomnavScreen/BottomNabBar.dart';
import 'package:homeservice/Customer/View/Bookings/Bookings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/riverpod/provider/cancelbookingprovider.dart';

class Cancel_Booking extends ConsumerStatefulWidget {
  Cancel_Booking({this.id, super.key});
  String? id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Cancel_BookingState();
}

class _Cancel_BookingState extends ConsumerState<Cancel_Booking> {
  final _cancelKey = GlobalKey<FormState>();
  final descctrl = TextEditingController();

  Future<void> cancelBooking() async {
    if (_cancelKey.currentState!.validate()) {
      ref
          .read(cancelBookingNotifierProvider.notifier)
          .cancelBooking(widget.id!, descctrl.value.text, context);
    }
  }
  // bool isChecked = true;

  // List<bool> isChecked = [false, false,true,true,true,true];
  // int value = 0;

  // void initState() {
  //   super.initState();
  // }

  // _addCard() {
  //   setState(() {
  //     value = value + 1;
  //     print(value);
  //   });
  // }

  Map<String, bool> numbers = {
    'More Expensive': false,
    'Inappropriate timing and scheduling': false,
    'Order By Mistake': false,
    'For reordering': false,
    'Not needed at current': false,
    'Wanted to check the application': false,
  };

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        //MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Color.fromARGB(255, 90, 36, 165);
      }
      return Color.fromARGB(255, 90, 36, 165);
    }

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Form(
            key: _cancelKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Bookings()));
                    },
                    icon: Icon(Icons.arrow_back_ios)),
                Text(
                  'Cancel Booking',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView(
                    children: numbers.keys.map((String key) {
                      return CheckboxListTile(
                        title: Text(key),
                        value: numbers[key],
                        activeColor: Colors.deepPurpleAccent,
                        checkColor: Colors.white,
                        onChanged: (bool? value) {
                          setState(() {
                            numbers[key] = value!;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
                // Row(
                //   children: [
                //     Checkbox(
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(5.0),
                //       ),
                //       checkColor: Colors.white,
                //       fillColor: MaterialStateProperty.resolveWith(getColor),
                //       value: isChecked.,
                //       onChanged: (bool? value) {
                //         setState(() {
                //           isChecked = value!;
                //         });
                //       },
                //     ),
                //     Text('More Expensive')
                //   ],
                // ),
                // Row(
                //   children: [
                //     Checkbox(
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(5.0),
                //       ),
                //       checkColor: Colors.white,
                //       fillColor: MaterialStateProperty.resolveWith(getColor),
                //       value: isChecked,
                //       onChanged: (bool? value) {
                //         setState(() {
                //           isChecked = value!;
                //         });
                //       },
                //     ),
                //     Text('Inappropriate timing and scheduling.'),
                //   ],
                // ),
                // Row(
                //   children: [
                //     Checkbox(
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(5.0),
                //       ),
                //       checkColor: Colors.white,
                //       fillColor: MaterialStateProperty.resolveWith(getColor),
                //       value: isChecked,
                //       onChanged: (bool? value) {
                //         setState(() {
                //           isChecked = value!;
                //         });
                //       },
                //     ),
                //     Text('Order By Mistake')
                //   ],
                // ),
                // Row(
                //   children: [
                //     Checkbox(
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(5.0),
                //       ),
                //       checkColor: Colors.white,
                //       fillColor: MaterialStateProperty.resolveWith(getColor),
                //       value: isChecked,
                //       onChanged: (bool? value) {
                //         setState(() {
                //           isChecked = value!;
                //         });
                //       },
                //     ),
                //     Text('For reordering')
                //   ],
                // ),
                // Row(
                //   children: [
                //     Checkbox(
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(5.0),
                //       ),
                //       checkColor: Colors.white,
                //       fillColor: MaterialStateProperty.resolveWith(getColor),
                //       value: isChecked,
                //       onChanged: (bool? value) {
                //         setState(() {
                //           isChecked = value!;
                //         });
                //       },
                //     ),
                //     Text('Not needed at current')
                //   ],
                // ),
                // Row(
                //   children: [
                //     Checkbox(
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(5.0),
                //       ),
                //       checkColor: Colors.white,
                //       fillColor: MaterialStateProperty.resolveWith(getColor),
                //       value: isChecked,
                //       onChanged: (bool? value) {
                //         setState(() {
                //           isChecked = value!;
                //         });
                //       },
                //     ),
                //     Text('Wanted to check the application')
                //   ],
                // ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Other Reasons',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Card(
                    child: Container(
                        height: 100,
                        color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 51.0),
                          child: TextFormField(
                            
                            controller: descctrl,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter Reason",
                            ),
                          ),
                        ))),
                Center(
                    child: ElevatedButton(
                        onPressed: () {
                          cancelBooking();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 90, 36, 165)),
                        child: Text('Submit')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
