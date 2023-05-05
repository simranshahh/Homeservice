// ignore_for_file: prefer_const_constructors, avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReviewModel {
  String user;
  String comments;
  String time;

  ReviewModel({required this.user, required this.comments, required this.time});
}

class Review extends ConsumerStatefulWidget {
  const Review({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReviewState();
}

class _ReviewState extends ConsumerState<Review> {
  List<ReviewModel> items = [
    ReviewModel(
        user: 'Ram Prasad', comments: 'Fabolous work', time: '2 days ago'),
    ReviewModel(
        user: 'Rama Prasad', comments: 'Good Job', time: '4 months ago'),
    ReviewModel(
        user: 'Ram Prasad', comments: 'Fabolous work', time: '2 days ago'),
    ReviewModel(
        user: 'Rama Prasad', comments: 'Good Job', time: '4 months ago'),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
              // height: height * 0.12,
              width: width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: 0,
                            minRating: 5,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Text(
                            items[index].time,
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      Text(
                        items[index].user,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(items[index].comments),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
