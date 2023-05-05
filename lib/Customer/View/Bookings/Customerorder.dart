// ignore_for_file: file_names, camel_case_types, prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_element, must_be_immutable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/riverpod/models/NotificationModel.dart';

class Scheduletext {
  String text;

  Scheduletext({required this.text});
}

class Customer_Order extends ConsumerStatefulWidget {
  Customer_Order({this.data, super.key});
  Notifications? data;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Customer_OrderState();
}

class _Customer_OrderState extends ConsumerState<Customer_Order> {
  // List<Scheduletext> text = [
  //   Scheduletext(text: 'Job Accepted'),
  //   Scheduletext(text: 'Job In Process'),
  //   Scheduletext(text: 'Job Completed'),
  // ];
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Card(
                child: Container(
                  height: height * 0.42,
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
                        onPressed: () {},
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
                    Text('carpertning job'),
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
                                                    Colors.deepPurpleAccent)),
                                      )
                                    : ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _isRejected = true;
                                            // _isAccepted = false;
                                          });
                                        },
                                        child: Text('Rejected'),
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
                                            // setState(() {
                                            //   status = 'current';
                                            // });
                                            // updatebookingStatus();
                                            // Do something when the new button is clicked
                                          },
                                          child: Text('Go to Job'),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.deepPurpleAccent)),
                                        ),
                                      )
                                    : ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _isAccepted = true;
                                            // _isRejected = false;
                                          });
                                        },
                                        child: Text('Accept'),
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
            // Text(
            //   '    Job Schedule',
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // ),
            // Container(
            //   color: Colors.white,
            //   height: height * 0.3,
            //   child: Timeline.tileBuilder(
            //     theme: TimelineThemeData.vertical(),
            //     builder: TimelineTileBuilder.fromStyle(
            //       connectorStyle: ConnectorStyle.solidLine,
            //       contentsAlign: ContentsAlign.alternating,
            //       contentsBuilder: (context, index) => Padding(
            //         padding: const EdgeInsets.all(24.0),
            //         child: Text(
            //           text[index].text,
            //           style: TextStyle(color: Colors.deepPurpleAccent),
            //         ),
            //       ),
            //       itemCount: 3,
            //     ),
            //   ),
            // ),
          ],
        ));
  }
}












// import 'package:flutter/material.dart';

// class AcceptButtonExample extends StatefulWidget {
//   @override
//   _AcceptButtonExampleState createState() => _AcceptButtonExampleState();
// }

// class _AcceptButtonExampleState extends State<AcceptButtonExample> {
//   bool _isAccepted = false;
//   bool _isRejected = false;
//   _accept() {
//     setState(() {
//       _isAccepted = true;
//     });
//   }

//   _decline() {
//     setState(() {
//       _isRejected = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Accept Button Example'),
//       ),
//       body: Row(
//         children: [
//           Center(
//             child: _isAccepted == true
//                 ? null
//                 : _isRejected
//                     ? ElevatedButton(
//                         onPressed: () {
//                           // Do something when the new button is clicked
//                         },
//                         child: Text('Click'),
//                       )
//                     : ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             _isRejected = true;
//                             // _isAccepted = false;
//                           });
//                         },
//                         child: Text('Rejected'),
//                       ),
//           ),
//           Center(
//             child: _isRejected == true
//                 ? null
//                 : _isAccepted
//                     ? SizedBox(
//                         height: 70,
//                         width: 300,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             // Do something when the new button is clicked
//                           },
//                           child: Text('New Button'),
//                         ),
//                       )
//                     : ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             _isAccepted = true;
//                             // _isRejected = false;
//                           });
//                         },
//                         child: Text('Accept'),
//                       ),
//           ),
//         ],
//       ),
//     );
//   }
// }
