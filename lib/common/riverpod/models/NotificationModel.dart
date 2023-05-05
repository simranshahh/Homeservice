// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  List<Notifications>? notifications;

  NotificationModel({
    this.notifications,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        notifications: json["notifications"] == null
            ? []
            : List<Notifications>.from(
                json["notifications"]!.map((x) => Notifications.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "notifications": notifications == null
            ? []
            : List<dynamic>.from(notifications!.map((x) => x.toJson())),
      };
}

class Notifications {
  String? id;
  NotificationUser? user;
  String? description;
  String? title;
  int? v;

  Notifications({
    this.id,
    this.user,
    this.description,
    this.title,
    this.v,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
        id: json["_id"],
        user: json["user"] == null ? null : NotificationUser.fromJson(json["user"]),
        description: json["description"],
        title: json["title"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user?.toJson(),
        "description": description,
        "title": title,
        "__v": v,
      };
}

class NotificationUser {
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

  NotificationUser({
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

  factory NotificationUser.fromJson(Map<String, dynamic> json) => NotificationUser(
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
