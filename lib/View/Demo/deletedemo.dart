import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Demo {
  final int? id;
  final String? title;

  const Demo({this.id, this.title});

  factory Demo.fromJson(Map<String, dynamic> json) {
    return Demo(
      id: json['id'],
      title: json['title'],
    );
  }
}

class Deletedemo extends StatefulWidget {
  @override
  State<Deletedemo> createState() => _DeletedemoState();
}

class _DeletedemoState extends State<Deletedemo> {
  late Future<Demo> _futureDemo;

  @override
  void initState() {
    super.initState();
    _futureDemo = fetchDemo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Data Example'),
      ),
      body: Center(
        child: FutureBuilder<Demo>(
          future: _futureDemo,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(snapshot.data?.title ?? 'Deleted'),
                    ElevatedButton(
                      child: const Text('Delete Data'),
                      onPressed: () {
                        setState(() {
                          _futureDemo =
                              deleteDemo(snapshot.data!.id.toString());
                        });
                      },
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future<Demo> fetchDemo() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
    );

    if (response.statusCode == 200) {
      return Demo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Demo');
    }
  }

  Future<Demo> deleteDemo(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return Demo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete Demo.');
    }
  }
}
