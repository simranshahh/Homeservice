// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_const_constructors_in_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:homeservice/CustomerPanel/View/Notifications/notification.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Model/Notification/notification_model.dart';

class Notifcation_detail_page extends ConsumerStatefulWidget {
  final Notification_items? notification_details;

  Notifcation_detail_page({this.notification_details, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _Notifcation_detail_pageState();
}

class _Notifcation_detail_pageState
    extends ConsumerState<Notifcation_detail_page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Notification_page()));
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                  Text(
                    widget.notification_details!.title.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              Text(widget.notification_details!.date.toString()),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 220,
                  width: 390,
                  child: Image.asset(
                      widget.notification_details!.image.toString())),
              SizedBox(
                height: 20,
              ),
              Text(widget.notification_details!.subtitle.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
