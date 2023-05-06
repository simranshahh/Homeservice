// ignore_for_file: file_names, camel_case_types, prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_element, non_constant_identifier_names, avoid_types_as_parameter_names, unused_import, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:timelines/timelines.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../Serviceprovider/View/Serviceman_Profile/Serviceman_Profile.dart';
import '../rate.dart';
import '../../../../common/helper/constants.dart';
import '../../../../common/riverpod/models/servicestatus_model.dart';
import '../Cancel_Booking/Cancel_booking.dart';

class Scheduletext {
  String text;

  Scheduletext({required this.text});
}

class Booking_Details extends ConsumerStatefulWidget {
  Booking_Details({this.data, super.key});
  ServiceStatus? data;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _Booking_DetailsState();
}

class _Booking_DetailsState extends ConsumerState<Booking_Details> {
  // List<Scheduletext> text = [
  //   Scheduletext(text: 'Job Accepted'),
  //   Scheduletext(text: 'Job In Process'),
  //   Scheduletext(text: 'Job Completed'),
  // ];
  // var status;
  final bool _isAccepted = false;
  final bool _isRejected = false;
  // _accept() async {
  //   setState(() {
  //     _isAccepted = true;
  //     status = 'current';
  //   });
  //   await setValue(current, status);
  //   print(current);
  // }

  // _decline() {
  //   setState(() {
  //     _isRejected = true;
  //   });
  // }

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
                        widget.data!.service!.fullName.toString(),
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
                      Text(widget.data!.note.toString()),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Date',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                          '${widget.data!.date.toString()}  ${widget.data!.time.toString()}'),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Address',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        widget.data!.user!.address.toString(),
                      ),
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
                                      : (widget.data!.status == 'scheduled')
                                          ? ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            Cancel_Booking(
                                                                id: widget.data!
                                                                    .id)));
                                                // setState(() {
                                                //   _isRejected = true;
                                                //   // _isAccepted = false;
                                                // });
                                              },
                                              child: Text('Cancel'),
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors
                                                              .deepPurpleAccent)),
                                            )
                                          : null,
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
                                      : (widget.data!.status == 'current')
                                          ? Text('Ongoing Service',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                  color: Colors.deepPurple))
                                          : ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  if (widget.data!.status ==
                                                      'scheduled') {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (BuildContext) =>
                                                                    Serviceman_Profile()));
                                                  } else if (widget
                                                          .data!.status ==
                                                      'completed') {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (BuildContext) =>
                                                                    RateServiceman(
                                                                      id: widget
                                                                          .data!
                                                                          .service!
                                                                          .id,
                                                                      name: widget
                                                                          .data!
                                                                          .service!
                                                                          .fullName,
                                                                      role: widget
                                                                          .data!
                                                                          .service!
                                                                          .role,
                                                                    )));
                                                  }
                                                });
                                              },
                                              child: (widget.data!.status ==
                                                      'scheduled')
                                                  ? Text('Reschedule')
                                                  : (widget.data!.status ==
                                                          'completed')
                                                      ? Text('Review Now')
                                                      : null,
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors
                                                              .deepPurpleAccent)),
                                            ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ],
          ),
        ));
  }
}
