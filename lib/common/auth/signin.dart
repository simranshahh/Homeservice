// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:homeservice/common/auth/chooseSignupPage.dart';
import 'package:homeservice/common/helper/constants.dart';
import 'package:http/http.dart' as http;

import "package:hooks_riverpod/hooks_riverpod.dart";
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Customer/View/CustomerSignup/Customersignup.dart';
import 'chooseSignin.dart';
import '../riverpod/provider/signin_provider.dart';
// import '../'../../../common/auth/SignupPage.dart'nin.dart';

class Signin extends ConsumerStatefulWidget {
  const Signin({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SigninState();
}

class _SigninState extends ConsumerState<Signin> {
  final _formKey = GlobalKey<FormState>();

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  Future<void> Signin() async {
    if (_formKey.currentState!.validate()) {
      await ref.read(userNotifierProvider.notifier).signin(
            emailCtrl.value.text,
            passwordCtrl.value.text,
            context,
          );
      await setValue(emails, emailCtrl.value.text);
      await setValue(passwords, passwordCtrl.value.text);
    }
  }

  Icon lockIcon = LockIcon().lock;

  bool offsecureText1 = true;

  void _onlockPressed1() {
    if (offsecureText1 == true) {
      setState(() {
        offsecureText1 = false;
        lockIcon = LockIcon().open;
      });
    } else {
      setState(() {
        offsecureText1 = true;
        lockIcon = LockIcon().lock;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ChooseSigninPage()));
            },
          ),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Welcome',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 25,
                    ),
                    Text('Sign in to continue',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    const SizedBox(
                      height: 35,
                    ),
                    TextFormField(
                      controller: emailCtrl,
                      textInputAction: TextInputAction.next,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email()
                      ]),
                      decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: passwordCtrl,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(6)
                      ]),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: lockIcon, onPressed: () => _onlockPressed1()),
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        labelText: 'Password',
                      ),
                      obscureText: offsecureText1,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurpleAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                //  backgroundColor: buttonColor,
                                textStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              Signin();
                            },
                            //    ref.read(userNotifierProvider.notifier).Signin(
                            //        emailCtrl.value.text,
                            //        passwordCtrl.value.text);
                            //   if (_formKey.currentState!.validate()) {
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) => yhome(),
                            //       ));
                            //  }
                            // onPressed: () {},
                            child: const Text(
                              "Signin",
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ))),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 2,
                          width: 50,
                          color: Color.fromARGB(255, 224, 224, 224),
                        ),
                        Text(
                          'Not a User?',
                          style: TextStyle(
                              color: Color.fromARGB(255, 103, 102, 102)),
                        ),
                        Container(
                          height: 2,
                          width: 50,
                          color: Color.fromARGB(255, 224, 224, 224),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ChooseSignupPage()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}












// // ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, avoid_print, no_leading_underscores_for_local_identifiers, unused_import, use_build_context_synchronously

// import 'dart:ffi';
// import 'dart:math';
// import 'package:http/http.dart';
// import 'package:flutter/material.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:homeservice/CustomerPanel/BottomnavScreen/BottomNabBar.dart';
// import 'package:homeservice/CustomerPanel/Model/Home/usermodel.dart';
// import 'package:homeservice/CustomerPanel/View/ForgetPassword.dart';
// import 'package:homeservice/CustomerPanel/View/SignIn/signin.dart';
// import 'package:homeservice/CustomerPanel/View/StartScreen.dart/Welcome.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:http/http.dart' as http;
// import '../../helper/constants.dart';
// import '../../riverpod/provider/signin_provider.dart';
// import '../Signup/Customersignup.dart';
// import '../Signup/SignupPage.dart';

// class Signin extends ConsumerStatefulWidget {
//   const Signin({super.key});

//   @override
//   SigninState createState() => SigninState();
// }

// class SigninState extends ConsumerState<Signin> {
//   final _SigninKey = GlobalKey<FormState>();

//   final emailctrl = TextEditingController();
//   final passwordctrl = TextEditingController();
//   void Signin(String email, password) async {
//     try {
//       String U = "http://192.168.1.70:5000/api/auth/Signin";
//       var data = {'email': email, 'password': password};
//       print(data);
//       final response = await http.post(Uri.parse(U), body: data, headers: {
//         "Access-Control-Allow-Origin": "*",
//       });
//       print(response.statusCode);

//       if (response.statusCode == 200) {
//         print('signed in');

//         print('failed to sign in');
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   // Future<void> Signin() async {
//   //   if (_SigninKey.currentState!.validate()) {
//   //     ref.read(userNotifierProvider.notifier).Signin(
//   //           emailctrl.value.text,
//   //           passwordctrl.value.text,
//   //           context,
//   //         );

//   //     await setValue(userEmail, emailctrl.value.text);
//   //     await setValue(userPassword, passwordctrl.value.text);
//   //   }
//   // }
//   // void Signin(String email, password) async {
//   //   try {
//   //     String U = 'http://192.168.1.83/api/auth/Signin';
//   //     var data = {'email': email, 'password': password};
//   //     final response = await http.post(Uri.parse(U), body: data);
//   //     print(response.statusCode);

