// To parse this JSON data, do
//
//     final districtModel = districtModelFromJson(jsonString);

import 'dart:convert';

DistrictModel districtModelFromJson(String str) =>
    DistrictModel.fromJson(json.decode(str));

String districtModelToJson(DistrictModel data) => json.encode(data.toJson());

class DistrictModel {
  String id;
  String idKabupaten;
  String name;

  DistrictModel({
    required this.id,
    required this.idKabupaten,
    required this.name,
  });

  factory DistrictModel.fromJson(Map<String, dynamic> json) => DistrictModel(
        id: json["id"],
        idKabupaten: json["id_kabupaten"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_kabupaten": idKabupaten,
        "name": name,
      };

  @override
  String toString() => name;
}
