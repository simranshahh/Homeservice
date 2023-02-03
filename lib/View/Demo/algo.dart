// import 'package:flutter/material.dart';

// class HomeServicePage extends StatefulWidget {
//   @override
//   _HomeServicePageState createState() => _HomeServicePageState();
// }

// class _HomeServicePageState extends State<HomeServicePage> {
//   // Data for the locations and their distances
//   final locations = ['Location A', 'Location B', 'Location C', 'Location D'];
//   final distances = [
//     [0, 10, 15, 20],
//     [10, 0, 35, 25],
//     [15, 35, 0, 30],
//     [20, 25, 30, 0]
//   ];

//   // The minimum spanning tree of the locations
//   late List<List<int>> mst;

//   // The minimal distance between the locations
//   late var minimalDistance;

//   @override
//   void initState() {
//     super.initState();

//     // Calculate the minimum spanning tree and minimal distance when the page loads
//     calculateMinimalDistance();
//   }

//   void calculateMinimalDistance() {
//     // Create a graph to represent the locations and their distances
//     final graph = {'vertices': locations, 'edges': []};

//     // Add the edges to the graph, with the distances as weights
//     for (int i = 0; i < locations.length; i++) {
//       for (int j = i + 1; j < locations.length; j++) {
//         graph['edges']?.add([locations[i], locations[j], distances[i][j]]);
//       }
//     }

//     // Find the minimum spanning tree of the graph using Kruskal's algorithm
//     late List<List<Object>>? mst = kruskal(graph);

//     // Sum the weights of the edges in the minimum spanning tree to get the minimal distance
//     minimalDistance = 0;
//     for (final edge in mst!) {
//       minimalDistance += edge[2];
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Service'),
//       ),
//       body: Column(
//         children: [
//           Text('Minimal distance: $minimalDistance'),
//           IconButton(
//             onPressed: () {
//               // Recalculate the minimal distance when the button is pressed
//               setState(() {
//                 calculateMinimalDistance();
//               });
//             },
//             icon: Icon(Icons.abc),
//             // children: [Text('Recalculate')],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Kruskal's algorithm implementation
// List<List<Object>>? kruskal(Map<String, dynamic> graph) {
//   // Sort the edges of the graph in non-decreasing order of their weight
//   final edges = List<List<Object>>.from(graph['edges']);
//   edges.sort((a, b) => a[2] - b[2]);
// }
