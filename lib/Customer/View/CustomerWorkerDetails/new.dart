// ignore_for_file: camel_case_types, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:homeservice/Serviceprovider/View/Serviceman_Profile/Serviceman_Profile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/riverpod/models/ServiceDetails.dart';

// ignore: must_be_immutable
class New_Order extends ConsumerStatefulWidget {
  New_Order({this.detaillist, super.key});
  FutureProvider<List<ServiceDetails>>? detaillist;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _New_OrderState();
}

class _New_OrderState extends ConsumerState<New_Order> {
  @override
  Widget build(BuildContext context) {
    final services = ref.watch(widget.detaillist!);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text('Service Providers'),
      ),
      body: services.when(
        data: (data) => Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, index) {
                return InkWell(
                  onTap: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Serviceman_Profile(
                                  one: data[index],
                                )));
                  }),
                  child: Stack(children: [
                    Card(
                      elevation: 5.0,
                      child: Container(
                        height: 125,
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
                                Text(
                                  data[index].fullName.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      data[index].address.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        const Text(
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
                                              const EdgeInsets.symmetric(
                                                  horizontal: 0.0),
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          'Jobs',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          data[index].role.toString(),
                                          style: const TextStyle(fontSize: 12),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          'Rate',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          data[index].price.toString(),
                                          style: const TextStyle(fontSize: 12),
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
                  ]),
                );
              }),
        ),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
