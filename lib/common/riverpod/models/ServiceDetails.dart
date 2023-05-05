// To parse this JSON data, do
//
//     final serviceDetails = serviceDetailsFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<ServiceDetails> serviceDetailsFromJson(String str) => List<ServiceDetails>.from(json.decode(str).map((x) => ServiceDetails.fromJson(x)));

String serviceDetailsToJson(List<ServiceDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceDetails {
    String? id;
    String? email;
    String? role;
    String? cordinates;
    String? address;
    String? fullName;
    String? price;
    String? picture;
    String? distance;

    ServiceDetails({
        this.id,
        this.email,
        this.role,
        this.cordinates,
        this.address,
        this.fullName,
        this.price,
        this.picture,
        this.distance,
    });

    factory ServiceDetails.fromJson(Map<String, dynamic> json) => ServiceDetails(
        id: json["_id"],
        email: json["email"],
        role: json["role"],
        cordinates: json["cordinates"],
        address: json["address"],
        fullName: json["full_name"],
        price: json["price"],
        picture: json["picture"],
        distance: json["distance"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "role": role,
        "cordinates": cordinates,
        "address": address,
        "full_name": fullName,
        "price": price,
        "picture": picture,
        "distance": distance,
    };
}
