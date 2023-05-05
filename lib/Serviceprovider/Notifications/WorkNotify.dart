// ignore_for_file: file_names, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:homeservice/common/riverpod/repository/customer/CustomerRepository.dart';
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
              padding: const EdgeInsets.all(7),
              child: Card(
                child: SizedBox(
                    // height: height * 0.15,
                    width: width,
                    // ignore: prefer_const_constructors
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // CircleAvatar(
                          //     // backgroundImage: NetworkImage(
                          //     //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8J1vZp6TEiqy5hIf7GixH0J9s-ciz6R3qTJVSHpdQQw&s')
                          //     ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text(data[index].user!.fullName.toString()),
                          //     Text('22 Dec,2022'),
                          //   ],
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(data[index].description.toString()),
                              InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (BuildContext) => Serviman_Order(
                                  //               data: data[index],
                                  //             )));
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

                          SizedBox(height: height * 0.02),
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
