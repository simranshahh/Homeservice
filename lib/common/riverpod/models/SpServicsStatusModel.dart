// To parse this JSON data, do
//
//     final spServiceStatus = spServiceStatusFromJson(jsonString);

import 'dart:convert';

SpServiceStatus spServiceStatusFromJson(String str) =>
    SpServiceStatus.fromJson(json.decode(str));

String spServiceStatusToJson(SpServiceStatus data) =>
    json.encode(data.toJson());

class SpServiceStatus {
  List<SBooking>? bookings;

  SpServiceStatus({
    this.bookings,
  });

  factory SpServiceStatus.fromJson(Map<String, dynamic> json) =>
      SpServiceStatus(
        bookings: json["bookings"] == null
            ? []
            : List<SBooking>.from(
                json["bookings"]!.map((x) => SBooking.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bookings": bookings == null
            ? []
            : List<dynamic>.from(bookings!.map((x) => x.toJson())),
      };
}

class SBooking {
  String? id;
  SUser? user;
  String? service;
  String? note;
  String? time;
  String? date;
  String? status;
  int? v;

  SBooking({
    this.id,
    this.user,
    this.service,
    this.note,
    this.time,
    this.date,
    this.status,
    this.v,
  });

  factory SBooking.fromJson(Map<String, dynamic> json) => SBooking(
        id: json["_id"],
        user: json["user"] == null ? null : SUser.fromJson(json["user"]),
        service: json["service"],
        note: json["note"],
        time: json["time"],
        date: json["date"],
        status: json["status"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user?.toJson(),
        "service": service,
        "note": note,
        "time": time,
        "date": date,
        "status": status,
        "__v": v,
      };
}

class SUser {
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
  int? v;
  List<Rating>? ratings;

  SUser({
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
    this.ratings,
  });

  factory SUser.fromJson(Map<String, dynamic> json) => SUser(
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
        v: json["__v"],
        ratings: json["ratings"] == null
            ? []
            : List<Rating>.from(
                json["ratings"]!.map((x) => Rating.fromJson(x))),
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
        "__v": v,
        "ratings": ratings == null
            ? []
            : List<dynamic>.from(ratings!.map((x) => x.toJson())),
      };
}

class Rating {
  String? user;
  String? description;
  String? id;

  Rating({
    this.user,
    this.description,
    this.id,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        user: json["user"],
        description: json["description"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "description": description,
        "_id": id,
      };
}
