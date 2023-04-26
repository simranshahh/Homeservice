// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, file_names, sized_box_for_whitespace

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../Customer/Model/Home/Featuredservices.dart';
import '../../Customer/Model/Ourservices.dart';
import '../../Customer/View/Home/DetailPage.dart';
import 'CarpenterDummy.dart';

class Landinghomepage extends StatefulWidget {
  const Landinghomepage({super.key});

  @override
  State<Landinghomepage> createState() => _LandinghomepageState();
}

class _LandinghomepageState extends State<Landinghomepage> {
  List<Services> item = [
    Services(text: 'Carpenter'),
    Services(text: 'Plumber'),
    Services(text: 'Laundary'),
    Services(text: 'Painter'),
  ];

  @override
  Widget build(BuildContext context) {
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

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

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
                    height: height * 0.15,
                    width: width
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(left: 10.0),
                    //     child: Row(
                    //       children: [
                    //         Icon(
                    //           Icons.location_on,
                    //           color: Colors.white,
                    //         ),
                    //         Text(
                    //           'Biratnagar,Koshi',
                    //           style: TextStyle(color: Colors.white),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(35.0, 30, 35, 0),
                  child: Center(child: Image.asset("assets/whitelogo.png")),
                  // child: Container(
                  //   height: 50,
                  //   width: 350,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(15),
                  //       color: Colors.white),
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //         fillColor: Colors.white,
                  //         border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(15)),
                  //         suffixIcon: IconButton(
                  //             onPressed: () {
                  //               // // method to show the search bar
                  //               showSearch(
                  //                   context: context,
                  //                   // delegate to customize the search bar
                  //                   delegate: CustomSearchDelegate());
                  //             },
                  //             icon: const Icon(Icons.search))),
                  //   ),
                  // ),
                )
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
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, top: 15, bottom: 20),
                      child: Container(
                        // height: height,
                        color: Colors.white,
                        // width: 40,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  child: Card(
                                    elevation: 5,
                                    child: Container(
                                      height: 110,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            height: 70,
                                            //width: 50,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/plumber.png'),
                                                  fit: BoxFit.fitHeight),
                                              // color: Color(0xffF7825C),
                                            ),
                                            // child: Icon(item[index].icon),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'Carpenter',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                CarpenterDummy()));
                                  },
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                CarpenterDummy()));
                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: Container(
                                      height: 110,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            height: 70,
                                            //width: 50,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/plumber.png'),
                                                  fit: BoxFit.fitHeight),
                                              // color: Color(0xffF7825C),
                                            ),
                                            // child: Icon(item[index].icon),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'Plumber',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                CarpenterDummy()));
                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: Container(
                                      height: 110,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            height: 70,
                                            //width: 50,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/plumber.png'),
                                                  fit: BoxFit.fitHeight),
                                              // color: Color(0xffF7825C),
                                            ),
                                            // child: Icon(item[index].icon),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'Electrician',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                CarpenterDummy()));
                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: Container(
                                      height: 110,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            height: 70,
                                            //width: 50,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/plumber.png'),
                                                  fit: BoxFit.fitHeight),
                                              // color: Color(0xffF7825C),
                                            ),
                                            // child: Icon(item[index].icon),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'Laundary',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Text(
                    //   'Featured Services',
                    //   style: TextStyle(fontWeight: FontWeight.bold),
                    // ),
                    // SizedBox(
                    //   height: 195,
                    //   // width: 90,
                    //   child: ListView.builder(
                    //     scrollDirection: Axis.horizontal,
                    //     itemBuilder: (context, index) {
                    //       return Padding(
                    //         padding: const EdgeInsets.fromLTRB(15, 34, 10, 15),
                    //         child: InkWell(
                    //           onTap: () => Navigator.of(context).push(
                    //               MaterialPageRoute(
                    //                   builder: (context) =>
                    //                       DetailPage(product[index]))),
                    //           child: Container(
                    //             height: 100,
                    //             width: 200,
                    //             decoration: BoxDecoration(
                    //                 color: Colors.white,
                    //                 border: Border.all(color: Colors.grey),
                    //                 borderRadius: BorderRadius.circular(5)),
                    //             child: Padding(
                    //               padding: const EdgeInsets.all(12.0),
                    //               child: Column(
                    //                 crossAxisAlignment:
                    //                     CrossAxisAlignment.start,
                    //                 children: [
                    //                   Container(
                    //                     height: 70,
                    //                     width: 200,
                    //                     color: Colors.grey,
                    //                     child: Image.asset(
                    //                       product[index].image,
                    //                       fit: BoxFit.fill,
                    //                     ),
                    //                   ),
                    //                   SizedBox(
                    //                     height: 5,
                    //                   ),
                    //                   Center(
                    //                     child: Text(
                    //                       product[index].pname,
                    //                       style: TextStyle(
                    //                           //fontWeight: FontWeight.bold
                    //                           ),
                    //                     ),
                    //                   ),
                    //                   Center(
                    //                     child: Text(
                    //                       product[index].dprice,
                    //                       style: TextStyle(
                    //                           fontWeight: FontWeight.bold,
                    //                           fontSize: 12,
                    //                           color: Color.fromARGB(
                    //                               255, 90, 36, 165)),
                    //                     ),
                    //                   ),
                    //                   SizedBox(
                    //                     height: 10,
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //     itemCount: product.length,
                    //   ),
                    // ),
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
                    // Text(
                    //   'Offers & Discounts',
                    //   style: TextStyle(fontWeight: FontWeight.bold),
                    // ),
                    // SizedBox(
                    //   height: 200,
                    //   child: ListView(
                    //     scrollDirection: Axis.horizontal,
                    //     padding: const EdgeInsets.all(8),
                    //     children: <Widget>[
                    //       Container(
                    //         height: 40,
                    //         color: Colors.amber[600],
                    //         child: Image.asset('assets/ad2.jpg'),
                    //       ),
                    //       SizedBox(
                    //         width: 20,
                    //       ),
                    //       Container(
                    //           height: 50,
                    //           color: Colors.amber[500],
                    //           child: Image.asset('assets/ad2.jpg')),
                    //       SizedBox(
                    //         width: 20,
                    //       ),
                    //       Container(
                    //           height: 50,
                    //           color: Colors.amber[100],
                    //           child: Image.asset('assets/ad2.jpg')),
                    //     ],
                    //   ),
                    // ),
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
