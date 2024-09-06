import 'package:get/get.dart'; // Mengimpor GetX untuk manajemen state.
import 'package:sqflite/sqflite.dart'; // Mengimpor SQLite untuk operasi database.

import '../../../data/models/db/db_manager.dart'; // Mengimpor DbManager untuk mengelola database.
import '../../../data/models/note_model.dart'; // Mengimpor model Note untuk catatan.

// Controller untuk halaman Home yang mengelola catatan (notes)
class HomeController extends GetxController {
  // List yang digunakan untuk menyimpan semua catatan, diwakili oleh model Note
  // Menggunakan RxList agar dapat diobservasi dan diperbarui secara reaktif
  RxList allNote = <Note>[].obs;

  // Instance dari DbManager untuk mengakses database
  DbManager database = DbManager.instance;

  // Fungsi untuk mengambil semua catatan dari database dan menyimpannya di `allNote`
  Future<void> getAllNotes() async {
    // Mendapatkan instance database dari DbManager
    Database db = await database.db;

    // Menjalankan query untuk mendapatkan semua data dari tabel "notes"
    List<Map<String, dynamic>> data = await db.query("notes");

    // Jika data tidak kosong, konversi data ke dalam bentuk model Note dan masukkan ke `allNote`
    if (data.isNotEmpty) {
      allNote(
          Note.toJsonList(data)); // Mengubah hasil query menjadi daftar Note
      allNote
          .refresh(); // Memperbarui RxList agar UI merender ulang data terbaru
    } else {
      // Jika tidak ada data, bersihkan list `allNote`
      allNote.clear();
      allNote.refresh(); // Memperbarui RxList
    }
  }

  // Fungsi untuk menghapus catatan dari database berdasarkan ID
  Future deleteNotes(int id) async {
    // Mendapatkan instance database
    Database db = await database.db;

    // Menghapus catatan dari tabel "notes" berdasarkan ID yang diberikan
    await db.delete(
      "notes", // Nama tabel
      where:
          "id = ?", // Kondisi untuk mengidentifikasi catatan yang akan dihapus
      whereArgs: [id], // Argumen untuk menggantikan placeholder "id"
    );

    // Memanggil `getAllNotes()` untuk memperbarui daftar catatan setelah penghapusan
    await getAllNotes();
  }

  // Fungsi yang dipanggil saat controller diinisialisasi
  @override
  void onInit() {
    getAllNotes(); // Mengambil semua catatan dari database saat controller diinisialisasi
    super.onInit();
  }
}
