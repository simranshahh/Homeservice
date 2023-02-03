// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Model/Carpenter/workers.dart';

class Repair extends ConsumerStatefulWidget {
  const Repair({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RepairState();
}

class _RepairState extends ConsumerState<Repair> {
  List<WorkerDetails> Details = [
    WorkerDetails(
        Profile: 'assets/worker.jpg',
        Jobno: '122',
        Rate: 'Rs.200/hr',
        name: 'Ram Prasad'),
    WorkerDetails(
        Profile: 'assets/worker.jpg',
        Jobno: '122',
        Rate: 'Rs.200/hr',
        name: 'Hari Krishna'),
    WorkerDetails(
        Profile: 'assets/worker.jpg',
        Jobno: '122',
        Rate: 'Rs.200/hr',
        name: 'Dangol Kanxa'),
    WorkerDetails(
        Profile: 'assets/worker.jpg',
        Jobno: '122',
        Rate: 'Rs.200/hr',
        name: 'Shyam Hari'),
    WorkerDetails(
        Profile: 'assets/worker.jpg',
        Jobno: '122',
        Rate: 'Rs.200/hr',
        name: 'Fanah Riyaz'),
    WorkerDetails(
        Profile: 'assets/worker.jpg',
        Jobno: '122',
        Rate: 'Rs.200/hr',
        name: 'Wagle Kiran'),
    WorkerDetails(
        Profile: 'assets/worker.jpg',
        Jobno: '122',
        Rate: 'Rs.200/hr',
        name: 'Maya Tana'),
    WorkerDetails(
        Profile: 'assets/worker.jpg',
        Jobno: '122',
        Rate: 'Rs.200/hr',
        name: 'Nirab Luitel'),
    WorkerDetails(
        Profile: 'assets/worker.jpg',
        Jobno: '122',
        Rate: 'Rs.200/hr',
        name: 'Sana sana'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
            itemCount: Details.length,
            itemBuilder: (BuildContext context, index) {
              return Stack(children: [
                Card(
                  elevation: 5.0,
                  child: Container(
                    height: 100,
                    width: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(35)),
                        child: Image.asset(
                          'assets/worker.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ignore: prefer_const_constructors
                            Text(
                              Details[index].name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Rating',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    RatingBar.builder(
                                      initialRating: 2,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 1,
                                      itemSize: 20,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 0.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Jobs',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      Details[index].Jobno,
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Rate',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      Details[index].Rate,
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ]);
            }),
      ),
    );
  }
}
