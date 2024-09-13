import 'package:flutter/material.dart'; // Import buat widget material dari Flutter
import 'package:get/get.dart'; // Import GetX biar gampang urus state management
import 'package:supabase_flutter/supabase_flutter.dart'; // Import Supabase buat urusan database

class EditNoteController extends GetxController {
  // Controller buat edit note yang udah ada

  TextEditingController titleC =
      TextEditingController(); // Controller buat input judul yang bakal di-edit
  TextEditingController descC =
      TextEditingController(); // Controller buat input deskripsi yang bakal di-edit

  RxBool isLoading = false
      .obs; // Observable buat nge-track apakah lagi loading apa nggak, default-nya false

  SupabaseClient client =
      Supabase.instance.client; // Koneksi ke Supabase biar bisa akses database

  Future<bool> editNote(int id) async {
    // Fungsi buat edit note berdasarkan id-nya
    if (titleC.text.isNotEmpty && descC.text.isNotEmpty) {
      // Cek dulu kalo inputan judul dan deskripsi gak kosong
      isLoading.value = true; // Set loading jadi true, tandanya lagi proses
      await client.from("notes").update({
        // Update data note di database
        "title": titleC.text, // Update judul note
        "desc": descC.text, // Update deskripsi note
      }).match({
        "id": id
      }); // Cari note yang id-nya sesuai biar yang di-update beneran yang itu

      isLoading.value = false; // Set loading jadi false lagi, proses selesai
      return true; // Return true kalo proses berhasil
    } else {
      return false; // Return false kalo inputan kosong
    }
  }
}
