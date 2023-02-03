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
    this.surname,
    this.username,
    this.phoneNo,
    this.emailAddress,
    this.password,
  });

  String? name;
  String? surname;
  String? username;
  String? phoneNo;
  String? emailAddress;
  String? password;

  factory SignupClass.fromJson(Map<String, dynamic> json) => SignupClass(
        name: json["name"],
        surname: json["surname"],
        username: json["username"],
        phoneNo: json["phoneNo"],
        emailAddress: json["emailAddress"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surname,
        "username": username,
        "phoneNo": phoneNo,
        "emailAddress": emailAddress,
        "password": password,
      };
}
