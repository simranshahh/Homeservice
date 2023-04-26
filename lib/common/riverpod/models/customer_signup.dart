// To parse this JSON data, do
//
//     final CustomerRegister = CustomerRegisterFromJson(jsonString);

import 'dart:convert';

class CustomerRegister {
  CustomerRegister({
    this.email,
    this.password,
    this.refreshTokens,
    this.role,
    this.verified,
    this.cordinates,
    this.phone,
    this.address,
    this.fullName,
    this.picture,
    this.id,
    this.v,
  });

  String? email;
  String? password;
  List<dynamic>? refreshTokens;
  String? role;
  bool? verified;
  String? cordinates;
  String? phone;
  String? address;
  String? fullName;
  String? picture;
  String? id;
  int? v;

  factory CustomerRegister.fromRawJson(String str) =>
      CustomerRegister.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CustomerRegister.fromJson(Map<String, dynamic> json) =>
      CustomerRegister(
        email: json["email"],
        password: json["password"],
        refreshTokens: json["refreshTokens"] == null
            ? []
            : List<dynamic>.from(json["refreshTokens"]!.map((x) => x)),
        role: json["role"],
        verified: json["verified"],
        cordinates: json["cordinates"],
        phone: json["phone"],
        address: json["address"],
        fullName: json["full_name"],
        picture: json["picture"],
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "refreshTokens": refreshTokens == null
            ? []
            : List<dynamic>.from(refreshTokens!.map((x) => x)),
        "role": role,
        "verified": verified,
        "cordinates": cordinates,
        "phone": phone,
        "address": address,
        "full_name": fullName,
        "picture": picture,
        "_id": id,
        "__v": v,
      };
}
