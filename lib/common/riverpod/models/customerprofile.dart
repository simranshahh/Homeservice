// To parse this JSON data, do
//
//     final getUser = getUserFromJson(jsonString);

import 'dart:convert';

GetUser getUserFromJson(String str) => GetUser.fromJson(json.decode(str));

String getUserToJson(GetUser data) => json.encode(data.toJson());

class GetUser {
  User? user;

  GetUser({
    this.user,
  });

  factory GetUser.fromJson(Map<String, dynamic> json) => GetUser(
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
  String? role;
  bool? verified;
  String? cordinates;
  String? phone;
  String? address;
  String? fullName;
  String? price;
  String? picture;
  List<Rating>? ratings;
  int? v;
  String? refreshTokens;

  User({
    this.id,
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
    this.v,
    this.refreshTokens,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
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
            : List<Rating>.from(
                json["ratings"]!.map((x) => Rating.fromJson(x))),
        v: json["__v"],
        refreshTokens: json["refreshTokens"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
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
        "ratings": ratings == null
            ? []
            : List<dynamic>.from(ratings!.map((x) => x.toJson())),
        "__v": v,
        "refreshTokens": refreshTokens,
      };
}

class Rating {
  String? id;
  String? user;
  String? description;

  Rating({
    this.id,
    this.user,
    this.description,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json["_id"],
        user: json["user"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "description": description,
      };
}
