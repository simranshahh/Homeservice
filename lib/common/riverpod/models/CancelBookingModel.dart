// To parse this JSON data, do
//
//     final cancelBooking = cancelBookingFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

CancelBooking cancelBookingFromJson(String str) => CancelBooking.fromJson(json.decode(str));

String cancelBookingToJson(CancelBooking data) => json.encode(data.toJson());

class CancelBooking {
    String? id;
    String? reason;

    CancelBooking({
        this.id,
        this.reason,
    });

    factory CancelBooking.fromJson(Map<String, dynamic> json) => CancelBooking(
        id: json["id"],
        reason: json["reason"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "reason": reason,
    };
}
