// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  String? email;
  String? password;
  String? role;
  bool? verified;
  String? cordinates;
  String? phone;
  String? address;
  String? fullName;
  String? price;
  String? picture;
  List<dynamic>? ratings;
  String? id;
  int? v;

  Register({
    this.email,
    this.password,
    this.role,
    this.verified,
    this.cordinates,
    this.phone,
    this.address,
    this.fullName,
    this.price,
    this.picture,
    this.ratings,
    this.id,
    this.v,
  });

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        email: json["email"],
        password: json["password"],
        role: json["role"],
        verified: json["verified"],
        cordinates: json["cordinates"],
        phone: json["phone"],
        address: json["address"],
        fullName: json["full_name"],
        price: json["price"],
        picture: json["picture"],
        ratings: json["ratings"] == null
            ? []
            : List<dynamic>.from(json["ratings"]!.map((x) => x)),
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "role": role,
        "verified": verified,
        "cordinates": cordinates,
        "phone": phone,
        "address": address,
        "full_name": fullName,
        "price": price,
        "picture": picture,
        "ratings":
            ratings == null ? [] : List<dynamic>.from(ratings!.map((x) => x)),
        "_id": id,
        "__v": v,
      };
}
