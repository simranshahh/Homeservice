// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_print, file_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/riverpod/repository/customer/CustomerRepository.dart';

class Ratings extends ConsumerStatefulWidget {
  const Ratings({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RatingsState();
}

class _RatingsState extends ConsumerState<Ratings> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final info = ref.watch(roleinfo);

    return SafeArea(
      child: Scaffold(
        body: info.when(
          data: (data) => ListView.builder(
            itemCount: data!.ratings!.length,
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
                            SizedBox(
                              width: 100,
                            ),
                            // Text(
                            //   data.ratings![index].user.toString(),
                            //   style: TextStyle(color: Colors.grey),
                            // )
                          ],
                        ),
                        Text(
                          data.ratings![index].description.toString(),
                        ),
                        // Text(items[index].comments),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