//   // if (response.statusCode == 200) {
//   //   print('signed in');
//   //   Navigator.of(context).pushReplacement(
//   //       MaterialPageRoute(builder: (context) => BottomNavScreen()));
//   // } else {
//   //   print('failed to sign in');
//   // }
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   // }
//   late Signininfo user;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   void dispose() {
//     emailctrl.dispose();
//     passwordctrl.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // void Signin(String email, password) async {
//     //   try {
//     //     String U = ''http://192.168.1.70:5000/api/auth/Signin'';
//     //     var data = {'email': email, 'password': password};
//     //     final response = await http.post(Uri.parse(U), body: data);
//     //     print(response.statusCode);

//     // if (response.statusCode == 200) {
//     //   print('signed in');
//     //   Navigator.of(context).pushReplacement(
//     //       MaterialPageRoute(builder: (context) => BottomNavScreen()));
//     // } else {
//     //   print('failed to sign in');
//     // }
//     //   } catch (e) {
//     //     print(e.toString());
//     //   }
//     // }

//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Form(
//           key: _SigninKey,
//           child: Stack(
//             children: <Widget>[
//               Container(
//                 decoration: BoxDecoration(
//                     color: Color.fromARGB(255, 90, 36, 165),
//                     borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(15),
//                         bottomRight: Radius.circular(15))),
//                 height: MediaQuery.of(context).size.height * 0.4,
//                 width: MediaQuery.of(context).size.width,
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       IconButton(
//                         color: Colors.white,
//                         icon: Icon(Icons.arrow_back_ios),
//                         onPressed: () {
//                           // Navigator.of(context).pushReplacement(MaterialPageRoute(
//                           //     builder: (BuildContext context) => Signin()));
//                         },
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text(
//                         'Sign In',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 20,
//                             color: Colors.white),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text(
//                         'Sign in to experience the best serivces\naround you',
//                         style: TextStyle(
//                             //fontWeight: FontWeight.w500,
//                             fontSize: 15,
//                             color: Colors.white),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Form(
//                 // key: userKey,
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(20.0, 200, 20, 0),
//                   child: Card(
//                     child: Container(
//                       height: 400,
//                       width: 410,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20)),
//                       child: Padding(
//                         padding: const EdgeInsets.fromLTRB(20.0, 30, 20, 20),
//                         child: Column(
//                           children: [
//                             TextFormField(
//                               onSaved: (input) => user.email = input,
//                               controller: emailctrl,
//                               textInputAction: TextInputAction.next,
//                               decoration: InputDecoration(
//                                 prefixIcon: Icon(Icons.mail),
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(15)),
//                                 labelText: 'Email',
//                               ),
//                               // validator: FormBuilderValidators.compose(
//                               //     [FormBuilderValidators.required()]),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             TextFormField(
//                               onSaved: (input) => user.password = input,
//                               controller: passwordctrl,
//                               textInputAction: TextInputAction.done,

//                               decoration: InputDecoration(
//                                 prefixIcon: Icon(Icons.mail),
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(15)),
//                                 labelText: 'Password',
//                               ),
//                               // validator: FormBuilderValidators.compose([
//                               //   FormBuilderValidators.required(),
//                               //   FormBuilderValidators.minLength(6,
//                               //       errorText: 'Minimum 6 charcaters required')
//                               // ]),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Container(
//                               height: 40,
//                               width: 250,
//                               decoration: BoxDecoration(
//                                   color: Color.fromARGB(255, 90, 36, 165),
//                                   borderRadius: BorderRadius.circular(15)),
//                               child: Center(
//                                 child: InkWell(
//                                     child: Text(
//                                       'Sign In',
//                                       style: TextStyle(color: Colors.white),
//                                     ),
//                                     onTap: () {
//                                       Signin(emailctrl.value.text,
//                                           passwordctrl.value.text);
//                                     }

//                                     // User? user = await SigninUsingEmailPassword(
//                                     //     email: email.text,
//                                     //     password: password.text,
//                                     //     context: context);
//                                     // print(user);
//                                     // if (user != null) {
//                                     // Navigator.of(context).pushReplacement(
//                                     //     MaterialPageRoute(
//                                     //         builder: (context) =>
//                                     //             BottomNavScreen()));
//                                     //  }

//                                     ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 15,
//                             ),
//                             InkWell(
//                               child: Text(
//                                 'Forgot Password?',
//                                 style: TextStyle(
//                                   color: Color.fromARGB(255, 90, 36, 165),
//                                 ),
//                               ),
//                               onTap: () {
//                                 Navigator.of(context).pushReplacement(
//                                     MaterialPageRoute(
//                                         builder: (BuildContext context) =>
//                                             ForgetPassword()));
//                               },
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 480.0),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Container(
//                           height: 2,
//                           width: 50,
//                           color: Color.fromARGB(255, 224, 224, 224),
//                         ),
//                         Text(
//                           'Not a User?',
//                           style: TextStyle(
//                               color: Color.fromARGB(255, 103, 102, 102)),
//                         ),
//                         Container(
//                           height: 2,
//                           width: 50,
//                           color: Color.fromARGB(255, 224, 224, 224),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     InkWell(
//                       child: Text(
//                         'Sign Up',
//                         style: TextStyle(
//                             color: Colors.deepPurpleAccent,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (BuildContext context) =>
//                                     SignupPage()));
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }