// To parse this JSON data, do
//
//     final addFileResponse = addFileResponseFromJson(jsonString);

import 'dart:convert';

AddFileResponse addFileResponseFromJson(String str) => AddFileResponse.fromJson(json.decode(str));

String addFileResponseToJson(AddFileResponse data) => json.encode(data.toJson());

class AddFileResponse {
  AddFileResponse({
    this.message,
    this.data,
    this.statusCode,
  });

  String? message;
  Data? data;
  int? statusCode;

  factory AddFileResponse.fromJson(Map<String, dynamic> json) => AddFileResponse(
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
    this.file,
  });

  FileClass? file;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    file: FileClass.fromJson(json["file"]),
  );

  Map<String, dynamic> toJson() => {
    "file": file!.toJson(),
  };
}

class FileClass {
  FileClass({
    this.id,
    this.url,
    this.extension,
    this.size,
    this.bookId,
    this.createdAt,
  });

  int? id;
  String? url;
  String? extension;
  int? size;
  int? bookId;
  dynamic createdAt;

  factory FileClass.fromJson(Map<String, dynamic> json) => FileClass(
    id: json["id"],
    url: json["url"],
    extension: json["extension"],
    size: json["size"],
    bookId: json["book_id"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "extension": extension,
    "size": size,
    "book_id": bookId,
    "created_at": createdAt,
  };
}
