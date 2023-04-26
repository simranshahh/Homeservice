// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Model/Home/Featuredservices.dart';

class DetailPage extends ConsumerStatefulWidget {
  const DetailPage(this.service, {super.key});
  final FeaturedServices service;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          Center(
            child: SizedBox(
              height: 100,
              child: Image.asset(widget.service.image),
            ),
          ),
          Center(
            child: Text(
              widget.service.pname,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              widget.service.dprice,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
