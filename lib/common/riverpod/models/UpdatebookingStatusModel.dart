// To parse this JSON data, do
//
//     final updateBookingStatus = updateBookingStatusFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

UpdateBookingStatus updateBookingStatusFromJson(String str) => UpdateBookingStatus.fromJson(json.decode(str));

String updateBookingStatusToJson(UpdateBookingStatus data) => json.encode(data.toJson());

class UpdateBookingStatus {
    String? id;
    String? status;

    UpdateBookingStatus({
        this.id,
        this.status,
    });

    factory UpdateBookingStatus.fromJson(Map<String, dynamic> json) => UpdateBookingStatus(
        id: json["id"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
    };
}
