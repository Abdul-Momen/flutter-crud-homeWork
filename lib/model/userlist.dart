// To parse this JSON data, do
//
//     final userList = userListFromMap(jsonString);

import 'dart:convert';

class UserList {
  UserList({
    this.userId,
    this.id,
    this.title,
  });

  int? userId;
  int? id;
  String? title;

  UserList copyWith({
    int? userId,
    int? id,
    String? title,
  }) =>
      UserList(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
      );

  factory UserList.fromJson(String str) => UserList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserList.fromMap(Map<String, dynamic> json) => UserList(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toMap() => {
    "userId": userId,
    "id": id,
    "title": title,
  };


 static List<UserList> userListFromMap(String str) =>
     List<UserList>.from(json.decode(str).map((x) => UserList.fromMap(x)));

 static String userListToMap(List<UserList> data) =>
     json.encode(List<dynamic>.from(data.map((x) => x.toMap())));
}
