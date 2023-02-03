import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Location extends ConsumerStatefulWidget {
  const Location({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LocationState();
}

class _LocationState extends ConsumerState<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
