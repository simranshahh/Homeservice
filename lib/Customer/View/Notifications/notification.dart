// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../Bookings/Customerorder.dart';
import '../../../common/riverpod/repository/customer/CustomerRepository.dart';

class Notification_page extends ConsumerStatefulWidget {
  const Notification_page({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _Notification_pageState();
}

class _Notification_pageState extends ConsumerState<Notification_page> {
  // List<Notification_items> items = [
  //   // Notification_items(
  //   //     image: 'assets/offer.jpg',
  //   //     title: 'Special Offer',
  //   //     subtitle: 'The winter season brings \nyou the lots of offers',
  //   //     date: '02.02.2022'),
  //   Notification_items(
  //       image: 'assets/offer.jpg',
  //       title: 'Winter Offer',
  //       subtitle: 'The winter season brings \nyou the lots of offers',
  //       date: '02.02.2022'),
  //   Notification_items(
  //       image: 'assets/offer.jpg',
  //       title: 'Bonus Bonus Bonus ',
  //       subtitle: 'The winter season brings \nyou the lots of offers',
  //       date: '02.02.2022'),
  //   Notification_items(
  //       image: 'assets/offer.jpg',
  //       title: 'Refer and Win',
  //       subtitle: 'The winter season brings \nyou the lots of offers',
  //       date: '02.02.2022'),
  //   Notification_items(
  //       image: 'assets/offer.jpg',
  //       title: 'Get the best offer!',
  //       subtitle: 'The winter season brings \nyou the lots of offers',
  //       date: '02.02.2022'),
  //   Notification_items(
  //       image: 'assets/offer.jpg',
  //       title: 'Special Offer',
  //       subtitle: 'The winter season brings \nyou the lots of offers',
  //       date: '02.02.2022'),
  // ];

  // List<AdminNotification> notify = [
  //   AdminNotification(
  //       heading: 'Appointment Completed',
  //       subheading: 'Appointment for laundary has been completed',
  //       time: '02.02.2022 Dec 2022'),
  //   AdminNotification(
  //       heading: 'Appointment Started',
  //       subheading: 'Appointment for laundary has been startes.',
  //       time: '02.02.2022 Dec 2022'),
  //   AdminNotification(
  //       heading: 'Provider Arriving.',
  //       subheading: 'Provider is coming for laundary.',
  //       time: '02.02.2022 Dec 2022'),
  //   AdminNotification(
  //       heading: 'Appointment Accepted',
  //       subheading: 'Provider has accepted the appointment.',
  //       time: '02.02.2022 Dec 2022')
  // ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final notifi = ref.watch(notificationprovider);

    return Scaffold(
        appBar: AppBar(
          title: Text('Notifications'),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: notifi.when(
          data: (data) => ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(2),
              child: Card(
                child: SizedBox(
                    // height: height * 0.15,
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(height: height * 0.01),

                          // CircleAvatar(
                          //     // backgroundImage: NetworkImage(
                          //     //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8J1vZp6TEiqy5hIf7GixH0J9s-ciz6R3qTJVSHpdQQw&s')
                          //     ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(data[index].description.toString()),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          // ignore: non_constant_identifier_names
                                          builder: (BuildContext context) =>
                                              Customer_Order(
                                                data: data[index],
                                              )));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'View',
                                      style: TextStyle(
                                          color: Colors.deepPurple,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.deepPurple,
                                    )
                                  ],
                                ),
                              ),
                              // Text('11.00 AM'),
                            ],
                          ),
                          // SizedBox(height: height * 0.02),

                          SizedBox(height: height * 0.01),
                        ],
                      ),
                    )),
              ),
            ),
          ),
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
