// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.message,
    this.data,
    this.statusCode,
  });

  String? message;
  Data? data;
  int? statusCode;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
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
    this.user,
    this.accessToken,
  });

  User? user;
  String? accessToken;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
    accessToken: json["access_token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user!.toJson(),
    "access_token": accessToken,
  };
}

class User {
  User({
    this.id,
    this.username,
    this.password,
    this.name,
    this.isAdmin,
    this.isBanned,
    this.createdAt,
  });

  int? id;
  String? username;
  String? password;
  String? name;
  int? isAdmin;
  int? isBanned;
  dynamic createdAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    password: json["password"],
    name: json["name"],
    isAdmin: json["is_admin"],
    isBanned: json["is_banned"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "password": password,
    "name": name,
    "is_admin": isAdmin,
    "is_banned": isBanned,
    "created_at": createdAt,
  };
}
