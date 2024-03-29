// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/riverpod/repository/ServiceProvider/ServiceProviderRepository.dart';

class CompletededPanelModel {
  String status;
  String amount;
  String code;
  String address;
  String time;
  String customer;

  CompletededPanelModel(
      {required this.status,
      required this.amount,
      required this.code,
      required this.address,
      required this.time,
      required this.customer});
}

class CompletededPanel extends ConsumerStatefulWidget {
  const CompletededPanel({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CompletededPanelState();
}

class _CompletededPanelState extends ConsumerState<CompletededPanel> {
  @override
  Widget build(BuildContext context) {
    final completedDetails = ref.watch(spcompletedprovider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text(
            'Completed Bookings',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: completedDetails.when(
          data: (data) => data.isEmpty
              ? Center(
                  child: Text('NO DATA'),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 18.0),
                        child: Stack(
                          children: [
                            Container(
                              height: 200,
                              width: 350,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.grey)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 70,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 20,
                                        // width: 50,
                                        color:
                                            Color.fromARGB(255, 250, 164, 157),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: Text(
                                              'Completed',
                                              style: TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        data[index].note.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // Text('Rs. $price/hr'),
                                    ],
                                  ),
                                  // SizedBox(
                                  //     // width: 100,
                                  //     ),
                                  // Text('#1397')
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 88, 0, 0),
                              child: Container(
                                height: 100,
                                width: 330,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color.fromARGB(255, 231, 231, 231),
                                  //border: Border.all(color: Colors.grey)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Date & Time: '),
                                          Text(
                                              '${data[index].date} at ${data[index].time}'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('Customer Name:'),
                                          Text(data[index]
                                              .user!
                                              .fullName
                                              .toString()),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('Customer Address: '),
                                          Text(
                                            data[index]
                                                .user!
                                                .address
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
