// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:homeservice/common/riverpod/repository/customer/CustomerRepository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Completed extends ConsumerStatefulWidget {
  const Completed({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CompletedState();
}

class _CompletedState extends ConsumerState<Completed> {
  @override
  Widget build(BuildContext context) {
    final completedDetails = ref.watch(completedprovider);
    return Scaffold(
        body: completedDetails.when(
      data: (data) => data.isEmpty
          ? Center(child: Text("NO DATA"))
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    height: 110,
                    width: 370,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data[index].service!.role.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              // SizedBox(
                              //   width: 160,
                              // ),
                              InkWell(
                                child: Container(
                                  height: 20,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 148, 33, 25),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                      child: Text(
                                    'Completed',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                                //  onTap: () {
                                //     Navigator.push(
                                //         context,
                                //         MaterialPageRoute(
                                //             builder: (BuildContext context) =>
                                //                 Cancel_Booking()));
                                //   },
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
                            'Scheduled time: ${data[index].date}   ${data[index].time}',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
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
