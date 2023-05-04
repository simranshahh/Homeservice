// ignore_for_file: file_names, camel_case_types, prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_element, non_constant_identifier_names, avoid_types_as_parameter_names, unused_import

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timelines/timelines.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../Serviceprovider/View/Serviceman_Profile/Serviceman_Profile.dart';
import '../../../../Serviceprovider/View/Serviceman_Profile/rate.dart';
import '../Cancel_Booking/Cancel_booking.dart';

class Scheduletext {
  String text;

  Scheduletext({required this.text});
}

class Booking_Details extends ConsumerStatefulWidget {
  const Booking_Details({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _Booking_DetailsState();
}

class _Booking_DetailsState extends ConsumerState<Booking_Details> {
  List<Scheduletext> text = [
    Scheduletext(text: 'Job Accepted'),
    Scheduletext(text: 'Job In Process'),
    Scheduletext(text: 'Job Completed'),
  ];
  bool _isAccepted = false;
  bool _isRejected = false;
  _accept() {
    setState(() {
      _isAccepted = true;
    });
  }

  _decline() {
    setState(() {
      _isRejected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text('JobDetail'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                Card(
                  child: Container(
                    height: height * 0.38,
                    width: width * 1,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 18, 0, 0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // ignore: prefer_const_constructors
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/worker.jpg'),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Ram Prasad',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      IconButton(
                          onPressed: () async {
                            Uri phoneno = Uri.parse('tel:+9779876543210');
                            if (await launchUrl(phoneno)) {
                              //dialer opened
                            } else {
                              //dailer is not opened
                            }
                          },
                          icon: Icon(
                            Icons.call,
                            color: Colors.deepPurpleAccent,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(78.0, 68, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Job',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text('Chair Mending'),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Date',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text('22 Dec 2022 11.00 AM'),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Address',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text('BiratNursing Home,Biratnagar'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: _isAccepted == true
                                  ? null
                                  : _isRejected
                                      ? ElevatedButton(
                                          onPressed: () {
                                            // Do something when the new button is clicked
                                          },
                                          child: Text(
                                            'Done',
                                          ),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.deepPurpleAccent)),
                                        )
                                      : ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext) =>
                                                        Cancel_Booking()));
                                            // setState(() {
                                            //   _isRejected = true;
                                            //   // _isAccepted = false;
                                            // });
                                          },
                                          child: Text('Cancel'),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.deepPurpleAccent)),
                                        ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: _isRejected == true
                                  ? null
                                  : _isAccepted
                                      ? SizedBox(
                                          height: 40,
                                          width: 180,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              // Do something when the new button is clicked
                                            },
                                            child: Text('Go to Job'),
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors
                                                            .deepPurpleAccent)),
                                          ),
                                        )
                                      : ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext) =>
                                                        Serviceman_Profile()));
                                            // setState(() {
                                            //   _isAccepted = true;
                                            //   // _isRejected = false;
                                            // });
                                          },
                                          child: Text('Reschedule'),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.deepPurpleAccent)),
                                        ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
              Text(
                '    Job Schedule',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                color: Colors.white,
                height: height * 0.3,
                child: Timeline.tileBuilder(
                  theme: TimelineThemeData.vertical(),
                  builder: TimelineTileBuilder.fromStyle(
                    connectorStyle: ConnectorStyle.solidLine,
                    contentsAlign: ContentsAlign.alternating,
                    contentsBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Text(
                        text[index].text,
                        style: TextStyle(color: Colors.deepPurpleAccent),
                      ),
                    ),
                    itemCount: 3,
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext) => RateServiceman()));
                  },
                  child: Text('Review Now'),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepPurpleAccent)),
                ),
              )
            ],
          ),
        ));
  }
}
