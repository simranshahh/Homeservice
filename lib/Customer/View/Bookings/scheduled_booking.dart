// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:homeservice/Customer/View/Bookings/BookingDetails/bookingdetails.dart';
import 'package:homeservice/Customer/View/Bookings/Cancel_Booking/Cancel_booking.dart';
import 'package:homeservice/common/riverpod/repository/customer/CustomerRepository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../common/helper/constants.dart';

class Scheduled extends ConsumerStatefulWidget {
  const Scheduled({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScheduledState();
}

class _ScheduledState extends ConsumerState<Scheduled> {
  var roles = getStringAsync(role);
  @override
  Widget build(BuildContext context) {
    final scheduledDetails = ref.watch(scheduledprovider);
    return Scaffold(
        appBar: (roles != customer || roles != customerid)
            ? null
            : AppBar(
                title: Text("Scheduled List"),
                centerTitle: true,
              ),
        body: scheduledDetails.when(
          data: (data) => data.isEmpty
              ? Center(child: Text("NO DATA"))
              : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          height: 110,
                          width: 370,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 25.0, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data[index].service!.role.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    InkWell(
                                      child: Container(
                                        height: 20,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 148, 33, 25),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Center(
                                            child: Text(
                                          'Cancel',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        Cancel_Booking()));
                                      },
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(data[index].note.toString()),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Scheduled for: ${data[index].date}  ${data[index].time} ',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext) => Booking_Details()));
                      },
                    );
                  },
                ),
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
