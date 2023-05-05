// ignore_for_file: file_names, camel_case_types, prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_element, non_constant_identifier_names, avoid_types_as_parameter_names, unused_import, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:timelines/timelines.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../Serviceprovider/View/Serviceman_Profile/Serviceman_Profile.dart';
import '../../../Customer/View/Bookings/Cancel_Booking/Cancel_booking.dart';
import '../../../Customer/View/Bookings/rate.dart';
import '../../../../common/helper/constants.dart';
import '../../../../common/riverpod/models/servicestatus_model.dart';
import '../../../common/riverpod/models/SpServicsStatusModel.dart';
import '../../../common/riverpod/provider/updatebookingstatusprovider.dart';
import '../bottomnavbar.dart';
import 'SpCancel.dart';

class Scheduletext {
  String text;

  Scheduletext({required this.text});
}

class SPBooking_Details extends ConsumerStatefulWidget {
  SPBooking_Details({this.data, super.key});
  SBooking? data;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SPBooking_DetailsState();
}

class _SPBooking_DetailsState extends ConsumerState<SPBooking_Details> {
  // List<Scheduletext> text = [
  //   Scheduletext(text: 'Job Accepted'),
  //   Scheduletext(text: 'Job In Process'),
  //   Scheduletext(text: 'Job Completed'),
  // ];
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

  final _spUpdatekey = GlobalKey<FormState>();

  // String id = '6454f40e76a8aa06bd26041e';
  String? status;

  Future<void> updatebookingStatus() async {
    if (_spUpdatekey.currentState!.validate()) {
      ref
          .read(updateBookingStatusNotifierProvider.notifier)
          .UpdateBookingStatus(widget.data!.id!, status!, context);
    }
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
          child: Form(
            key: _spUpdatekey,
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
                          widget.data!.user!.fullName.toString(),
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
                        Text(widget.data!.user!.address.toString()),
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
                                                        Colors
                                                            .deepPurpleAccent)),
                                          )
                                        : (widget.data!.status == 'scheduled')
                                            ? ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              Cancel_Booking(
                                                                  id: widget
                                                                      .data!
                                                                      .id),
                                                        ));
                                                    // _isAccepted = false;
                                                  });
                                                },
                                                child: Text('Rejected'),
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors
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
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Bottomnavbar(),
                                                    ));
                                              },
                                              child: Text('Go HomePage'),
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors
                                                              .deepPurpleAccent)),
                                            ),
                                          )
                                        : ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                if (widget.data!.status ==
                                                    'scheduled') {
                                                  status = 'current';
                                                } else if (widget
                                                        .data!.status ==
                                                    'current') {
                                                  status = 'completed';
                                                }
                                              });
                                              updatebookingStatus();
                                            },
                                            child: (widget.data!.status ==
                                                    'scheduled')
                                                ? Text('Accept')
                                                : (widget.data!.status ==
                                                        'current')
                                                    ? Text('End Service')
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
          ),
        ));
  }
}
