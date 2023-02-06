// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:homeservice/View/SignIn/customersignin.dart';
import 'package:homeservice/View/Signup/Signup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../StartScreen.dart/Welcome.dart';

class ServicemanSignup extends ConsumerStatefulWidget {
  const ServicemanSignup({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ServicemanSignupState();
}

class _ServicemanSignupState extends ConsumerState<ServicemanSignup> {
  List<String> list = <String>['Carpenter', 'Plumber', 'Laundary', 'Cleaning'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _signupKey,
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
                    'Sign Up As Service Provider',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Text(
                  //   'Sign in to experience the best serivces\naround you',
                  //   style: TextStyle(
                  //       //fontWeight: FontWeight.w500,
                  //       fontSize: 15,
                  //       color: Colors.white),
                  // )
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
                    padding: const EdgeInsets.fromLTRB(20.0, 40, 20, 20),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        TextFormField(
                          //autovalidateMode: AutovalidateMode.always,
                          //controller: usernameCtrl,
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
                          //  controller: emailCtrl,
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 270,
                              height: 60,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white),
                              child: DropdownButton<String>(
                                hint: Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.medical_services_sharp),
                                      Text('  Service Type'),
                                    ],
                                  ),
                                ),
                                icon: Padding(
                                  padding: const EdgeInsets.only(left: 80.0),
                                  child: const Icon(
                                      Icons.arrow_drop_down_circle_outlined),
                                ),
                                elevation: 16,
                                style:
                                    const TextStyle(color: Colors.deepPurple),
                                underline: Container(
                                  height: 2,
                                  // color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? value) {},
                                items: list.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              //    controller: phoneCtrl,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.phone,
                              //onSaved: (input) => user.phoneNo,
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
                              //    controller: phoneCtrl,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.phone,
                              //onSaved: (input) => user.phoneNo,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.location_city),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                labelText: 'Location',
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              //    controller: phoneCtrl,
                              //    onSaved: (input) => user.phoneNo = input,
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
                            Center(
                              child: Container(
                                height: 40,
                                width: 150,
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
                            ),
                          ],
                        ),
                      ]),
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
