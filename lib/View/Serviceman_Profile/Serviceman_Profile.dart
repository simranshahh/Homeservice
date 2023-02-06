// ignore_for_file: camel_case_types, prefer_const_constructors, sized_box_for_whitespace, file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:homeservice/View/Hire/Hirepage.dart';
import 'package:homeservice/View/Serviceman_Profile/Calendar.dart';
import 'package:homeservice/View/Serviceman_Profile/Map.dart/map.dart';
import 'package:homeservice/View/Carpenter/workers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_picker_sheet/widget/sheet.dart';
import 'package:time_picker_sheet/widget/time_picker.dart';

class Serviceman_Profile extends ConsumerStatefulWidget {
  const Serviceman_Profile({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _Serviceman_ProfileState();
}

class _Serviceman_ProfileState extends ConsumerState<Serviceman_Profile> {
  DateTime dateTimeSelected = DateTime.now();

  void _openTimePickerSheet(BuildContext context) async {
    final result = await TimePicker.show<DateTime?>(
      context: context,
      sheet: TimePickerSheet(
        sheetTitle: 'Select Schedule',
        minuteTitle: 'Minute',
        hourTitle: 'Hour',
        saveButtonText: 'Save',
        saveButtonColor: Colors.deepPurpleAccent,
        sheetCloseIconColor: Colors.deepPurpleAccent,
        hourTitleStyle: TextStyle(color: Colors.deepPurpleAccent),
        minuteTitleStyle: TextStyle(color: Colors.deepPurpleAccent),
        wheelNumberSelectedStyle: TextStyle(color: Colors.deepPurpleAccent),
      ),
    );

    if (result != null) {
      setState(() {
        dateTimeSelected = result;
      });
    }
  }

  List<String> list = <String>[
    'Home Cleaning',
    'Park Cleaning',
    'Office Cleaning',
    'Garden Cleaning'
  ];
  // String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Container(
            height: 180,
            width: 400,
            color: Color.fromARGB(255, 90, 36, 165),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 8, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Carpenter_Workers()));
                    },
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 95,
                        width: 95,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset('assets/worker.jpg'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ram Prasad',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Cleaner',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          RatingBar.builder(
                            initialRating: 2,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 2,
                            itemSize: 20,
                            itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 165, 8, 0),
            child: Card(
              child: Container(
                height: 470,
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 20, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Service',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        child: Container(
                          width: 330,
                          color: Colors.white,
                          child: DropdownButton<String>(
                            hint: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text('Home Cleaning'),
                            ),
                            icon: Padding(
                              padding: const EdgeInsets.only(left: 138.0),
                              child: const Icon(Icons.arrow_downward),
                            ),
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              // color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String? value) {},
                            items: list
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Date and Time',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Color.fromARGB(255, 90, 36, 165),
                                        ),
                                        // padding: MaterialStateProperty.all(
                                        //     EdgeInsets.all(50)),
                                        textStyle: MaterialStateProperty.all(
                                            TextStyle(fontSize: 20))),
                                    onPressed: () =>
                                        _openTimePickerSheet(context),
                                    child: Text(
                                      'Time ${dateTimeSelected.hour}:${dateTimeSelected.minute}',
                                      style: TextStyle(
                                          fontSize: 19, color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Container(
                                      height: 40,
                                      width: 120,
                                      // color: Colors.red,
                                      child: Calendar()),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Choose Your Area',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 120,
                        width: 300,
                        child: GoogleMapPage(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 590.0),
            child: Card(
              child: Container(
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 90, 36, 165),
                    borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(35.0, 15, 0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price: 500/hr',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      InkWell(
                        child: Container(
                          height: 25,
                          width: 75,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              'Hire Now',
                              style: TextStyle(
                                color: Color.fromARGB(255, 90, 36, 165),
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HirePage()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
