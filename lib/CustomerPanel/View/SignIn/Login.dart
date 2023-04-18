// ignore_for_file: file_names
// // ignore_for_file: sized_box_for_whitespace

// import 'dart:convert';
// import 'package:nb_utils/nb_utils.dart';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import "package:hooks_riverpod/hooks_riverpod.dart";
// import 'package:form_builder_validators/form_builder_validators.dart';

// import '../../riverpod/provider/signin_provider.dart';

// class Signin extends ConsumerStatefulWidget {
//   const Signin({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _SigninState();
// }

// class _SigninState extends ConsumerState<Signin> {
//   final _formKey = GlobalKey<FormState>();

//   final emailCtrl = TextEditingController();
//   final passwordCtrl = TextEditingController();

//   Future<void> login() async {
//     if (_formKey.currentState!.validate()) {
//       await ref
//           .read(userNotifierProvider.notifier)
//           .login(emailCtrl.value.text, passwordCtrl.value.text, context);
//       // .logIn(emailCtrl.value.text, passwordCtrl.value.text);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           foregroundColor: Colors.black,
//           elevation: 0,
//         ),
//         body: Form(
//           key: _formKey,
//           child: Container(
//             color: Colors.white,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Welcome',
//                       // style: style.copyWith(
//                       //     fontSize: 40, fontWeight: FontWeight.bold)
//                     ),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     Text(
//                       'Sign in to continue',
//                       // style: stylee.copyWith(
//                       //     fontSize: 20, fontWeight: FontWeight.w500)
//                     ),
//                     const SizedBox(
//                       height: 35,
//                     ),
//                     TextFormField(
//                       controller: emailCtrl,
//                       validator: FormBuilderValidators.compose([
//                         FormBuilderValidators.required(),
//                         FormBuilderValidators.email()
//                       ]),
//                       // decoration: textDecoration.copyWith(
//                       //   labelText: "Email",
//                       //   prefixIcon: const Icon(Icons.email),
//                       // ),
//                     ),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     TextFormField(
//                       controller: passwordCtrl,
//                       validator: FormBuilderValidators.compose([
//                         FormBuilderValidators.required(),
//                         FormBuilderValidators.minLength(6)
//                       ]),
//                       // decoration: textDecoration.copyWith(
//                       //   labelText: "Password",
//                       //   prefixIcon: const Icon(Icons.lock),
//                       // ),
//                       obscureText: true,
//                     ),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     Container(
//                         width: double.infinity,
//                         height: 60,
//                         child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10.0)),
//                                 //  backgroundColor: buttonColor,
//                                 textStyle: const TextStyle(
//                                     fontSize: 16, fontWeight: FontWeight.bold)),
//                             onPressed: () => login()
//                             //  ref.read(userNotifierProvider.notifier).login(
//                             //      emailCtrl.value.text,
//                             //      passwordCtrl.value.text);
//                             // if (_formKey.currentState!.validate()) {
//                             // Navigator.push(
//                             //     context,
//                             //     MaterialPageRoute(
//                             //       builder: (context) => yhome(),
//                             //     ));
//                             // // }
//                             ,
//                             // onPressed: () {},
//                             child: const Text(
//                               "Login",
//                               style: TextStyle(
//                                 fontSize: 19,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ))),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                   ]),
//             ),
//           ),
//         ));
//   }
// }
