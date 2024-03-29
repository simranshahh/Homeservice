// To parse this JSON data, do
//
//     final serviceStatus = serviceStatusFromJson(jsonString);

import 'dart:convert';

List<ServiceStatus> serviceStatusFromJson(String str) =>
    List<ServiceStatus>.from(
        json.decode(str).map((x) => ServiceStatus.fromJson(x)));

String serviceStatusToJson(List<ServiceStatus> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceStatus {
  String? id;
  Service? user;
  Service? service;
  String? note;
  String? time;
  String? date;
  String? status;
  int? v;

  ServiceStatus({
    this.id,
    this.user,
    this.service,
    this.note,
    this.time,
    this.date,
    this.status,
    this.v,
  });

  factory ServiceStatus.fromJson(Map<String, dynamic> json) => ServiceStatus(
        id: json["_id"],
        user: json["user"] == null ? null : Service.fromJson(json["user"]),
        service:
            json["service"] == null ? null : Service.fromJson(json["service"]),
        note: json["note"],
        time: json["time"],
        date: json["date"],
        status: json["status"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user?.toJson(),
        "service": service?.toJson(),
        "note": note,
        "time": time,
        "date": date,
        "status": status,
        "__v": v,
      };
}

class Service {
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
  List<Rating>? ratings;
  String? picture;
  int? v;
  String? refreshTokens;

  Service({
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
    this.ratings,
    this.picture,
    this.v,
    this.refreshTokens,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
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
        ratings: json["ratings"] == null
            ? []
            : List<Rating>.from(
                json["ratings"]!.map((x) => Rating.fromJson(x))),
        picture: json["picture"],
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
        "ratings": ratings == null
            ? []
            : List<dynamic>.from(ratings!.map((x) => x.toJson())),
        "picture": picture,
        "__v": v,
        "refreshTokens": refreshTokens,
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
