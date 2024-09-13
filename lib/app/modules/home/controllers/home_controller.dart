import 'package:get/get.dart'; // Import GetX biar gampang urus state management
import 'package:supabase_flutter/supabase_flutter.dart'; // Import Supabase buat handle database

import '../../../models/note_models.dart'; // Import model note biar gampang urus data

class HomeController extends GetxController {
  // Controller buat ngatur logika di halaman home

  RxList allNotes = List<NoteModels>.empty()
      .obs; // Observable List yang nyimpen semua catatan, dimulai dari list kosong

  SupabaseClient client =
      Supabase.instance.client; // Koneksi ke Supabase biar bisa akses database

  Future<void> getAllNotes() async {
    // Fungsi buat ambil semua catatan dari database
    List<Map<String, dynamic>>
        user = // Ambil user yang lagi login dari database
        await client.from("users").select("id").match({
      "uid": client
          .auth.currentUser!.id, // Match user berdasarkan UID yang lagi login
    });

    int id = (user as List).first["id"]; // Ambil ID user yang login

    var notes = await client.from("notes").select().match({
      // Ambil semua note yang punya user berdasarkan user_id
      "user_id": id, // Cocokin user_id sama ID user yang lagi login
    });

    List<NoteModels> dataNote = NoteModels.fromJsonList(
        notes as List); // Convert hasil query jadi list note model

    allNotes(
        dataNote); // Update observable allNotes dengan data note yang baru diambil
    allNotes.refresh(); // Refresh observable biar UI ikut ke-update

    print(
        notes.toList()); // Debug print biar bisa cek isi catatannya di console
  }

  void deleteNote(int id) async {
    // Fungsi buat hapus catatan berdasarkan id
    await client
        .from("notes")
        .delete()
        .match({"id": id}); // Delete catatan yang sesuai id di database
    await getAllNotes(); // Setelah delete, refresh list catatan biar UI ke-update
  }
}
