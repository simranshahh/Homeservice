// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:homeservice/Customer/View/BottomnavScreen/BottomNabBar.dart';
import 'package:homeservice/Customer/View/CustomerWorkerDetails/Repair.dart';
import 'package:homeservice/Customer/View/CustomerWorkerDetails/new.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Carpenter_Workers extends ConsumerStatefulWidget {
  const Carpenter_Workers({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _Carpenter_WorkersState();
}

class _Carpenter_WorkersState extends ConsumerState<Carpenter_Workers> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => BottomNavScreen()));
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              backgroundColor: Color.fromARGB(255, 90, 36, 165),
              bottom: const TabBar(
                tabs: [
                  Text('New Service'),
                  Text('Repairement'),
                ],
              ),
              title: Center(child: const Text('Carpenter')),
            ),
            body: TabBarView(
              children: [New_Order(), Repair()],
            ),
          ),
        ),
      ),
    );
  }
}
