import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Notifications extends ConsumerStatefulWidget {
  const Notifications({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NotificationsState();
}

class _NotificationsState extends ConsumerState<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Notifications')));
  }
}
