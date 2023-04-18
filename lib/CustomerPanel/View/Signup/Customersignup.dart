// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names, unused_import, avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:homeservice/CustomerPanel/View/SignIn/customersignin.dart';
import 'package:homeservice/CustomerPanel/View/SignIn/signin.dart';
import 'package:homeservice/CustomerPanel/riverpod/provider/Signup_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

import '../../riverpod/models/signup_model.dart';
import '../StartScreen.dart/Welcome.dart';

class CustomerSignup extends ConsumerStatefulWidget {
  const CustomerSignup({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomerSignupState();
}

class _CustomerSignupState extends ConsumerState<CustomerSignup> {
  final _signupKey = GlobalKey<FormState>();

  final emailctrl = TextEditingController();
  final passwordctrl = TextEditingController();

  void login(String email, password) {
    try {
      Response response = post(
          Uri.parse('https://localhost:5000/api/auth/register'),
          body: {'email': email, 'password': password}) as Response;

      if (response.statusCode == 200) {
        print('signed in');
      } else {
        print('failed to sign in');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                child: Card(
                  child: Container(
                    height: height * 0.45,
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
                            controller: emailctrl,
                            textInputAction: TextInputAction.next,
                            //onSaved: (input) => user.username = input,
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
                            controller: passwordctrl,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            // onSaved: (input) => user.emailAddress = input,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.room_service),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              labelText: 'Password',
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.email(),
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
                                login(emailctrl.text.toString(),
                                    passwordctrl.text.toString());
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Signin()));
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
