// To parse this JSON data, do
//
//     final villageModel = villageModelFromJson(jsonString);

import 'dart:convert';

VillageModel villageModelFromJson(String str) =>
    VillageModel.fromJson(json.decode(str));

String villageModelToJson(VillageModel data) => json.encode(data.toJson());

class VillageModel {
  String id;
  String idKecamatan;
  String name;

  VillageModel({
    required this.id,
    required this.idKecamatan,
    required this.name,
  });

  factory VillageModel.fromJson(Map<String, dynamic> json) => VillageModel(
        id: json["id"],
        idKecamatan: json["id_kecamatan"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_kecamatan": idKecamatan,
        "name": name,
      };

  @override
  String toString() => name;
}
