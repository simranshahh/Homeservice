// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, avoid_print, no_leading_underscores_for_local_identifiers, unused_import, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:homeservice/CustomerPanel/BottomnavScreen/BottomNabBar.dart';
import 'package:homeservice/CustomerPanel/Model/Home/usermodel.dart';
import 'package:homeservice/CustomerPanel/View/ForgetPassword.dart';
import 'package:homeservice/CustomerPanel/View/SignIn/signin.dart';
import 'package:homeservice/CustomerPanel/View/StartScreen.dart/Welcome.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../helper/constants.dart';
import '../../riverpod/provider/signin_provider.dart';

class CustomerSignin extends ConsumerStatefulWidget {
  const CustomerSignin({super.key});

  @override
  CustomerSigninState createState() => CustomerSigninState();
}

class CustomerSigninState extends ConsumerState<CustomerSignin> {
  User? user;

  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "usernotfound") {
        print("no user found of that email");
      }
    }

    return user;
  }

  googleLogin() async {
    print("googleLogin method Called");
    final _googleSignIn = GoogleSignIn();
    var result = await _googleSignIn.signIn();
    print("Result $result");
    print(result!.displayName);
    print(result.id);
    print(result.email);
    print(result.photoUrl);
    print(result.serverAuthCode);
  }

  // final userKey = GlobalKey<FormState>();
  // final email = TextEditingController();
  // final password = TextEditingController();

  // Future<void> signin() async {
  //   if (userKey.currentState!.validate()) {
  //     String tenantValue = getStringAsync(tenantName).toString();
  //     ref.read(userNotifierProvider.notifier).login(
  //           email.value.text,
  //           tenantValue.toString(),
  //           password.value.text,
  //           context,
  //         );

  //     await setValue(tenantName, tenantValue.toString());
  //     await setValue(userEmail, email.value.text);
  //     await setValue(userPassword, password.value.text);
  //   }
  // }

  // @override
  // void dispose() {
  //   email.dispose();
  //   password.dispose();
  //   super.dispose();
  // }

  // late Logininfo user;

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final password = TextEditingController();
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
              // key: userKey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 200, 20, 0),
                child: Card(
                  child: Container(
                    height: 400,
                    width: 410,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 30, 20, 20),
                      child: Column(
                        children: [
                          TextFormField(
                            //  onSaved: (input) => user.email = input,
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
                            // onSaved: (input) => user.password = input,
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
                                onTap: () async {
                                  // User? user = await loginUsingEmailPassword(
                                  //     email: email.text,
                                  //     password: password.text,
                                  //     context: context);
                                  // print(user);
                                  // if (user != null) {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BottomNavScreen()));
                                  //  }
                                },
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
                        width: 50,
                        color: Color.fromARGB(255, 224, 224, 224),
                      ),
                      Text(
                        'Or Continue with',
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
                      googleLogin();
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
