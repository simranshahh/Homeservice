import 'package:flutter/material.dart';

AppBar getSmallAppBar(BuildContext context, String text) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return AppBar(
    elevation: 0,
    automaticallyImplyLeading: false,
    flexibleSpace: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/loginimg.png'),
              fit: BoxFit.fill)),
      child: Padding(
        padding: EdgeInsets.only(bottom: height * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.02),
              child: Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      onPressed: (() => Navigator.pop(context))),
                  SizedBox(
                    width: width * 0.8,
                    child: Text(
                      text,
                      // style: getSimple(context, 0.028).copyWith(
                      //     fontFamily: "Regular",
                      //     color: Colors.white,
                      //     letterSpacing: 0.7),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    // backgroundColor: Colors.blue[400],
    toolbarHeight: height * 0.13,
  );
}
