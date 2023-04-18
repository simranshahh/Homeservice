// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names, unused_import, unused_field, prefer_final_fields, unused_local_variable

import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:homeservice/CustomerPanel/View/SignIn/customersignin.dart';
import 'package:homeservice/CustomerPanel/View/SignIn/signin.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../riverpod/models/Signup_model.dart';
import '../../riverpod/provider/Signup_provider.dart';
import '../StartScreen.dart/Welcome.dart';

class ServicemanSignup extends ConsumerStatefulWidget {
  const ServicemanSignup({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ServicemanSignupState();
}

class _ServicemanSignupState extends ConsumerState<ServicemanSignup> {
  Future<void> register() async {
    if (_ServicemanSignupKey.currentState!.validate()) {
      ref.read(signupNotifierProvider.notifier).Register(
            emailCtrl.value.text,
            passwordCtrl.value.text,
            context,
          );
    }
  }

  int _value = 1;

  final _ServicemanSignupKey = GlobalKey<FormState>();

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  late Signupclass user;
  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 90, 36, 165),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => Signin()));
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Sign in to experience the best serivces\naround you',
                      style: TextStyle(
                          //fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 160, 20, 0),
              child: Form(
                key: _ServicemanSignupKey,
                child: Card(
                  child: Container(
                    height: height,
                    width: 410,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 60, 20, 0),
                      child: Column(
                        children: [
                          // Container(
                          //   padding: EdgeInsets.all(20),
                          //   child: DropdownButton(
                          //       value: _value,
                          //       items: const [
                          //         DropdownMenuItem(
                          //           value: 1,
                          //           child: Text("First Item"),
                          //         ),
                          //         DropdownMenuItem(
                          //           value: 2,
                          //           child: Text("Second Item"),
                          //         )
                          //       ],
                          //       onChanged: (int? value) {
                          //         setState(() {
                          //           _value = value!;
                          //         });
                          //       },
                          //       hint: Text("Select item")),
                          // ),
                          TextFormField(
                            autovalidateMode: AutovalidateMode.always,
                            controller: emailCtrl,
                            textInputAction: TextInputAction.next,
                            onSaved: (input) => user.email = input,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mail),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              labelText: 'Email Address',
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: passwordCtrl,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (input) => user.password = input,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.room_service),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              labelText: 'Password',
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(6,
                                  errorText:
                                      "Password should be minimum 6 characters"),
                              // FormBuilderValidators.email(),
                            ]),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.deepPurpleAccent)),
                              onPressed: () {
                                register();
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (BuildContext context) =>
                                //             CustomerSignin()));
                              },
                              child: Text('Sign Up'))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
