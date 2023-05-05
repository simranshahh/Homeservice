// To parse this JSON data, do
//
//     final CustomerRegister = CustomerRegisterFromJson(jsonString);

import 'dart:convert';

class CustomerRegister {
  CustomerRegister({
    this.fullName,
    this.email,
    this.phone,
    this.address,
    this.password,
    this.cordinates,
  });
  String? fullName;
  String? email;
  String? phone;
  String? address;
  String? password;
  String? cordinates;

  factory CustomerRegister.fromRawJson(String str) =>
      CustomerRegister.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CustomerRegister.fromJson(Map<String, dynamic> json) =>
      CustomerRegister(
        fullName: json["full_name"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        address: json["address"],
        cordinates: json["cordinates"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "email": email,
        "password": password,
        "phone": phone,
        "address": address,
        "cordinates": cordinates,
      };
}
