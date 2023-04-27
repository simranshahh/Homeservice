// // ignore_for_file: use_build_context_synchronously

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();

//   String _errorMessage = '';

//   Future<void> _login() async {
//     final username = _usernameController.text;
//     final password = _passwordController.text;

//     print(username);
//     print(password);

//     final response = await http.post(
//       Uri.parse('http://192.168.1.84:5000/login'),
//       body: {'username': username, 'password': password},
//     );

//     print(response.body);

//     if (response.statusCode == 200) {
//       // Login successful, navigate to home screen or other protected content
//       Navigator.pushNamed(context, 'bnv');
//     } else {
//       // Login failed, show error message
//       setState(() {
//         _errorMessage = 'Invalid username or password';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Login')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextFormField(
//                 controller: _usernameController,
//                 decoration: const InputDecoration(labelText: 'Username'),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter your username';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: _passwordController,
//                 decoration: const InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _login();
//                   }
//                 },
//                 child: const Text('Login'),
//               ),
//               const SizedBox(height: 16),
//               Text(
//                 _errorMessage,
//                 style: const TextStyle(color: Colors.red),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
