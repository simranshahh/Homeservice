// ignore_for_file: prefer_const_constructors, file_names, unused_local_variable

import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.all(7.0),
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
                  height: height * 0.25,
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
          padding: const EdgeInsets.all(7.0),
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
                  height: height * 0.25,
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
                      Text(
                        "wait for your ID to be verified",
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

Future dialog(String name, BuildContext context) {
  return showDialog(
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

Future canceldialog(BuildContext context) {
  final height = MediaQuery.of(context).size.height;

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/done.png',
              height: height * 0.04,
            ),
            Text(
                '     Your Service has been    \n      Cancelled successfully!'),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      );
    },
  );
}
