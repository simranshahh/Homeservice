// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:homeservice/Serviceprovider/Dashboard/Book/Book.dart';
import 'package:homeservice/Serviceprovider/Dashboard/Dashboard/dashboard.dart';
import 'package:homeservice/Serviceprovider/Dashboard/profile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Bottomnavbar extends ConsumerStatefulWidget {
  const Bottomnavbar({super.key});

  @override
  ConsumerState<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends ConsumerState<Bottomnavbar> {
  int _currentIndex = 0;
  final screens = [
    const Dashboard(),
    const Serviceman_Notification(),
    const Serviceman_setting(),
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
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_outlined),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
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
