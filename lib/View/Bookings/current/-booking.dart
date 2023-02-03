import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Current extends ConsumerStatefulWidget {
  const Current({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CurrentState();
}

class _CurrentState extends ConsumerState<Current> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}
