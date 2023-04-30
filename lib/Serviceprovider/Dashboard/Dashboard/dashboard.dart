// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last, unused_import

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:homeservice/Serviceprovider/Dashboard/Book/Completed/Completedpanel.dart';
import 'package:homeservice/Serviceprovider/Dashboard/Book/CurrentPanel/Currentpanel.dart';
import 'package:homeservice/Serviceprovider/Dashboard/Book/SchedulePanel/schedulepanel.dart';
import 'package:homeservice/Serviceprovider/Dashboard/Dashboard/Ratings.dart';
import 'package:homeservice/Serviceprovider/Dashboard/Dashboard/reviews.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
        title: const Text(
          'Welcome to Saajha',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18, top: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello Ram Prasad',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'Welcome to Saajha!',
                style: TextStyle(color: Colors.grey),
              ),
              Container(
                height: height * 0.2,
                child: ListView(children: [
                  CarouselSlider(
                    items: [
                      Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage("assets/swap.jpg"),
                            // fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage("assets/swap1.jpg"),
                            // fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage("assets/swap.jpg")),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      // height: 380.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  ),
                ]),
              ),
              // Container(
              //   height: height * 0.2,
              //   child: ListView(children: [
              //     CarouselSlider(
              //       items: [
              //         Container(
              //           height: height * 0.2,
              //           child: ListView(children: [
              //             CarouselSlider(
              //               items: [
              //                 Container(
              //                   margin: EdgeInsets.all(8.0),
              //                   decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(10.0),
              //                     image: DecorationImage(
              //                       image: AssetImage("assets/swap.jpg"),
              //                       // fit: BoxFit.cover,
              //                     ),
              //                   ),
              //                 ),
              //                 Container(
              //                   margin: EdgeInsets.all(8.0),
              //                   decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(10.0),
              //                     image: DecorationImage(
              //                       image: AssetImage("assets/swap1.jpg"),
              //                       // fit: BoxFit.cover,
              //                     ),
              //                   ),
              //                 ),
              //                 Container(
              //                   margin: EdgeInsets.all(8.0),
              //                   decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(10.0),
              //                     image: DecorationImage(
              //                         image: AssetImage("assets/swap.jpg")),
              //                   ),
              //                 ),
              //               ],
              //               options: CarouselOptions(
              //                 // height: 380.0,
              //                 enlargeCenterPage: true,
              //                 autoPlay: true,
              //                 aspectRatio: 16 / 9,
              //                 autoPlayCurve: Curves.fastOutSlowIn,
              //                 enableInfiniteScroll: true,
              //                 autoPlayAnimationDuration:
              //                     Duration(milliseconds: 800),
              //                 viewportFraction: 0.8,
              //               ),
              //             ),
              //           ]),
              //         ),
              //       ],
              //       options: CarouselOptions(
              //         // height: 380.0,
              //         enlargeCenterPage: true,
              //         autoPlay: true,
              //         aspectRatio: 16 / 9,
              //         autoPlayCurve: Curves.fastOutSlowIn,
              //         enableInfiniteScroll: true,
              //         autoPlayAnimationDuration: Duration(milliseconds: 800),
              //         viewportFraction: 0.8,
              //       ),
              //     ),
              //   ]),
              // ),
              Card(
                child: Container(
                  height: height * 0.125,
                  width: width * 0.9,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('My service:'),
                            Text(
                              'Carpenter',
                              style: TextStyle(
                                  color: Colors.deepPurpleAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                            // Image.asset(
                            //   'assets/serviceman/star.png',
                            //   height: 20,
                            //   width: 20,
                            // )
                          ],
                        ),
                        Row(
                          children: [
                            Text('Location:'),
                            Text(
                              'Biratnagar',
                              style: TextStyle(
                                  color: Colors.deepPurpleAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: height * 0.124,
                    width: width * 0.35,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '125',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Total Bookings',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      height: height * 0.124,
                      width: width * 0.35,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '5',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Total Current',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CurrentPanel()));
                    }),
                  )
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    child: Container(
                      height: height * 0.124,
                      width: width * 0.35,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '15',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Scheduled',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ScheduledPanel()));
                    },
                  ),
                  InkWell(
                    child: Container(
                      height: height * 0.124,
                      width: width * 0.35,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '25',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Completed',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CompletededPanel()));
                    },
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Ratings & Reviews',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Container(height: 100, color: Colors.red, child: Ratings()),
              SizedBox(
                height: 20,
              ),
              Text('Reviews'),
              SizedBox(
                height: 10,
              ),
              Container(height: height, child: Review())
            ],
          ),
        ),
      ),
    );
  }
}
