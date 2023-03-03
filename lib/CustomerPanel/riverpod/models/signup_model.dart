import 'dart:convert';

SignupClass signupFromJson(String str) =>
    SignupClass.fromJson(json.decode(str));

String signupToJson(SignupClass data) => json.encode(data.toJson());

class SignupModel {
  SignupClass? result;
  SignupModel({
    this.result,
  });
  factory SignupModel.fromRawJson(String str) =>
      SignupModel.fromRawJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        result: SignupClass.fromJson(json['result']),
      );

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'result': result!.toJson()};
}

class SignupClass {
  SignupClass({
    this.name,
    this.email,
    this.servicetype,
    this.phoneNo,
    this.location,
    this.password,
  });

  String? name;
  String? email;
  String? servicetype;
  String? phoneNo;
  String? location;
  String? password;

  factory SignupClass.fromJson(Map<String, dynamic> json) => SignupClass(
        name: json["name"],
        email: json["email"],
        servicetype: json["service"],
        phoneNo: json["phoneNo"],
        location: json["location"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "servicetype": servicetype,
        "phoneNo": phoneNo,
        "location": location,
        "password": password,
      };
}
