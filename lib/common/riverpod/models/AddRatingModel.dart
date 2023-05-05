// To parse this JSON data, do
//
//     final addRating = addRatingFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

AddRating addRatingFromJson(String str) => AddRating.fromJson(json.decode(str));

String addRatingToJson(AddRating data) => json.encode(data.toJson());

class AddRating {
  String? serviceId;
  int? rating;
  String? description;

  AddRating({
    this.serviceId,
    this.rating,
    this.description,
  });

  factory AddRating.fromJson(Map<String, dynamic> json) => AddRating(
        serviceId: json["serviceId"],
        rating: json["rating"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "serviceId": serviceId,
        "rating": rating,
        "description": description,
      };
}
