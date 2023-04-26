// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names, unused_import, unused_field, prefer_final_fields, unused_local_variable

import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:homeservice/common/Services/constants.dart';
import 'package:homeservice/Serviceprovider/View/Serviceman_Profile/Location.dart';
import 'package:homeservice/common/auth/signin.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../common/riverpod/models/SignupModel.dart';
import '../../common/riverpod/provider/Signup_provider.dart';

class ServicemanSignup extends ConsumerStatefulWidget {
  const ServicemanSignup({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ServicemanSignupState();
}

class _ServicemanSignupState extends ConsumerState<ServicemanSignup> {
  int _value = 1;
  final a = getStringAsync(location);

  final _ServicemanSignupKey = GlobalKey<FormState>();
  final fullnameCtrl = TextEditingController();
  final locationCtrl = TextEditingController();

  final emailCtrl = TextEditingController();
  final phonenoCtrl = TextEditingController();
  final priceCtrl = TextEditingController();

  final passwordCtrl = TextEditingController();

  late Register user;
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
                      padding: const EdgeInsets.fromLTRB(20.0, 20, 0, 0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
                              // width: 100,
                              // padding: EdgeInsets.all(20),
                              child: DropdownButton(
                                  value: _value,
                                  items: const [
                                    DropdownMenuItem(
                                      value: 1,
                                      child: Text("Carpenter"),
                                    ),
                                    DropdownMenuItem(
                                      value: 2,
                                      child: Text("Plumber"),
                                    ),
                                    DropdownMenuItem(
                                      value: 3,
                                      child: Text("Electrician"),
                                    ),
                                    DropdownMenuItem(
                                      value: 4,
                                      child: Text("Laundary"),
                                    )
                                  ],
                                  onChanged: (int? value) {
                                    setState(() {
                                      _value = value!;
                                    });
                                  },
                                  hint: Text("Select item")),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              // autovalidateMode: AutovalidateMode.always,
                              controller: fullnameCtrl,
                              textInputAction: TextInputAction.next,
                              // onSaved: (input) => user. = input,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                labelText: 'Full Name',
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              //autovalidateMode: AutovalidateMode.always,
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
                              autovalidateMode: AutovalidateMode.always,
                              controller: phonenoCtrl,
                              textInputAction: TextInputAction.next,
                              // onSaved: (input) => user.email = input,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.call),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                labelText: 'Phone Number',
                              ),
                              // validator: FormBuilderValidators.compose([
                              //   FormBuilderValidators.required(),
                              //]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              autovalidateMode: AutovalidateMode.always,
                              controller: priceCtrl,
                              textInputAction: TextInputAction.next,
                              // onSaved: (input) => user.email = input,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.price_change_rounded),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                labelText: 'Price/hr',
                              ),
                              // validator: FormBuilderValidators.compose([
                              //   FormBuilderValidators.required(),
                              //]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              // initialValue: a,
                              //readOnly: true,
                              autovalidateMode: AutovalidateMode.always,
                              controller: locationCtrl,
                              textInputAction: TextInputAction.next,
                              // onSaved: (input) => user.email = input,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.location_city),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                labelText: 'Location',
                              ),
                              // validator: FormBuilderValidators.compose([
                              //   FormBuilderValidators.required(),
                              //]),
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
                                prefixIcon: Icon(Icons.password),
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
                                onPressed: () {},
                                child: Text('Sign Up'))
                          ],
                        ),
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
