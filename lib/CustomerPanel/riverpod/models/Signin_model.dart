// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:convert';

class Logininfo {
  String? email;
  String? password;

  Logininfo({
    this.email,
    this.password,
  });
  factory Logininfo.fromRawJson(String str) =>
      Logininfo.fromJson(json.decode(str));
  String toRawJson() => json.encode(toJson());

  factory Logininfo.fromJson(Map<String, dynamic> json) => Logininfo(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "email": email,
        "password": password,
      };
}
