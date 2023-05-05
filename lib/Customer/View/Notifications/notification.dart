// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:homeservice/Customer/View/BottomnavScreen/BottomNabBar.dart';
import 'package:homeservice/Customer/Model/Notification/notification_model.dart';
import 'package:homeservice/Customer/View/Notifications/notification_detail.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Notification_page extends ConsumerStatefulWidget {
  const Notification_page({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _Notification_pageState();
}

class _Notification_pageState extends ConsumerState<Notification_page> {
  List<Notification_items> items = [
    // Notification_items(
    //     image: 'assets/offer.jpg',
    //     title: 'Special Offer',
    //     subtitle: 'The winter season brings \nyou the lots of offers',
    //     date: '02.02.2022'),
    Notification_items(
        image: 'assets/offer.jpg',
        title: 'Winter Offer',
        subtitle: 'The winter season brings \nyou the lots of offers',
        date: '02.02.2022'),
    Notification_items(
        image: 'assets/offer.jpg',
        title: 'Bonus Bonus Bonus ',
        subtitle: 'The winter season brings \nyou the lots of offers',
        date: '02.02.2022'),
    Notification_items(
        image: 'assets/offer.jpg',
        title: 'Refer and Win',
        subtitle: 'The winter season brings \nyou the lots of offers',
        date: '02.02.2022'),
    Notification_items(
        image: 'assets/offer.jpg',
        title: 'Get the best offer!',
        subtitle: 'The winter season brings \nyou the lots of offers',
        date: '02.02.2022'),
    Notification_items(
        image: 'assets/offer.jpg',
        title: 'Special Offer',
        subtitle: 'The winter season brings \nyou the lots of offers',
        date: '02.02.2022'),
  ];

  List<AdminNotification> notify = [
    AdminNotification(
        heading: 'Appointment Completed',
        subheading: 'Appointment for laundary has been completed',
        time: '02.02.2022 Dec 2022'),
    AdminNotification(
        heading: 'Appointment Started',
        subheading: 'Appointment for laundary has been startes.',
        time: '02.02.2022 Dec 2022'),
    AdminNotification(
        heading: 'Provider Arriving.',
        subheading: 'Provider is coming for laundary.',
        time: '02.02.2022 Dec 2022'),
    AdminNotification(
        heading: 'Appointment Accepted',
        subheading: 'Provider has accepted the appointment.',
        time: '02.02.2022 Dec 2022')
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  height: 110,
                  width: 390,
                  color: (Color.fromARGB(255, 90, 36, 165)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        BottomNavScreen()));
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: 60,
                      ),
                      Text(
                        'Notifications',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ]),
              Container(
                height: height,
                child: ListView.builder(
                    itemCount: notify.length,
                    itemBuilder: (BuildContext context, index) {
                      return Card(
                        child: Container(
                          height: 100,
                          width: width,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      notify[index].heading,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(notify[index].time)
                                  ],
                                ),
                                Text(notify[index].subheading)
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                height: height,
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Notifcation_detail_page(
                                      notification_details: items[index],
                                    )));
                      }),
                      child: Stack(children: [
                        Card(
                          child: Container(
                            height: 130,
                            // width: 390,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                items[index].image,
                                height: 110,
                                width: 110,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      items[index].title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      items[index].subtitle,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      items[index].date,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
