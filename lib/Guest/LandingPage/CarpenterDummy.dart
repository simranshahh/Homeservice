// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/auth/signin.dart';

class CarpenterDummy extends ConsumerStatefulWidget {
  const CarpenterDummy({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CarpenterDummyState();
}

class _CarpenterDummyState extends ConsumerState<CarpenterDummy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Services'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/landingsignup.png',
              height: 200,
              width: 200,
            ),
            const Text('Sign In to View Services'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Signin()),
                  (route) => false,
                );
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.deepPurpleAccent)),
              child: const Text('Sign In'),
            )
          ],
        ),
      ),
    );
  }
}
