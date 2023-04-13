// ignore_for_file: file_names, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../profile.dart';

class AboutUs extends ConsumerStatefulWidget {
  const AboutUs({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AboutUsState();
}

class _AboutUsState extends ConsumerState<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //     colors: [
          //   Color.fromARGB(255, 247, 247, 247),
          //   Color.fromARGB(255, 136, 136, 136),
          // ])
          ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(children: [
            Image.asset(
              'assets/nepal.jpg',
              color: Colors.white.withOpacity(0.2),
              colorBlendMode: BlendMode.modulate,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Serviceman_setting()));
                          },
                          icon: Icon(Icons.arrow_back_ios)),
                      Image.asset('assets/logo.png'),
                    ],
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  // ignore: prefer_const_constructors
                  Center(
                    // ignore: prefer_const_constructors
                    child: Text(
                      '     SAAJHA IS NOT JUST AN    \n APPLICATION, BUT A HELPER!',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(18.0, 45, 18, 0),
                    child: Text(
                        'Our goal is to provide homeowners with the tools to help them protect against the expense, worry and inconvenience of plumbing, water, sewer, electrical, heating and cooling emergencies. HomeServe prides itself on providing quality local service and expert installation service h do we do this? For nearly two decades, HomeServe has been working with leading utilities and municipalities – now numbering over 1,100 – to make optional service plans available to their customers, members, and residents. These home repair plans help cover household systems that many homeowners are unaware of their responsibility to maintain.  a fact: systems that break from everyday wear and tear are typically not covered by basic homeowners'),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
