// Untuk melakukan parsing JSON data, gunakan
//
//     final note = noteFromJson(jsonString);

import 'dart:convert'; // Digunakan untuk encoding dan decoding data JSON.

// Fungsi untuk mengubah string JSON menjadi objek Note
Note noteFromJson(String str) => Note.fromJson(json.decode(str));

// Fungsi untuk mengubah objek Note menjadi string JSON
String noteToJson(Note data) => json.encode(data.toJson());

// Kelas Note yang merepresentasikan sebuah catatan (note)
class Note {
  int id; // ID dari catatan, berfungsi sebagai identitas unik.
  String title; // Judul catatan.
  String desc; // Deskripsi atau isi dari catatan.

  // Konstruktor untuk menginisialisasi objek Note dengan nilai yang diberikan.
  Note({
    required this.id,
    required this.title,
    required this.desc,
  });

  // Factory constructor untuk membuat objek Note dari data JSON.
  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json["id"], // Mengambil nilai "id" dari JSON.
        title: json["title"], // Mengambil nilai "title" dari JSON.
        desc: json["desc"], // Mengambil nilai "desc" dari JSON.
      );

  // Metode untuk mengonversi objek Note menjadi Map yang dapat dikonversi ke JSON.
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{}; // Membuat Map kosong.
    data["id"] = id; // Menambahkan ID ke Map.
    data["title"] = title; // Menambahkan title ke Map.
    data["desc"] = desc; // Menambahkan desc ke Map.
    return data; // Mengembalikan Map yang berisi data Note.
  }

  // Fungsi static untuk mengubah daftar objek JSON menjadi daftar objek Note.
  // Jika `data` kosong atau null, mengembalikan daftar kosong.
  static List<Note> toJsonList(List? data) {
    if (data == null || data.isEmpty) {
      return []; // Mengembalikan daftar kosong jika tidak ada data.
    }
    return data
        .map((e) => Note.fromJson(e))
        .toList(); // Mengonversi setiap elemen JSON menjadi Note dan mengembalikannya dalam bentuk list.
  }
}
