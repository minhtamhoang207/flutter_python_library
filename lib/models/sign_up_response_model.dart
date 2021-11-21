// To parse this JSON data, do
//
//     final signUpResponse = signUpResponseFromJson(jsonString);

import 'dart:convert';

SignUpResponse signUpResponseFromJson(String str) => SignUpResponse.fromJson(json.decode(str));

String signUpResponseToJson(SignUpResponse data) => json.encode(data.toJson());

class SignUpResponse {
  SignUpResponse({
    this.message,
    this.data,
    this.statusCode,
  });

  String? message;
  Data? data;
  int? statusCode;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
    message: json["message"],
    data: Data.fromJson(json["data"]),
    statusCode: json["status_code"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data!.toJson(),
    "status_code": statusCode,
  };
}

class Data {
  Data({
    required this.user,
  });

  User user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
  };
}

class User {
  User({
    this.id,
    this.username,
    this.name,
    this.isAdmin,
    this.isBanned,
    this.createdAt,
  });

  int? id;
  String? username;
  String? name;
  int? isAdmin;
  int? isBanned;
  dynamic createdAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    name: json["name"],
    isAdmin: json["is_admin"],
    isBanned: json["is_banned"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "name": name,
    "is_admin": isAdmin,
    "is_banned": isBanned,
    "created_at": createdAt,
  };
}
