import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:homeservice/View/ForgetPassword.dart';
import 'package:homeservice/View/SignIn.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _User = GlobalKey<FormBuilderState>();
  final _Password = GlobalKey<FormBuilderState>();
  final email = TextEditingController();
  final password = TextEditingController();

  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        //MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Color.fromARGB(255, 90, 36, 165);
      }
      return Color.fromARGB(255, 90, 36, 165);
    }

    return SafeArea(
      child: FormBuilder(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 120),
                child: Image.asset(
                  'assets/signin.png',
                  width: 120,
                  height: 120,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 75.0),
                child: Text(
                  'Create your Account',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 30, 20, 20),
                child: FormBuilder(
                  key: _User,
                  child: FormBuilderTextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      labelText: 'Email',
                    ),
                    name: 'username',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 0),
                child: FormBuilder(
                  key: _Password,
                  child: FormBuilderTextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      labelText: 'Password',
                    ),
                    name: 'password',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(85, 5, 0, 0),
                child: Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text('Remember me')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(55, 4, 0, 20),
                child: Container(
                  height: 40,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 90, 36, 165),
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: InkWell(
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                      // onTap: () {
                      //   Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //       builder: (BuildContext context) => Homepage()));
                      // },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 98.0, bottom: 15),
                child: InkWell(
                  child: Text(
                    'Forgot the password?',
                    style: TextStyle(
                      color: Color.fromARGB(255, 90, 36, 165),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => ForgetPassword()));
                  },
                ),
              ),
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
                    style: TextStyle(color: Color.fromARGB(255, 103, 102, 102)),
                  ),
                  Container(
                    height: 2,
                    width: 100,
                    color: Color.fromARGB(255, 224, 224, 224),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40,
                      width: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          border: Border.all(
                              color: Color.fromARGB(255, 218, 215, 215))),
                      child: Center(
                        child: Image.asset(
                          'assets/facebook.png',
                          height: 15,
                          width: 15,
                        ),
                      ),
                    ),
                    Container(
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
                    Container(
                      height: 40,
                      width: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          border: Border.all(
                              color: Color.fromARGB(255, 218, 215, 215))),
                      child: Center(
                        child: Image.asset(
                          'assets/mac.png',
                          height: 15,
                          width: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(65, 20, 20, 0),
                child: Row(
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey),
                    ),
                    InkWell(
                      child: Text(
                        ' SignIn',
                        style: TextStyle(
                          color: Color.fromARGB(255, 90, 36, 165),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => Sign()));
                      },
                    )
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
