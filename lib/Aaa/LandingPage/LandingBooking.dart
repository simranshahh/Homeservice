// ignore_for_file: sort_child_properties_last, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LandingBooking extends ConsumerStatefulWidget {
  const LandingBooking({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LandingBookingState();
}

class _LandingBookingState extends ConsumerState<LandingBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookings'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/landingsignup.png',
              height: 200,
              width: 200,
            ),
            Text('Signin to Book'),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (BuildContext context) => Signup()));
              },
              child: Text('Join Now'),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.deepPurpleAccent)),
            )
          ],
        ),
      ),
    );
  }
}
