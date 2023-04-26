// // ignore_for_file: prefer_const_constructors

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class User {
//   final int? id;
//   final int? userId;
//   final String? title;
//   final String? body;

//   User({
//     this.userId,
//     this.title,
//     this.body,
//     this.id,
//   });
// }

// class Sandy extends StatefulWidget {
//   const Sandy({super.key});

//   @override
//   State<Sandy> createState() => _SandyState();
// }

// class _SandyState extends State<Sandy> {
//   //Applying get request.

//   Future<List<User>> getRequest() async {
//     //replace your restFull API here.
//     String url = "https://jsonplaceholder.typicode.com/posts";
//     final response = await http.get(Uri.parse(url));

//     var responseData = json.decode(response.body);

//     //Creating a list to store input data;
//     List<User> users = [];

//     for (var singleUser in responseData) {
//       User userdata = User(
//           id: singleUser["id"],
//           userId: singleUser["userId"],
//           title: singleUser["title"],
//           body: singleUser["body"]);

//       //Adding user to the list.
//       users.add(userdata);
//     }
//     return users;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Http Get Request."),
//           leading: Icon(
//             Icons.get_app,
//           ),
//         ),
//         body: Container(
//           padding: EdgeInsets.all(16.0),
//           child: FutureBuilder(
//             future: getRequest(),
//             builder: (BuildContext ctx, AsyncSnapshot snapshot) {
//               if (snapshot.data == null) {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else {
//                 return ListView.builder(
//                   itemCount: snapshot.data.length,
//                   itemBuilder: (ctx, index) => ListTile(
//                     title: Text(snapshot.data[index].title),
//                     subtitle: Text(snapshot.data[index].body),
//                     contentPadding: EdgeInsets.only(bottom: 20.0),
//                   ),
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
