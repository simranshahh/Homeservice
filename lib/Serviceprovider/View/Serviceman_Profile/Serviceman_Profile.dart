// ignore_for_file: camel_case_types, prefer_const_constructors, sized_box_for_whitespace, file_names, avoid_print, unused_local_variable, depend_on_referenced_packages, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:homeservice/Customer/View/CustomerWorkerDetails/new.dart';
import 'package:homeservice/Customer/View/Hire/Hirepage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../common/riverpod/models/ServiceDetails.dart';
import '../../Dashboard/Dashboard/Ratings.dart';
import '../../Dashboard/Dashboard/reviews.dart';
import 'package:intl/intl.dart';

class Serviceman_Profile extends ConsumerStatefulWidget {
  const Serviceman_Profile({this.one, super.key});
  final ServiceDetails? one;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _Serviceman_ProfileState();
}

class _Serviceman_ProfileState extends ConsumerState<Serviceman_Profile> {
  String? _selectedTime;
  var _selectedDate;
  // var _selectedDate = formatDate(currentTime, [yyyy, '/', mm, '/', dd]);
  Future<void> _show() async {
    final TimeOfDay? result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                  // Using 12-Hour format
                  alwaysUse24HourFormat: false),
              // If you want 24-Hour format, just change alwaysUse24HourFormat to true
              child: child!);
        });
    if (result != null) {
      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }

  var initialDate = DateTime.now();
  var formattedDate;

  Future<void> dateChoose(BuildContext context) async {
    final now = DateTime.now();
    final pickDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: DateTime(2050),
    );
    if (pickDate == null) {
      return;
    }
    initialDate = pickDate;
    setState(() {
      _selectedDate = pickDate;
      formattedDate = DateFormat('yyyy/MM/dd').format(_selectedDate!);
    });
  }
  // DateTime dateTimeSelected = DateTime.now();

  // void _openTimePickerSheet(BuildContext context) async {
  //   final result = await TimePicker.show<DateTime?>(
  //     context: context,
  //     sheet: TimePickerSheet(
  //       sheetTitle: 'Select Schedule',
  //       minuteTitle: 'Minute',
  //       hourTitle: 'Hour',
  //       saveButtonText: 'Save',
  //       saveButtonColor: Colors.deepPurpleAccent,
  //       sheetCloseIconColor: Colors.deepPurpleAccent,
  //       hourTitleStyle: TextStyle(color: Colors.deepPurpleAccent),
  //       minuteTitleStyle: TextStyle(color: Colors.deepPurpleAccent),
  //       wheelNumberSelectedStyle: TextStyle(color: Colors.deepPurpleAccent),
  //     ),
  //   );

  //   if (result != null) {
  //     setState(() {
  //       dateTimeSelected = result;
  //     });
  //   }
  // }

  // List<String> list = <String>[
  //   'Home Cleaning',
  //   'Park Cleaning',
  //   'Office Cleaning',
  //   'Garden Cleaning'
  // ];
  final TextEditingController descctrl = TextEditingController();

  // String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => HirePage(
                      customerName: widget.one!.fullName.toString(),
                      job: widget.one!.role.toString(),
                      price: widget.one!.price.toString(),
                      spaddress: widget.one!.address.toString(),
                      desc: descctrl.value.text,
                      date: formattedDate,
                      time: _selectedTime,
                    )));
          },
          icon: const Icon(Icons.waving_hand),
          label: const Text('Hire Now'),
          backgroundColor: Color.fromARGB(255, 90, 36, 165),
        ),
        body: SingleChildScrollView(
          child: Stack(children: [
            Container(
              height: 220,
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
                            builder: (BuildContext context) => New_Order()));
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
                              widget.one!.fullName.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.one!.role.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.one!.address.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Price: ${widget.one!.price.toString()}/hr',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
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
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 0.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
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
                              color: Colors.white,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 185, 8, 0),
              child: Card(
                child: Container(
                  // height: 470,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(18.0, 20, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   'Service',
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.bold, fontSize: 18),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Card(
                        //   child: Container(
                        //     width: 330,
                        //     color: Colors.white,
                        //     child: DropdownButton<String>(
                        //       hint: Padding(
                        //         padding: const EdgeInsets.only(left: 15.0),
                        //         child: Text('Home Cleaning'),
                        //       ),
                        //       icon: Padding(
                        //         padding: const EdgeInsets.only(left: 138.0),
                        //         child: const Icon(Icons.arrow_downward),
                        //       ),
                        //       elevation: 16,
                        //       style: const TextStyle(color: Colors.deepPurple),
                        //       underline: Container(
                        //         height: 2,
                        //         // color: Colors.deepPurpleAccent,
                        //       ),
                        //       onChanged: (String? value) {},
                        //       items: list
                        //           .map<DropdownMenuItem<String>>((String value) {
                        //         return DropdownMenuItem<String>(
                        //           value: value,
                        //           child: Text(
                        //             value,
                        //             style: TextStyle(color: Colors.black),
                        //           ),
                        //         );
                        //       }).toList(),
                        //     ),
                        //   ),
                        // ),
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
                              padding:
                                  const EdgeInsets.only(top: 18.0, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            textStyle:
                                                MaterialStateProperty.all(
                                                    TextStyle(fontSize: 15))),
                                        onPressed: _show,
                                        child: Text(
                                          _selectedTime != null
                                              ? _selectedTime!
                                              : 'Select time',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      )),

                                  // SizedBox(
                                  //   width: 40,
                                  // ),
                                  Container(
                                    height: 40,
                                    // width: 120,
                                    // color: Colors.red,
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                              Color.fromARGB(255, 90, 36, 165),
                                            ),
                                            // padding: MaterialStateProperty.all(
                                            //     EdgeInsets.all(50)),
                                            textStyle:
                                                MaterialStateProperty.all(
                                                    TextStyle(fontSize: 15))),
                                        onPressed: () {
                                          dateChoose(context);
                                        },
                                        child: Text(
                                          _selectedDate != null
                                              ? formattedDate
                                              : 'Select Date',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )),
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
                          "Description",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(height: height * 0.01),

                        TextFormField(
                          controller: descctrl,
                          maxLines: 3,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter Description",
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Text(
                        //   'Choose Your Area',
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.bold, fontSize: 18),
                        // ),
                        Text(
                          'Ratings & Reviews',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            height: 100, color: Colors.red, child: Ratings()),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Reviews'),
                        SizedBox(
                          height: 10,
                        ),
                        Container(height: height, child: Review()),
                        SizedBox(
                          height: 20,
                        ),
                        // Container(
                        //   height: 200,
                        //   width: width,
                        //   child: GoogleMapPage(),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 590.0),
            //   child: Card(
            //     child: Container(
            //       height: 100,
            //       width: 400,
            //       decoration: BoxDecoration(
            //           color: Color.fromARGB(255, 90, 36, 165),
            //           borderRadius: BorderRadius.circular(25)),
            //       child: Padding(
            //         padding: const EdgeInsets.fromLTRB(35.0, 15, 0, 0),
            //         child: Row(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               'Price: 500/hr',
            //               style: TextStyle(
            //                   color: Colors.white,
            //                   fontSize: 18,
            //                   fontWeight: FontWeight.bold),
            //             ),
            //             SizedBox(
            //               width: 80,
            //             ),
            //             InkWell(
            //               child: Container(
            //                 height: 25,
            //                 width: 75,
            //                 decoration: BoxDecoration(
            //                     color: Colors.white,
            //                     borderRadius: BorderRadius.circular(15)),
            //                 child: Center(
            //                   child: Text(
            //                     'Hire Now',
            //                     style: TextStyle(
            //                       color: Color.fromARGB(255, 90, 36, 165),
            //                       fontSize: 15,
            //                       fontWeight: FontWeight.normal,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               onTap: () {
            //                 Navigator.of(context).pushReplacement(
            //                     MaterialPageRoute(
            //                         builder: (BuildContext context) =>
            //                             HirePage()));
            //               },
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // )
          ]),
        ),
      ),
    );
  }
}
