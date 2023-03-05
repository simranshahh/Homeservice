// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:homeservice/CustomerPanel/View/Home/Homepage.dart';
import 'package:homeservice/CustomerPanel/View/Notifications/notification.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../View/Bookings/Bookings.dart';
import '../View/Settings/customerprofile.dart';

class BottomNavScreen extends ConsumerStatefulWidget {
  const BottomNavScreen({super.key});

  @override
  ConsumerState<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends ConsumerState<BottomNavScreen> {
  int _currentIndex = 0;
  final screens = [
    const Homepage(),
    const Bookings(),
    const Notification_page(),
    const Customer_setting()
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
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notifications',
              ),
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
