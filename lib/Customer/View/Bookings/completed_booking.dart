// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:homeservice/Customer/View/Bookings/Cancel_Booking/Cancel_booking.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Completed extends ConsumerStatefulWidget {
  const Completed({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CompletedState();
}

class _CompletedState extends ConsumerState<Completed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              height: 110,
              width: 370,
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Painter',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: 160,
                        ),
                        InkWell(
                          child: Container(
                            height: 20,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 148, 33, 25),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: Text(
                              'Cancel',
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Cancel_Booking()));
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Wall Painting'),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Scheduled time: 02-02-2022  4.00PM',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}