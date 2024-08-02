// To parse this JSON data, do
//
//     final summary = summaryFromJson(jsonString);

import 'dart:convert';

Summary summaryFromJson(String str) => Summary.fromJson(json.decode(str));

String summaryToJson(Summary data) => json.encode(data.toJson());

class Summary {
  int id;

  Summary({
    required this.id,
  });

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
