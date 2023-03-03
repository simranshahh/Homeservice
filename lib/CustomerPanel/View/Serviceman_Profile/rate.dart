// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Bottomnavbar/BottomNabBar.dart';

class RateServiceman extends ConsumerStatefulWidget {
  const RateServiceman({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RateServicemanState();
}

class _RateServicemanState extends ConsumerState<RateServiceman> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Review Now'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('We hope you had a great service!'),
            Text('Kindly rate and review your experience with'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/worker.jpg'),
                  radius: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      'Shyam Ram',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Carpenter')
                  ],
                )
              ],
            ),
            RatingBar.builder(
              initialRating: 0,
              minRating: 5,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemSize: 35,
              itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            Text('Let us know your experience.'),
            TextField(),
            ElevatedButton(
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
                              backgroundColor: MaterialStateProperty.all(
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
              child: Text('Submit Rating'),
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
