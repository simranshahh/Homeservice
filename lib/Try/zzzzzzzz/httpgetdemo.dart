// // ignore_for_file: unused_local_variable, non_constant_identifier_names, prefer_const_constructors, camel_case_types

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class httpdemo {
//   final int? id;
//   final String? title;

//   httpdemo({
//     this.id,
//     this.title,
//   });
// }

// class Learn extends StatefulWidget {
//   const Learn({super.key});

//   @override
//   State<Learn> createState() => _LearnState();
// }

// Future<List<httpdemo>> hello() async {
//   String url = 'https://my-json-server.typicode.com/typicode/demo/posts';
//   final Response = await http.get(Uri.parse(url));
//   var Responsedata = json.decode(Response.body);

//   List<httpdemo> demo = [];
//   for (var hi in Responsedata) {
//     httpdemo demmo = httpdemo(
//       id: hi['id'],
//       title: hi['title'],
//     );

//     demo.add(demmo);
//   }
//   return demo;
// }

// class _LearnState extends State<Learn> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Http Get Request."),
//         leading: Icon(
//           Icons.get_app,
//         ),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(16.0),
//         child: FutureBuilder(
//           future: hello(),
//           builder: (BuildContext ctx, AsyncSnapshot snapshot) {
//             if (snapshot.data == null) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else {
//               return ListView.builder(
//                 itemCount: snapshot.data.length,
//                 itemBuilder: (ctx, index) => ListTile(
//                   title: Text(snapshot.data[index].id.toString()),
//                   subtitle: Text(snapshot.data[index].title.toString()),
//                   contentPadding: EdgeInsets.only(bottom: 20.0),
//                 ),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
