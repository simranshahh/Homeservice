// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../Serviceprovider/Dashboard/Dashboard/Aboutus.dart';
import 'LandingBooking.dart';
import 'Landinghomepage.dart';
import 'landingaboutus.dart';

class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({super.key});

  @override
  ConsumerState<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends ConsumerState<LandingPage> {
  int _currentIndex = 0;
  final screens = [
    const Landinghomepage(),
    const LandingBooking(),
    // const Notification_page(),
    const AboutUs()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          body: screens[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_outlined),
                label: 'Bookings',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.notifications),
              //   label: 'Notifications',
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Profile',
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            selectedItemColor: Color.fromARGB(255, 90, 36, 165),
            iconSize: 30,
            onTap: _onItemTapped,
            showUnselectedLabels: true,
            elevation: 5,
          )),
    );
  }
}
