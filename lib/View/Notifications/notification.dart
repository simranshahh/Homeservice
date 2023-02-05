import 'package:flutter/material.dart#';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Notification_page extends ConsumerStatefulWidget {
  const Notification_page({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _Notification_pageState();
}

class _Notification_pageState extends ConsumerState<Notification_page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 80,
          width: 390,
          color: Colors.red,
        ),
      ),
    );
  }
}
