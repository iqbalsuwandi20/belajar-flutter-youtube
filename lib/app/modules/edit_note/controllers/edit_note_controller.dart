import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/databases/database.dart';

// Controller yang dipake buat ngedit catetan
class EditNoteController extends GetxController {
  RxBool isLoading = false
      .obs; // Variabel buat nge-track status loading, biar bisa liat apakah lagi proses atau enggak

  TextEditingController titleC =
      TextEditingController(); // Controller buat ngatur inputan judul catetan dari user
  TextEditingController descC =
      TextEditingController(); // Controller buat ngatur inputan deskripsi catetan dari user

  // Fungsi buat ngedit catetan
  Future<void> editNote(Notes notes) async {
    // Set judul catetan sesuai dengan inputan dari user
    notes.title = titleC.text;

    // Set deskripsi catetan sesuai dengan inputan dari user
    notes.desc = descC.text;

    // Simpen perubahan catetan ke database
    notes.save();
    // Fungsi save() ini bakal nyimpen perubahan yang udah diubah ke database
  }
}
