// To parse this JSON data, do
//
//     final serviceStatus = serviceStatusFromJson(jsonString);

import 'dart:convert';

List<ServiceStatus> serviceStatusFromJson(String str) => List<ServiceStatus>.from(json.decode(str).map((x) => ServiceStatus.fromJson(x)));

String serviceStatusToJson(List<ServiceStatus> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceStatus {
    String? id;
    String? user;
    Service? service;
    String? note;
    String? time;
    String? date;
    String? status;

    ServiceStatus({
        this.id,
        this.user,
        this.service,
        this.note,
        this.time,
        this.date,
        this.status,
    });

    factory ServiceStatus.fromJson(Map<String, dynamic> json) => ServiceStatus(
        id: json["_id"],
        user: json["user"],
        service: json["service"] == null ? null : Service.fromJson(json["service"]),
        note: json["note"],
        time: json["time"],
        date: json["date"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "service": service?.toJson(),
        "note": note,
        "time": time,
        "date": date,
        "status": status,
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
    String? picture;
    List<int>? ratings;
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
        this.picture,
        this.ratings,
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
        picture: json["picture"],
        ratings: json["ratings"] == null ? [] : List<int>.from(json["ratings"]!.map((x) => x)),
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
        "ratings": ratings == null ? [] : List<dynamic>.from(ratings!.map((x) => x)),
        "__v": v,
        "refreshTokens": refreshTokens,
    };
}
