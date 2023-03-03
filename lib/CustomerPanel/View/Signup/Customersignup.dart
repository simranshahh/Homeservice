// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:homeservice/CustomerPanel/View/SignIn/customersignin.dart';
import 'package:homeservice/CustomerPanel/View/Signup/signup.dart';
import 'package:homeservice/CustomerPanel/riverpod/provider/signup_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../riverpod/models/signup_model.dart';
import '../StartScreen.dart/Welcome.dart';

class CustomerSignup extends ConsumerStatefulWidget {
  const CustomerSignup({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomerSignupState();
}

class _CustomerSignupState extends ConsumerState<CustomerSignup> {
  Future<void> register() async {
    if (_signupKey.currentState!.validate()) {
      ref.read(signupNotifierProvider.notifier).Register(
          FirstName.toString(),
          LastName.toString(),
          usernameCtrl.value.text,
          phoneCtrl.value.text,
          emailCtrl.value.text,
          passwordCtrl.value.text,
          context);
    }
  }

  var FirstName = "app";
  var LastName = "app";

  final _signupKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController();
  final surnameCtrl = TextEditingController();
  final usernameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  late SignupClass user;
  @override
  void dispose() {
    nameCtrl.dispose();
    surnameCtrl.dispose();
    usernameCtrl.dispose();
    phoneCtrl.dispose();
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _signupKey,
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
                          builder: (BuildContext context) => SignUp()));
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
              child: Card(
                child: Container(
                  height: 500,
                  width: 410,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 60, 20, 20),
                    child: Column(
                      children: [
                        TextFormField(
                          //autovalidateMode: AutovalidateMode.always,
                          controller: usernameCtrl,
                          textInputAction: TextInputAction.next,
                          //onSaved: (input) => user.username = input,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            labelText: 'Name',
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: emailCtrl,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          // onSaved: (input) => user.emailAddress = input,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.room_service),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            labelText: 'Email',
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
                          ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: phoneCtrl,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.phone,
                          onSaved: (input) => user.phoneNo,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            labelText: 'PhoneNo',
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: phoneCtrl,
                          onSaved: (input) => user.phoneNo = input,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            labelText: 'Password',
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.minLength(6,
                                errorText: "minimum 6 characters required")
                          ]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 25,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 90, 36, 165),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: InkWell(
                              child: Text(
                                'Sign Up',
                                style: TextStyle(color: Colors.white),
                              ),
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            CustomerSignin()));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
