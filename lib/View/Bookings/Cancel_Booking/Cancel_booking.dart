// ignore_for_file: camel_case_types, prefer_const_constructors, file_names, unused_element

import 'package:flutter/material.dart';
import 'package:homeservice/Bottomnavbar/BottomNabBar.dart';
import 'package:homeservice/View/Bookings/Bookings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Cancel_Booking extends ConsumerStatefulWidget {
  const Cancel_Booking({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Cancel_BookingState();
}

class _Cancel_BookingState extends ConsumerState<Cancel_Booking> {
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

  // var holder_1 = [];

  // getItems() {
  //   numbers.forEach((key, value) {
  //     if (value == true) {
  //       holder_1.add(key);
  //     }
  //   });

  //   // Printing all selected items on Terminal screen.
  //   print(holder_1);
  //   // Here you will get all your selected Checkbox items.

  //   // Clear array after use.
  //   holder_1.clear();
  // }

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
                      activeColor: Colors.pink,
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
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 51.0),
                        child: TextField(),
                      ))),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    'assets/done.png',
                                    height: 100,
                                    width: 100,
                                  ),
                                  Text(
                                      '     Your Service has been    \n      Cancelled successfully!'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  BottomNavScreen()));
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.deepPurpleAccent),
                                    ),
                                    child: Text(
                                      'Go to Homepage',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 90, 36, 165)),
                      child: Text('Submit')))
            ],
          ),
        ),
      ),
    );
  }
}
