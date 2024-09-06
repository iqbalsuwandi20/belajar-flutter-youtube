import 'package:flutter/material.dart'; // Paket untuk membangun UI dengan Flutter.
import 'package:get/get.dart'; // Paket untuk manajemen state dan route dengan GetX.
import 'package:sqflite/sqflite.dart'; // Paket untuk mengelola database SQLite.

import '../../../data/models/db/db_manager.dart'; // Mengimpor DbManager dari model database Anda.

// Controller untuk mengelola penambahan catatan (note) dalam aplikasi
class AddNoteController extends GetxController {
  // Variabel observable untuk menunjukkan status loading saat menambahkan catatan
  RxBool isLoading = false.obs;

  // TextEditingController untuk mengelola input judul dan deskripsi
  TextEditingController titleC =
      TextEditingController(); // Untuk mengelola input judul catatan.
  TextEditingController descC =
      TextEditingController(); // Untuk mengelola input deskripsi catatan.

  // Inisialisasi instance DbManager untuk mengelola database SQLite
  DbManager database = DbManager.instance;

  // Fungsi untuk menambahkan catatan ke dalam database
  void addNote() async {
    // Mengecek apakah judul dan deskripsi tidak kosong
    if (titleC.text.isNotEmpty && descC.text.isNotEmpty) {
      // Mengubah status loading menjadi true saat proses penambahan catatan dimulai
      isLoading.value = true;

      // Mendapatkan instance database dari DbManager
      Database db = await database.db;

      // Melakukan operasi insert ke tabel "notes" di database
      await db.insert(
        "notes", // Nama tabel tempat data akan disimpan
        {
          "title": titleC.text, // Menyimpan input judul
          "desc": descC.text, // Menyimpan input deskripsi
        },
        conflictAlgorithm: ConflictAlgorithm
            .replace, // Jika ada catatan dengan primary key yang sama, data lama akan digantikan.
      );

      // Mengubah status loading menjadi false setelah proses selesai
      isLoading.value = false;
    }
  }
}
