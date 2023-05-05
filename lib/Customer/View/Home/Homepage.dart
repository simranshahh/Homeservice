import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../common/helper/constants.dart';
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
    ),
  ];

  var d = getStringAsync(r);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final role = ref.watch(allrolesprovider);
    final info = ref.watch(roleinfo);

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
                info.when(
                  data: (data) => Container(
                    decoration: const BoxDecoration(
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
                          const Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          Text(
                            data!.address.toString(),
                            style: const TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  error: (error, stackTrace) => Text(error.toString()),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.2,
                      child: ListView(children: [
                        CarouselSlider(
                          items: [
                            Container(
                              margin: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: const DecorationImage(
                                  image: AssetImage("assets/swap.jpg"),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: const DecorationImage(
                                  image: AssetImage("assets/swap1.jpg"),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: const DecorationImage(
                                    image: AssetImage("assets/swap.jpg")),
                              ),
                            ),
                          ],
                          options: CarouselOptions(
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            viewportFraction: 0.8,
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
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
                              dialog(d);
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
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/plumber.png'),
                                            fit: BoxFit.fitHeight),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      data[index].name.toString(),
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        error: (error, stackTrace) => Text(error.toString()),
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                    const Text(
                      'Featured Services',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 195,
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
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Center(
                                        child: Text(
                                          product[index].pname,
                                          style: const TextStyle(),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          product[index].dprice,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: Color.fromARGB(
                                                  255, 90, 36, 165)),
                                        ),
                                      ),
                                      const SizedBox(
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
                    const SizedBox(height: 10),
                    const Text(
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
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                              height: 50,
                              color: Colors.amber[500],
                              child: Image.asset('assets/ban1.jpg')),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                              height: 50,
                              color: Colors.amber[100],
                              child: Image.asset('assets/ban1.jpg')),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
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
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                              height: 50,
                              color: Colors.amber[500],
                              child: Image.asset('assets/ad2.jpg')),
                          const SizedBox(
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

  void dialog(String name) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/popup.png',
                  height: 110,
                  width: 110,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Highly Recommended!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 90, 36, 165)),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '   Your ServiceProvider nearest to your area is \n                        recommended for you.',
                  style: TextStyle(fontSize: 10),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  name.toString(),
                )
              ],
            ),
          ),
        );
      },
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
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

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
