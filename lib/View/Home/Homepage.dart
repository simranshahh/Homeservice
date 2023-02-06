// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:homeservice/View/Carpenter/workers.dart';

import '../../Model/Home/Featuredservices.dart';
import '../../Model/Ourservices.dart';
import 'DetailPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
        dprice: "\$ 200",
        pname: "Painter",
      ),
      FeaturedServices(
        image: "assets/baner.png",
        dprice: "\$ 150",
        pname: "Laundary",
      ),
      FeaturedServices(
        image: "assets/baner.png",
        dprice: "\$ 1500",
        pname: "Carpenter",
      ),
      FeaturedServices(
        image: "assets/baner.png",
        dprice: "\$ 1500",
        pname: "Plumber",
        //
      ),
    ];
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 90, 36, 165),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(28.0, 65, 28, 0),
                        child: Container(
                          height: 50,
                          width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white),
                          child: TextField(
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      // // method to show the search bar
                                      showSearch(
                                          context: context,
                                          // delegate to customize the search bar
                                          delegate: CustomSearchDelegate());
                                    },
                                    icon: const Icon(Icons.search))),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Text(
                      'Our Services',
                      style: TextStyle(fontSize: 15),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, top: 10),
                      child: Container(
                        height: 260,
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
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Carpenter_Workers()));
                                  },
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Card(
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
                              ],
                            ),
                            Row(
                              children: [
                                Card(
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
                                SizedBox(
                                  width: 30,
                                ),
                                Card(
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
                    Text('Featured Services'),
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
                    Text('Advertisments'),
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
                    Text('Offers & Discounts'),
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
