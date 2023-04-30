// To parse this JSON data, do
//
//     final allRoles = allRolesFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

class AllRoles {
    List<Roles>? roles;

    AllRoles({
        this.roles,
    });

    factory AllRoles.fromRawJson(String str) => AllRoles.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AllRoles.fromJson(Map<String, dynamic> json) => AllRoles(
        roles: json["roles"] == null ? [] : List<Roles>.from(json["roles"]!.map((x) => Roles.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "roles": roles == null ? [] : List<dynamic>.from(roles!.map((x) => x.toJson())),
    };
}

class Roles {
    String? id;
    String? name;
    int? v;

    Roles({
        this.id,
        this.name,
        this.v,
    });

    factory Roles.fromRawJson(String str) => Roles.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Roles.fromJson(Map<String, dynamic> json) => Roles(
        id: json["_id"],
        name: json["name"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "__v": v,
    };
}
