// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:homeservice/Bottomnavbar/BottomNabBar.dart';
import 'package:homeservice/View/Bookings/scheduled_booking.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'completed_booking.dart';
import 'current/current.dart';

class Bookings extends ConsumerStatefulWidget {
  const Bookings({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BookingsState();
}

class _BookingsState extends ConsumerState<Bookings> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => BottomNavScreen()));
                },
                icon: Icon(Icons.arrow_back_ios)),
            backgroundColor: Color.fromARGB(255, 90, 36, 165),
            bottom: TabBar(
              // indicatorWeight: 30,
              labelColor: Colors.deepPurpleAccent,
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Colors.white),
              tabs: [
                Tab(
                  text: 'Scheduled',
                  height: 50,
                ),
                Tab(
                  text: 'Current',
                  height: 50,
                ),
                Tab(
                  text: 'Completed',
                  height: 50,
                )
              ],
            ),
            title: Center(child: const Text('My Bookings')),
          ),
          body: const TabBarView(
            children: [Scheduled(), Current(), Completed()],
          ),
        ),
      ),
    );
  }
}
