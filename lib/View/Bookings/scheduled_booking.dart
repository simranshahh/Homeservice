import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Scheduled extends ConsumerStatefulWidget {
  const Scheduled({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScheduledState();
}

class _ScheduledState extends ConsumerState<Scheduled> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 100,
          width: 370,
          child: Text(
            'Painter',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
