// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:homeservice/View/Settings/Serviceman_Profile.dart';
import 'package:homeservice/View/Settings/customerprofile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditServiceman_setting extends ConsumerStatefulWidget {
  const EditServiceman_setting({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditServiceman_settingState();
}

class _EditServiceman_settingState
    extends ConsumerState<EditServiceman_setting> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        Container(
          height: 180,
          width: 370,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 1),
                colors: <Color>[
                  Color.fromARGB(255, 57, 8, 156),
                  Color.fromARGB(255, 132, 66, 224),
                ],
                tileMode: TileMode.mirror,
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40))),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Customer_setting()));
                },
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.white,
              ),
              SizedBox(
                width: 70,
              ),
              Text(
                'Profile',
                style: TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(130.0, 128, 18, 18),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/worker.jpg'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 230, 8, 0),
          child: Stack(children: [
            Card(
              child: Container(
                height: 400,
                width: 380,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.man),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        labelText: 'Your Name',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.man),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        labelText: 'Mobile Number',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        labelText: 'Email Address',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.man),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        labelText: 'Mobile Number',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 90, 36, 165)),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    'assets/done.png',
                                    height: 100,
                                    width: 100,
                                  ),
                                  Text(
                                      '     Your Profile has been    \n      updated successfully!'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  Serviceman_setting()));
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.deepPurpleAccent),
                                    ),
                                    child: Text(
                                      'Go to Profile',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
        )
      ]),
    ));
  }
}
