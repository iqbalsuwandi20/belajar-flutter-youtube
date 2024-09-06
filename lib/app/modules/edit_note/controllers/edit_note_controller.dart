import 'package:flutter/material.dart'; // Paket untuk membangun UI dengan Flutter.
import 'package:get/get.dart'; // Paket untuk manajemen state dan route dengan GetX.
import 'package:sqflite/sqflite.dart'; // Paket untuk mengelola database SQLite.

import '../../../data/models/db/db_manager.dart'; // Mengimpor DbManager untuk mengelola database.

// Controller untuk mengelola pengeditan catatan (note)
class EditNoteController extends GetxController {
  // Variabel observable untuk menunjukkan status loading saat mengedit catatan
  RxBool isLoading = false.obs;

  // TextEditingController untuk mengelola input judul dan deskripsi
  TextEditingController titleC =
      TextEditingController(); // Untuk mengelola input judul catatan.
  TextEditingController descC =
      TextEditingController(); // Untuk mengelola input deskripsi catatan.

  // Inisialisasi instance DbManager untuk mengelola database SQLite
  DbManager database = DbManager.instance;

  // Fungsi untuk mengedit catatan yang ada di database berdasarkan ID catatan
  void editNotes(int id) async {
    // Mendapatkan instance database dari DbManager
    Database db = await database.db;

    // Melakukan operasi update pada tabel "notes" di database
    await db.update(
      "notes", // Nama tabel
      {
        "id": id, // ID catatan yang akan diubah
        "title": titleC.text, // Menyimpan perubahan pada judul
        "desc": descC.text, // Menyimpan perubahan pada deskripsi
      },
      where:
          "id: ?", // Kondisi untuk mengidentifikasi catatan yang akan diperbarui
      whereArgs: [
        id
      ], // Argumen untuk mengisi placeholder "id" pada kondisi where
      conflictAlgorithm: ConflictAlgorithm
          .replace, // Mengganti catatan yang ada jika terjadi konflik ID
    );
  }
}
