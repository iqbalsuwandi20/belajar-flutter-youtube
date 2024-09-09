import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/databases/database.dart';

// Controller yang ngurusin buat nambahin catetan
class AddNoteController extends GetxController {
  // Variabel buat nge-track status loading
  RxBool isLoading = false.obs;

  // Controller buat ngatur inputan title dan desc dari user
  TextEditingController titleC = TextEditingController();
  TextEditingController descC = TextEditingController();

  // Fungsi buat nambahin catetan ke database
  Future<void> addNote() async {
    // Cek dulu apakah title dan desc udah diisi semua
    if (titleC.text.isNotEmpty && descC.text.isNotEmpty) {
      // Bikin objek catetan baru dengan title dan desc dari inputan user
      var note = Notes()
        ..title = titleC.text
        ..desc = descC.text;

      // Ambil box Notes dari NoteManager
      final box = NoteManager.getAllNotes();

      // Tambahin catetan ke box dan dapetin id-nya
      int id = await box.add(note);

      // Set id ke catetan yang baru ditambah
      note.id = id;

      // Simpen catetan ke database
      note.save();
    }
    // Kalo title atau desc kosong, catetannya gak bakal ditambahin
  }
}
