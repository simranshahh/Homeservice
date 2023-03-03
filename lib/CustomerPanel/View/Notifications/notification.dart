// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:homeservice/CustomerPanel/Bottomnavbar/BottomNabBar.dart';
import 'package:homeservice/CustomerPanel/Model/Notification/notification_model.dart';
import 'package:homeservice/CustomerPanel/View/Notifications/notification_detail.dart';
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
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
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
                                      maxLines: 3,
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
