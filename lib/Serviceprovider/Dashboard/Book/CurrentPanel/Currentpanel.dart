// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CurrrentPanelModel {
  String status;
  String amount;
  String code;
  String address;
  String time;
  String customer;

  CurrrentPanelModel(
      {required this.status,
      required this.amount,
      required this.code,
      required this.address,
      required this.time,
      required this.customer});
}

class CurrentPanel extends ConsumerStatefulWidget {
  const CurrentPanel({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CurrentPanelState();
}

class _CurrentPanelState extends ConsumerState<CurrentPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(
          'Curent Bookings',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 20,
                              width: 50,
                              color: Color.fromARGB(255, 250, 164, 157),
                              child: Center(
                                child: Text(
                                  'On Going',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                            Text(
                              'Wood or White Cedar',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('\$80.80/hr'),
                          ],
                        ),
                        SizedBox(
                            // width: 100,
                            ),
                        Text('#1397')
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Address: '),
                                Text(
                                  'Biratnagar ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Date & Time:'),
                                Text('13 June,2022 at 1.02 PM'),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Customer:'),
                                Text('Simran Sah'),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Customer:'),
                                Text('Simran Sah'),
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
    );
  }
}
