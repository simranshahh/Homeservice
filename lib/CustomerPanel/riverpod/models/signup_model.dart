// To parse this JSON data, do
//
//     final Signupclass = SignupclassFromJson(jsonString);

import 'dart:convert';

class Signupclass {
  Signupclass({
    this.email,
    this.password,
    this.refreshTokens,
    this.role,
    this.verified,
    this.picture,
    this.id,
    this.v,
  });

  String? email;
  String? password;
  List<dynamic>? refreshTokens;
  String? role;
  bool? verified;
  String? picture;
  String? id;
  int? v;

  factory Signupclass.fromRawJson(String str) =>
      Signupclass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Signupclass.fromJson(Map<String, dynamic> json) => Signupclass(
        email: json["email"],
        password: json["password"],
        refreshTokens: json["refreshTokens"] == null
            ? []
            : List<dynamic>.from(json["refreshTokens"]!.map((x) => x)),
        role: json["role"],
        verified: json["verified"],
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
        "picture": picture,
        "_id": id,
        "__v": v,
      };
}
