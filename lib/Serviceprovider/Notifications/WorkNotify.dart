// ignore_for_file: file_names, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:homeservice/Serviceprovider/Notifications/Customerorder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Serviceman_Notification extends ConsumerStatefulWidget {
  const Serviceman_Notification({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _Serviceman_NotificationState();
}

class _Serviceman_NotificationState
    extends ConsumerState<Serviceman_Notification> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Card(
        child: Container(
            height: height * 0.15,
            width: width * 1,
            color: Colors.white,
            // ignore: prefer_const_constructors
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                    // backgroundImage: NetworkImage(
                    //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8J1vZp6TEiqy5hIf7GixH0J9s-ciz6R3qTJVSHpdQQw&s')
                    ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Hari Ram'),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Repair Chair'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Column(
                    // // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('22 Dec,2022 11.00 AM'),
                      Padding(
                        padding: const EdgeInsets.only(left: 98.0),
                        child: Row(
                          children: [
                            Text('View'),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext) =>
                                              Customer_Order()));
                                },
                                icon: Icon(Icons.arrow_forward_ios))
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
