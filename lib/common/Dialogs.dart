// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Future showErrorDialog(BuildContext context, String msg) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return showDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: SimpleDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            children: <Widget>[
              SizedBox(
                height: height * 0.02,
              ),
              Center(
                  child: Image.asset(
                "assets/images/cross.png",
                height: height * 0.05,
              )),
              SizedBox(
                height: height * 0.02,
              ),
              Center(child: Text(msg)),
              SizedBox(
                height: height * 0.02,
              ),
            ],
          ),
        );
      });
}

Future showLoginDialog(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  // final width = MediaQuery.of(context).size.width;
  return showDialog(
      context: context,
      builder: (context) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pop(true);
        });
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: SimpleDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            children: <Widget>[
              SizedBox(
                height: height * 0.04,
              ),
              SizedBox(
                height: height * 0.06,
              ),
              Center(
                child: Image.asset(
                  'assets/done.png',
                  height: height * 0.01,
                ),
              ),
              Center(
                child: Text(
                  "Wait a few seconds ...",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
            ],
          ),
        );
      });
}

Future showConfirmationDialog(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return showDialog(
      context: context,
      builder: (context) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pop(true);
        });
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: SimpleDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            children: <Widget>[
              SizedBox(
                height: height * 0.04,
              ),
              Center(
                child: Image.asset(
                  'assets/done.png',
                  height: height * 0.01,
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "Your account created successfully",
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      });
}

Future showPasswordDialog(BuildContext context, GlobalKey key) {
  final height = MediaQuery.of(context).size.height;
  // final width = MediaQuery.of(context).size.width;
  return showDialog(
      context: context,
      builder: (context) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pop(true);
        });
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: SimpleDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            children: <Widget>[
              SizedBox(
                height: height * 0.04,
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "Password changed succesfully!",
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      });
}
