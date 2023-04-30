// To parse this JSON data, do
//
//     final customerInfo = customerInfoFromJson(jsonString);

import 'dart:convert';

CustomerInfo customerInfoFromJson(String str) =>
    CustomerInfo.fromJson(json.decode(str));

String customerInfoToJson(CustomerInfo data) => json.encode(data.toJson());

class CustomerInfo {
  User? user;

  CustomerInfo({
    this.user,
  });

  factory CustomerInfo.fromJson(Map<String, dynamic> json) => CustomerInfo(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
      };
}

class User {
  String? id;
  String? email;
  String? password;
  String? refreshTokens;
  String? role;
  bool? verified;
  String? cordinates;
  String? phone;
  String? address;
  String? fullName;
  String? picture;

  User({
    this.id,
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
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        email: json["email"],
        password: json["password"],
        refreshTokens: json["refreshTokens"],
        role: json["role"],
        verified: json["verified"],
        cordinates: json["cordinates"],
        phone: json["phone"],
        address: json["address"],
        fullName: json["full_name"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "password": password,
        "refreshTokens": refreshTokens,
        "role": role,
        "verified": verified,
        "cordinates": cordinates,
        "phone": phone,
        "address": address,
        "full_name": fullName,
        "picture": picture,
      };
}
