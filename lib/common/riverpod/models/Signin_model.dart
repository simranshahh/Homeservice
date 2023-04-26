// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:convert';

class Signininfo {
  String? email;
  String? password;

  Signininfo({
    this.email,
    this.password,
  });
  factory Signininfo.fromRawJson(String str) =>
      Signininfo.fromJson(json.decode(str));
  String toRawJson() => json.encode(toJson());

  factory Signininfo.fromJson(Map<String, dynamic> json) => Signininfo(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "email": email,
        "password": password,
      };
}
