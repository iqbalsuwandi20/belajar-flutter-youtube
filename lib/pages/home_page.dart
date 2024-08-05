import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/models/city.dart';
import 'package:flutter_basic/models/district.dart';
import 'package:flutter_basic/models/province.dart';
import 'package:flutter_basic/models/village.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String apiKey =
      "017c5b2755a5585f15fe56ac4d27be244faff5dbffd7181e328aa2186caa5481";

  String? idProvince;
  String? idCity;
  String? idDistrict;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green[900],
        title: const Text(
          "Package Dropdown search API",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          DropdownSearch<ProvinceModel>(
            dropdownBuilder: (context, selectedItem) =>
                Text(selectedItem?.name ?? "Select your Province"),
            popupProps: PopupProps.menu(
              showSearchBox: true,
              itemBuilder: (context, item, isSelected) => ListTile(
                title: Text(item.name),
              ),
            ),
            asyncItems: (text) async {
              var response = await http.get(Uri.parse(
                  "https://api.binderbyte.com/wilayah/provinsi?api_key=$apiKey"));
              if (response.statusCode != 200) {
                return [];
              }

              List allProvince =
                  (json.decode(response.body) as Map<String, dynamic>)["value"];

              List<ProvinceModel> allModelProvince = [];

              for (var element in allProvince) {
                allModelProvince.add(
                  ProvinceModel(
                    id: element["id"],
                    name: element["name"],
                  ),
                );
              }

              return allModelProvince;
            },
            onChanged: (value) => idProvince = value?.id,
          ),
          const SizedBox(
            height: 20,
          ),
          DropdownSearch<CityModel>(
            dropdownBuilder: (context, selectedItem) =>
                Text(selectedItem?.name ?? "Select your City"),
            popupProps: PopupProps.menu(
              showSearchBox: true,
              itemBuilder: (context, item, isSelected) => ListTile(
                title: Text(item.name),
              ),
            ),
            asyncItems: (text) async {
              print("Check Province ID");
              print(idProvince);
              var response = await http.get(Uri.parse(
                "https://api.binderbyte.com/wilayah/kabupaten?api_key=$apiKey&id_provinsi=$idProvince",
              ));
              if (response.statusCode != 200) {
                return [];
              }

              List allCity =
                  (json.decode(response.body) as Map<String, dynamic>)["value"];

              List<CityModel> allModelCity = [];

              for (var element in allCity) {
                allModelCity.add(
                  CityModel(
                    id: element["id"],
                    idProvinsi: element["id_provinsi"],
                    name: element["name"],
                  ),
                );
              }

              return allModelCity;
            },
            onChanged: (value) => idCity = value?.id,
          ),
          const SizedBox(
            height: 20,
          ),
          DropdownSearch<DistrictModel>(
            dropdownBuilder: (context, selectedItem) =>
                Text(selectedItem?.name ?? "Select your District"),
            popupProps: PopupProps.menu(
              showSearchBox: true,
              itemBuilder: (context, item, isSelected) => ListTile(
                title: Text(item.name),
              ),
            ),
            asyncItems: (text) async {
              print("Check District ID");
              print(idCity);
              var response = await http.get(Uri.parse(
                "https://api.binderbyte.com/wilayah/kecamatan?api_key=$apiKey&id_kabupaten=$idCity",
              ));
              if (response.statusCode != 200) {
                return [];
              }

              List allDistrict =
                  (json.decode(response.body) as Map<String, dynamic>)["value"];

              List<DistrictModel> allModelDistrict = [];

              for (var element in allDistrict) {
                allModelDistrict.add(DistrictModel(
                  id: element["id"],
                  idKabupaten: element["id_kabupaten"],
                  name: element["name"],
                ));
              }

              return allModelDistrict;
            },
            onChanged: (value) => idDistrict = value?.id,
          ),
          const SizedBox(
            height: 20,
          ),
          DropdownSearch<VillageModel>(
            dropdownBuilder: (context, selectedItem) =>
                Text(selectedItem?.name ?? "Select your Viilage"),
            popupProps: PopupProps.menu(
              showSearchBox: true,
              itemBuilder: (context, item, isSelected) => ListTile(
                title: Text(item.name),
              ),
            ),
            asyncItems: (text) async {
              print("Check District ID");
              print(idCity);
              var response = await http.get(Uri.parse(
                "https://api.binderbyte.com/wilayah/kelurahan?api_key=$apiKey&id_kecamatan=$idDistrict",
              ));
              if (response.statusCode != 200) {
                return [];
              }

              List allVillage =
                  (json.decode(response.body) as Map<String, dynamic>)["value"];

              List<VillageModel> allModelVillage = [];

              for (var element in allVillage) {
                allModelVillage.add(VillageModel(
                  id: element["id"],
                  idKecamatan: element["id_kecamatan"],
                  name: element["name"],
                ));
              }

              return allModelVillage;
            },
            onChanged: (value) => print(value?.toJson()),
          ),
        ],
      ),
    );
  }
}
