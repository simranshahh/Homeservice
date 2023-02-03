// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:homeservice/Model/Home/usermodel.dart';
import 'package:homeservice/View/ForgetPassword.dart';
import 'package:homeservice/View/StartScreen.dart/Welcome.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../helper/constants.dart';
import '../../riverpod/provider/signin_provider.dart';

class SignInpageScreen extends ConsumerStatefulWidget {
  const SignInpageScreen({super.key});

  @override
  SignInpageScreenState createState() => SignInpageScreenState();
}

class SignInpageScreenState extends ConsumerState<SignInpageScreen> {
  // googleLogin() async {
  //   print("googleLogin method Called");

  //   GoogleSignIn _googleSignIn = GoogleSignIn();
  //   try {
  //     var result = await _googleSignIn.signIn();

  //     print(result);
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  final userKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> signin() async {
    if (userKey.currentState!.validate()) {
      String tenantValue = getStringAsync(tenantName).toString();
      ref.read(userNotifierProvider.notifier).login(
            email.value.text,
            tenantValue.toString(),
            password.value.text,
            context,
          );

      await setValue(tenantName, tenantValue.toString());
      await setValue(userEmail, email.value.text);
      await setValue(userPassword, password.value.text);
    }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  late Logininfo user;

  @override
  Widget build(BuildContext context) {
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
                            builder: (BuildContext context) => Welcome()));
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Sign In',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
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
            Form(
              key: userKey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 200, 20, 0),
                child: Card(
                  child: Container(
                    height: 350,
                    width: 410,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 30, 20, 20),
                      child: Column(
                        children: [
                          TextFormField(
                            onSaved: (input) => user.email = input,
                            controller: email,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mail),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              labelText: 'Email',
                            ),
                            validator: FormBuilderValidators.compose(
                                [FormBuilderValidators.required()]),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            onSaved: (input) => user.password = input,
                            controller: password,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mail),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              labelText: 'Password',
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(6,
                                  errorText: 'Minimum 6 charcaters required')
                            ]),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 40,
                            width: 250,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 90, 36, 165),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: InkWell(
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onTap: signin,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Color.fromARGB(255, 90, 36, 165),
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ForgetPassword()));
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 480.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 2,
                        width: 100,
                        color: Color.fromARGB(255, 224, 224, 224),
                      ),
                      Text(
                        'Or Continue with',
                        style: TextStyle(
                            color: Color.fromARGB(255, 103, 102, 102)),
                      ),
                      Container(
                        height: 2,
                        width: 100,
                        color: Color.fromARGB(255, 224, 224, 224),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Container(
                      height: 40,
                      width: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          border: Border.all(
                              color: Color.fromARGB(255, 218, 215, 215))),
                      child: Center(
                        child: Image.asset(
                          'assets/google.png',
                          height: 15,
                          width: 15,
                        ),
                      ),
                    ),
                    onTap: (() {
                      GoogleSignIn().signIn();
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
