// ignore_for_file: file_names, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AboutUs extends ConsumerStatefulWidget {
  const AboutUs({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AboutUsState();
}

class _AboutUsState extends ConsumerState<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("About Us"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/logo.png',
                  // color: Colors.white.withOpacity(0.2),
                  // colorBlendMode: BlendMode.modulate,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 28.0),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Row(
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           IconButton(
                //               onPressed: () {
                //                 Navigator.push(
                //                     context,
                //                     MaterialPageRoute(
                //                         builder: (BuildContext context) =>
                //                             Serviceman_setting()));
                //               },
                //               icon: Icon(Icons.arrow_back_ios)),
                //           Image.asset('assets/logo.png'),
                //         ],
                //       ),
                //       SizedBox(
                //         height: 55,
                //       ),
                //       // ignore: prefer_const_constructors
                //       Center(
                //         // ignore: prefer_const_constructors
                //         child: Text(
                //           '     SAAJHA IS NOT JUST AN    \n APPLICATION, BUT A HELPER!',
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold, fontSize: 20),
                //         ),
                //       ),

                //       Padding(
                //         padding: const EdgeInsets.fromLTRB(18.0, 45, 18, 0),
                //         child: Text(
                //             'Our goal is to provide homeowners with the tools to help them protect against the expense, worry and inconvenience of plumbing, water, sewer, electrical, heating and cooling emergencies. HomeServe prides itself on providing quality local service and expert installation service h do we do this? For nearly two decades, HomeServe has been working with leading utilities and municipalities – now numbering over 1,100 – to make optional service plans available to their customers, members, and residents. These home repair plans help cover household systems that many homeowners are unaware of their responsibility to maintain.  a fact: systems that break from everyday wear and tear are typically not covered by basic homeowners'),
                //       ),
                //     ],
                //   ),
                // ),
                Text(
                    "Welcome to SAAJHA Home Service App! We are a platform dedicated to providing efficient and reliable home services to our customers. Our app connects homeowners with skilled service providers to cater to all their home-related needs.\nAt SAAJHA, we understand the importance of having a trusted service provider at your fingertips. That's why we've created an easy-to-use app that allows you to book a wide range of services, from cleaning and maintenance to repairs and installations, with just a few taps on your smartphone.\nOur team of professionals is carefully vetted to ensure that they are experienced, reliable, and knowledgeable in their respective fields. We believe in delivering top-quality services that exceed our customers' expectations. Whether you're looking to spruce up your living space, fix a plumbing issue, or simply need regular cleaning services, our app has got you covered.\nWith SAAJHA, you can be sure that you're getting the best services at competitive prices. We are committed to providing our customers with a seamless and hassle-free experience. Our customer support team is available round the clock to address any concerns or queries you may have.\nThank you for choosing SAAJHA Home Service App. We look forward to serving you and making your home a better place to live in."),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
