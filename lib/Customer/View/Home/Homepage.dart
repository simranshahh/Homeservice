// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, file_names, sized_box_for_whitespace

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/riverpod/models/ServiceDetails.dart';
import '../../../common/riverpod/repository/customer/CustomerRepository.dart';
import '../../Model/Home/Featuredservices.dart';
import '../CustomerWorkerDetails/new.dart';
import 'DetailPage.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> {
  List<FeaturedServices> product = [
    FeaturedServices(
      image: "assets/baner.png",
      dprice: "Rs. 200",
      pname: "Painter",
    ),
    FeaturedServices(
      image: "assets/baner.png",
      dprice: "Rs. 150",
      pname: "Laundary",
    ),
    FeaturedServices(
      image: "assets/baner.png",
      dprice: "Rs.1500",
      pname: "Carpenter",
    ),
    FeaturedServices(
      image: "assets/baner.png",
      dprice: "\$ 1500",
      pname: "Plumber",
      //
    ),
  ];

  // List<Services> item = [
  //   Services(text: 'Carpenter'),
  //   Services(text: 'Plumber'),
  //   Services(text: 'Laundary'),
  //   Services(text: 'Painter'),
  // ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final role = ref.watch(allrolesprovider);

    getprovider(String name) {
      final servicedetailsprovider =
          FutureProvider<List<ServiceDetails>>((ref) async {
        return ref.read(customerRepositoryProvider).serviceDetails(name);
      });

      return servicedetailsprovider;
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        Text(
                          'Biratnagar,Koshi',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(28.0, 80, 28, 0),
                //   child: Container(
                //     height: 50,
                //     width: 350,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(15),
                //         color: Colors.white),
                //     child: TextField(
                //       decoration: InputDecoration(
                //           fillColor: Colors.white,
                //           border: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(15)),
                //           suffixIcon: IconButton(
                //               onPressed: () {
                //                 // // method to show the search bar
                //                 showSearch(
                //                     context: context,
                //                     // delegate to customize the search bar
                //                     delegate: CustomSearchDelegate());
                //               },
                //               icon: const Icon(Icons.search))),
                //     ),
                //   ),
                // )
              ]),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Container(
                      height: height * 0.2,
                      child: ListView(children: [
                        CarouselSlider(
                          items: [
                            Container(
                              margin: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: AssetImage("assets/swap.jpg"),
                                  // fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: AssetImage("assets/swap1.jpg"),
                                  // fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    image: AssetImage("assets/swap.jpg")),
                              ),
                            ),
                          ],
                          options: CarouselOptions(
                            // height: 380.0,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            viewportFraction: 0.8,
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Our Services',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: height * 0.32,
                      child: role.when(
                        data: (data) => GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                          itemCount: data.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => New_Order(
                                      detaillist: getprovider(
                                          data[index].name.toString()),
                                    ),
                                  ));
                            },
                            child: Card(
                              elevation: 5,
                              child: Container(
                                height: 110,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/plumber.png'),
                                            fit: BoxFit.fitHeight),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      data[index].name.toString(),
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        error: (error, stackTrace) => Text(error.toString()),
                        loading: () => Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 30.0, top: 15),
                    //   child: Container(
                    //     height: 260,
                    //     color: Colors.white,
                    //     // width: 40,
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.start,
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             InkWell(
                    //               child: Card(
                    //                 elevation: 5,
                    //                 child: Container(
                    //                   height: 110,
                    //                   width: 120,
                    //                   decoration: BoxDecoration(
                    //                       color: Colors.white,
                    //                       borderRadius:
                    //                           BorderRadius.circular(5)),
                    //                   child: Column(
                    //                     children: [
                    //                       Container(
                    //                         alignment: Alignment.center,
                    //                         height: 70,
                    //                         //width: 50,
                    //                         decoration: BoxDecoration(
                    //                           image: DecorationImage(
                    //                               image: AssetImage(
                    //                                   'assets/plumber.png'),
                    //                               fit: BoxFit.fitHeight),
                    //                           // color: Color(0xffF7825C),
                    //                         ),
                    //                         // child: Icon(item[index].icon),
                    //                       ),
                    //                       SizedBox(
                    //                         height: 8,
                    //                       ),
                    //                       Text(
                    //                         'Carpenter',
                    //                         style: TextStyle(fontSize: 10),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ),
                    //               onTap: () {
                    //                 Navigator.of(context).pushReplacement(
                    //                     MaterialPageRoute(
                    //                         builder: (BuildContext context) =>
                    //                             Carpenter_Workers()));
                    //                 showDialog(
                    //                   context: context,
                    //                   builder: (BuildContext context) {
                    //                     return AlertDialog(
                    //                       content: Column(
                    //                         mainAxisSize: MainAxisSize.min,
                    //                         children: [
                    //                           Image.asset(
                    //                             'assets/popup.png',
                    //                             height: 110,
                    //                             width: 110,
                    //                           ),
                    //                           SizedBox(
                    //                             height: 10,
                    //                           ),
                    //                           Text(
                    //                             'Highly Recommended!',
                    //                             style: TextStyle(
                    //                                 fontWeight: FontWeight.bold,
                    //                                 color: Color.fromARGB(
                    //                                     255, 90, 36, 165)),
                    //                           ),
                    //                           SizedBox(
                    //                             height: 10,
                    //                           ),
                    //                           Text(
                    //                             '   Your ServiceProvider nearest to your area is \n                        recommended for you.',
                    //                             style: TextStyle(fontSize: 10),
                    //                           ),
                    //                           SizedBox(
                    //                             height: 15,
                    //                           ),
                    //                           Text(
                    //                             'Ram Prasad Sharma',
                    //                           )
                    //                         ],
                    //                       ),
                    //                     );
                    //                   },
                    //                 );
                    //               },
                    //             ),
                    //             SizedBox(
                    //               width: 30,
                    //             ),

                    //           ],
                    //         ),
                    //         Row(
                    //           children: [
                    //             Card(
                    //               elevation: 5,
                    //               child: Container(
                    //                 height: 110,
                    //                 width: 120,
                    //                 decoration: BoxDecoration(
                    //                     color: Colors.white,
                    //                     borderRadius: BorderRadius.circular(5)),
                    //                 child: Column(
                    //                   children: [
                    //                     Container(
                    //                       alignment: Alignment.center,
                    //                       height: 70,
                    //                       //width: 50,
                    //                       decoration: BoxDecoration(
                    //                         image: DecorationImage(
                    //                             image: AssetImage(
                    //                                 'assets/plumber.png'),
                    //                             fit: BoxFit.fitHeight),
                    //                         // color: Color(0xffF7825C),
                    //                       ),
                    //                       // child: Icon(item[index].icon),
                    //                     ),
                    //                     SizedBox(
                    //                       height: 8,
                    //                     ),
                    //                     Text(
                    //                       'Electrician',
                    //                       style: TextStyle(fontSize: 10),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //             SizedBox(
                    //               width: 30,
                    //             ),
                    //             Card(
                    //               elevation: 5,
                    //               child: Container(
                    //                 height: 110,
                    //                 width: 120,
                    //                 decoration: BoxDecoration(
                    //                     color: Colors.white,
                    //                     borderRadius: BorderRadius.circular(5)),
                    //                 child: Column(
                    //                   children: [
                    //                     Container(
                    //                       alignment: Alignment.center,
                    //                       height: 70,
                    //                       //width: 50,
                    //                       decoration: BoxDecoration(
                    //                         image: DecorationImage(
                    //                             image: AssetImage(
                    //                                 'assets/plumber.png'),
                    //                             fit: BoxFit.fitHeight),
                    //                         // color: Color(0xffF7825C),
                    //                       ),
                    //                       // child: Icon(item[index].icon),
                    //                     ),
                    //                     SizedBox(
                    //                       height: 8,
                    //                     ),
                    //                     Text(
                    //                       'Laundary',
                    //                       style: TextStyle(fontSize: 10),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //             SizedBox(
                    //               width: 30,
                    //             ),
                    //           ],
                    //         ),
                    //         SizedBox(
                    //           width: 30,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Text(
                      'Featured Services',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 195,
                      // width: 90,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(15, 34, 10, 15),
                            child: InkWell(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailPage(product[index]))),
                              child: Container(
                                height: 100,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 70,
                                        width: 200,
                                        color: Colors.grey,
                                        child: Image.asset(
                                          product[index].image,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Center(
                                        child: Text(
                                          product[index].pname,
                                          style: TextStyle(
                                              //fontWeight: FontWeight.bold
                                              ),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          product[index].dprice,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: Color.fromARGB(
                                                  255, 90, 36, 165)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: product.length,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Advertisments',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(8),
                        children: <Widget>[
                          Container(
                            height: 50,
                            width: 280,
                            color: Colors.amber[600],
                            child: Image.asset('assets/ban1.jpg'),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                              height: 50,
                              color: Colors.amber[500],
                              child: Image.asset('assets/ban1.jpg')),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                              height: 50,
                              color: Colors.amber[100],
                              child: Image.asset('assets/ban1.jpg')),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Offers & Discounts',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(8),
                        children: <Widget>[
                          Container(
                            height: 40,
                            color: Colors.amber[600],
                            child: Image.asset('assets/ad2.jpg'),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                              height: 50,
                              color: Colors.amber[500],
                              child: Image.asset('assets/ad2.jpg')),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                              height: 50,
                              color: Colors.amber[100],
                              child: Image.asset('assets/ad2.jpg')),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> categories = [
    'Carpenter',
    'Plumber',
    'Laundary',
    'Cleaner',
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  } // for clearing the query use hunxa

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  } //used for leave and close the search bar

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchquery = [];
    for (var works in categories) {
      if (works.toLowerCase().contains(query.toLowerCase())) {
        matchquery.add(works);
      }
    }

    return ListView.builder(
        itemCount: matchquery.length,
        itemBuilder: (context, index) {
          var result = matchquery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchquery = [];
    for (var works in categories) {
      if (works.toLowerCase().contains(query.toLowerCase())) {
        matchquery.add(works);
      }
    }

    return ListView.builder(
        itemCount: matchquery.length,
        itemBuilder: (context, index) {
          var result = matchquery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }
}
