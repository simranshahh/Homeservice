// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Cart extends ConsumerStatefulWidget {
  const Cart({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartState();
}

class _CartState extends ConsumerState<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('My cart')),
    );
  }
}
