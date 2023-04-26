// To parse this JSON data, do
//
//     final customerInfo = customerInfoFromJson(jsonString);

import 'dart:convert';

class CustomerInfo {
  CInfo? user;

  CustomerInfo({
    this.user,
  });

  factory CustomerInfo.fromRawJson(String str) =>
      CustomerInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CustomerInfo.fromJson(Map<String, dynamic> json) => CustomerInfo(
        user: json["user"] == null ? null : CInfo.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
      };
}

class CInfo {
  String? id;
  String? email;
  String? password;
  List<String>? refreshTokens;
  Role? role;
  bool? verified;
  String? cordinates;
  String? phone;
  String? address;
  String? fullName;
  String? picture;
  int? v;

  CInfo({
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
    this.v,
  });

  factory CInfo.fromRawJson(String str) => CInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CInfo.fromJson(Map<String, dynamic> json) => CInfo(
        id: json["_id"],
        email: json["email"],
        password: json["password"],
        refreshTokens: json["refreshTokens"] == null
            ? []
            : List<String>.from(json["refreshTokens"]!.map((x) => x)),
        role: json["role"] == null ? null : Role.fromJson(json["role"]),
        verified: json["verified"],
        cordinates: json["cordinates"],
        phone: json["phone"],
        address: json["address"],
        fullName: json["full_name"],
        picture: json["picture"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "password": password,
        "refreshTokens": refreshTokens == null
            ? []
            : List<dynamic>.from(refreshTokens!.map((x) => x)),
        "role": role?.toJson(),
        "verified": verified,
        "cordinates": cordinates,
        "phone": phone,
        "address": address,
        "full_name": fullName,
        "picture": picture,
        "__v": v,
      };
}

class Role {
  String? id;
  String? name;
  int? v;

  Role({
    this.id,
    this.name,
    this.v,
  });

  factory Role.fromRawJson(String str) => Role.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["_id"],
        name: json["name"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "__v": v,
      };
}
