// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, non_constant_identifier_names, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:homeservice/Serviceprovider/View/Serviceman_Profile/Serviceman_Profile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:intl/intl.dart';

import '../../../common/helper/constants.dart';
import '../../../common/riverpod/provider/order_provider.dart';

class HirePage extends ConsumerStatefulWidget {
  HirePage(
      {this.date,
      this.spaddress,
      this.desc,
      this.time,
      this.customerName,
      this.job,
      this.price,
      super.key});
  var date;
  final String? time;
  final String? customerName;
  final String? job;
  final String? price;
  final String? spaddress;
  final String? desc;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HirePageState();
}

class _HirePageState extends ConsumerState<HirePage> {
  var userlocation = getStringAsync(userAddress);
  var serid = getStringAsync(userId);
  // final String dates = "2080/01/22";
  // final String times = "10.45";
  final _orderKey = GlobalKey<FormState>();
  Future<void> Order() async {
    if (_orderKey.currentState!.validate()) {
      await ref
          .read(orderNotifierProvider.notifier)
          .order(widget.time, widget.date, widget.desc, serid, context);
      // await setValue(emails, emailCtrl.value.text);
      // await setValue(passwords, passwordCtrl.value.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    // var formattedDate = DateFormat('yyyy/MM/dd').format(widget.date);
    // print(formattedDate);

    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Serviceman_Profile()));
                    },
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Text(
                    'Confirm Booking',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 95,
                    width: 95,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50)),
                    child: Image.asset(
                      'assets/worker.jpg',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Form(
                    key: _orderKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Text(
                            widget.customerName.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.job.toString(),
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.spaddress.toString(),
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 2,
              width: 360,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/time.png',
                        height: 40,
                        width: 30,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Service Time: ${widget.time}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Service Date: ${widget.date}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Service Location: $userlocation',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Service Type',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(widget.desc.toString()),
                  // Container(
                  //   color: Colors.deepPurpleAccent,
                  //   margin: EdgeInsets.all(8),
                  //   height: 50,
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //       hintText: "Enter types of service in details.",
                  //       fillColor: Colors.grey[300],
                  //       filled: true,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Text('Total',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      SizedBox(
                        width: 170,
                      ),
                      Text('Rs.${widget.price.toString()}/hr',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepPurpleAccent),
                    ),
                    onPressed: () {
                      Order();
                    },
                    child: Text(
                      'Book Now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
