
import 'dart:convert';

class PostItem {
  PostItem({
    this.id,
    required this.name,
    this.isComplete = false,
  });

  int? id;
  String? name;
  bool? isComplete;

  PostItem copyWith({
    int? id,
    String? name,
    bool? isComplete,
  }) =>
      PostItem(
        id: id ?? this.id,
        name: name ?? this.name,
        isComplete: isComplete ?? this.isComplete,
      );

  factory PostItem.fromJson(String str) => PostItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostItem.fromMap(Map<String, dynamic> json) => PostItem(
    id: json["id"],
    name: json["name"],
    isComplete: json["isComplete"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "isComplete": isComplete,
  };

  static List<PostItem> listFromMap(String str) =>
      List<PostItem>.from(json.decode(str).map((x) => PostItem.fromMap(x)));

  static String listToMap(List<PostItem> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toMap())));
}