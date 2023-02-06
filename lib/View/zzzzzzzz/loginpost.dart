// ignore_for_file: empty_constructor_bodies, dead_code, prefer_const_constructors, non_constant_identifier_names, avoid_print, unused_field, unused_local_variable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:homeservice/View/SignIn.dart';
import 'package:http/http.dart' as http;

Future<Logindemo?> createLogindemo(String tenant, String username,
    String password, BuildContext? context) async {
  final response = await http.post(
    Uri.parse('http://103.90.86.54:8080/api/TokenAuth/Authenticate'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Abp.TenantId': '4',
    },
    body: jsonEncode(<String, String>{
      'tenancyName': tenant,
      'userNameOrEmailAddress': username,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    var t = json.decode(response.body)['result']['accessToken'];
    Navigator.push(
        context!,
        MaterialPageRoute(
          builder: (context) => Sign(),
        ));
  } else {
    throw Exception('Failed to create Logindemo.');
  }
  return null;
}

class Logindemo {
  final String Username;
  final String Password;

  Logindemo({required this.Username, required this.Password});
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _Username = TextEditingController();
  final TextEditingController _Password = TextEditingController();

  Future<Logindemo?>? _futureLogindemo;

  String tenantdefault = 'Damak';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextField(
                controller: _Username,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Email'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _Password,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Password'),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                child: Container(
                  height: 40,
                  width: 200,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                onTap: () {
                  print('object');
                  setState(() {
                    _futureLogindemo = createLogindemo(tenantdefault.toString(),
                        _Username.value.text, _Password.value.text, context);

                    print(tenantdefault.toString());
                    print(_Username.value.text);
                    print(_Password.value.text);
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
