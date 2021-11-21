// To parse this JSON data, do
//
//     final bookInformationResponse = bookInformationResponseFromJson(jsonString);

import 'dart:convert';

BookInformationResponse bookInformationResponseFromJson(String str) => BookInformationResponse.fromJson(json.decode(str));

String bookInformationResponseToJson(BookInformationResponse data) => json.encode(data.toJson());

class BookInformationResponse {
  BookInformationResponse({
    this.message,
    this.data,
    this.statusCode,
  });

  String? message;
  Data? data;
  int? statusCode;

  factory BookInformationResponse.fromJson(Map<String, dynamic> json) => BookInformationResponse(
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
    this.book,
  });

  Book? book;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    book: Book.fromJson(json["book"]),
  );

  Map<String, dynamic> toJson() => {
    "book": book!.toJson(),
  };
}

class Book {
  Book({
    this.id,
    this.name,
    this.description,
    this.pages,
    this.publishedYear,
    this.thumbUrl,
    this.authorId,
  });

  int? id;
  String? name;
  String? description;
  int? pages;
  int? publishedYear;
  String? thumbUrl;
  int? authorId;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    pages: json["pages"],
    publishedYear: json["published_year"],
    thumbUrl: json["thumb_url"],
    authorId: json["author_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "pages": pages,
    "published_year": publishedYear,
    "thumb_url": thumbUrl,
    "author_id": authorId,
  };
}
