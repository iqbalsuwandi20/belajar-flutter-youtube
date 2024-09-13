import 'package:flutter/material.dart'; // Import material buat widget Flutter yang UI
import 'package:get/get.dart'; // Import GetX biar gampang state management-nya
import 'package:supabase_flutter/supabase_flutter.dart'; // Import Supabase buat konek ke database

class AddNoteController extends GetxController {
  // Controller buat nambahin note baru nih

  TextEditingController titleC =
      TextEditingController(); // Controller buat input judul note
  TextEditingController descC =
      TextEditingController(); // Controller buat input deskripsi note

  RxBool isLoading = false
      .obs; // Observable boolean buat tracking loading state, biar tau kalo lagi nge-load

  SupabaseClient client = Supabase
      .instance.client; // Koneksi ke Supabase client, biar bisa akses database

  Future<bool> addNote() async {
    // Fungsi buat nambahin note baru ke database
    if (titleC.text.isNotEmpty && descC.text.isNotEmpty) {
      // Cek dulu, inputan judul sama deskripsi ga boleh kosong
      isLoading.value = true; // Ubah loading jadi true, tandanya lagi proses
      List<Map<String, dynamic>>
          user = // Query buat dapetin user id dari tabel users di database
          await client.from("users").select("id").match({
        "uid": client.auth.currentUser!
            .id, // Ambil user id dari current user yang lagi login
      });

      int id =
          (user as List).first["id"]; // Ambil id user pertama dari hasil query

      await client.from("notes").insert({
        // Masukin data note baru ke tabel notes di database
        "user_id": id, // Id user yang nambahin note
        "title": titleC.text, // Judul note diambil dari input user
        "desc": descC.text, // Deskripsi note diambil dari input user
        "created_at": DateTime.now()
            .toIso8601String(), // Waktu saat note dibuat, otomatis di-generate
      });

      isLoading.value = false; // Ubah loading jadi false, proses udah kelar
      return true; // Return true kalo berhasil nambahin note
    } else {
      return false; // Kalo inputan kosong, return false
    }
  }
}
