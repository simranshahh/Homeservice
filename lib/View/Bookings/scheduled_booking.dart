// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Scheduled extends ConsumerStatefulWidget {
  const Scheduled({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScheduledState();
}

class _ScheduledState extends ConsumerState<Scheduled> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              height: 110,
              width: 370,
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Painter',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Wall Painting'),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Scheduled for: 02-02-2022  4.00PM',
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
