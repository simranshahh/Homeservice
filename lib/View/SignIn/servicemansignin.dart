// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../Home/Homepage.dart';

Future<FirebaseApp> _initializeFirebase() async {
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  return firebaseApp;
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: FutureBuilder(
      future: _initializeFirebase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ServicemanSignin();
        }
        return CircularProgressIndicator();
      },
    ),
  );
}

class ServicemanSignin extends ConsumerStatefulWidget {
  const ServicemanSignin({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ServicemanSigninState();
}

class _ServicemanSigninState extends ConsumerState<ServicemanSignin> {
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

  @override
  Widget build(BuildContext context) {
    final emailctrl = TextEditingController();
    final passwordctrl = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: 300,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
            ),
            Center(
              child: Card(
                child: Container(
                  height: 350,
                  width: 300,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Text(
                          'Login Page',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          // onSaved: (input) => user!.email = input,
                          controller: emailctrl,
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
                          height: 20,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          // onSaved: (input) => user!.email = input,
                          controller: passwordctrl,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            labelText: 'Password',
                          ),
                          validator: FormBuilderValidators.compose(
                              [FormBuilderValidators.required()]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            User? user = await loginUsingEmailPassword(
                                email: emailctrl.text,
                                password: passwordctrl.text,
                                context: context);
                            print(user);
                            if (user != null) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => Homepage()));
                            }
                          },
                          child: Text('Login'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.deepPurpleAccent,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
