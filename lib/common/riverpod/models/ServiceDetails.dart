// To parse this JSON data, do
//
//     final serviceDetails = serviceDetailsFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

class ServiceDetails {
  List<Service>? services;

  ServiceDetails({
    this.services,
  });

  factory ServiceDetails.fromRawJson(String str) =>
      ServiceDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceDetails.fromJson(Map<String, dynamic> json) => ServiceDetails(
        services: json["services"] == null
            ? []
            : List<Service>.from(
                json["services"]!.map((x) => Service.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "services": services == null
            ? []
            : List<dynamic>.from(services!.map((x) => x.toJson())),
      };
}

class Service {
  String? id;
  String? name;
  String? user;
  String? description;
  String? location;
  String? cordinates;
  String? price;
  String? type;
  List<dynamic>? ratings;
  String? category;
  int? v;

  Service({
    this.id,
    this.name,
    this.user,
    this.description,
    this.location,
    this.cordinates,
    this.price,
    this.type,
    this.ratings,
    this.category,
    this.v,
  });

  factory Service.fromRawJson(String str) => Service.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["_id"],
        name: json["name"],
        user: json["user"],
        description: json["description"],
        location: json["location"],
        cordinates: json["cordinates"],
        price: json["price"],
        type: json["type"],
        ratings: json["ratings"] == null
            ? []
            : List<dynamic>.from(json["ratings"]!.map((x) => x)),
        category: json["category"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "user": user,
        "description": description,
        "location": location,
        "cordinates": cordinates,
        "price": price,
        "type": type,
        "ratings":
            ratings == null ? [] : List<dynamic>.from(ratings!.map((x) => x)),
        "category": category,
        "__v": v,
      };
}
