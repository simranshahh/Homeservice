// To parse this JSON data, do
//
//     final placeOrder = placeOrderFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

PlaceOrder placeOrderFromJson(String str) =>
    PlaceOrder.fromJson(json.decode(str));

String placeOrderToJson(PlaceOrder data) => json.encode(data.toJson());

class PlaceOrder {
  String? serviceId;
  String? note;
  String? time;
  String? date;

  PlaceOrder({
    this.serviceId,
    this.note,
    this.time,
    this.date,
  });

  factory PlaceOrder.fromJson(Map<String, dynamic> json) => PlaceOrder(
        serviceId: json["serviceId"],
        note: json["note"],
        time: json["time"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "serviceId": serviceId,
        "note": note,
        "time": time,
        "date": date,
      };
}
