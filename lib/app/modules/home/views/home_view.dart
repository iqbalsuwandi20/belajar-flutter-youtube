import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../data/databases/database.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

// Tampilan utama yang ngelist semua catetan dari database lokal
class HomeView extends GetView<HomeController> {
  const HomeView({super.key}); // Constructor dengan key opsional

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Biar judulnya di tengah, biar keren aja
        backgroundColor:
            Colors.blue[600], // Warna background AppBar biru, biar lebih cool
        title: const Text(
          'LocalDB - Hive', // Judul AppBar, buat nunjukin ini aplikasi database lokal
          style: TextStyle(
            color: Colors.white, // Teks putih biar kontras sama latar biru
          ),
        ),
      ),
      body: ValueListenableBuilder<Box<Notes>>(
          // Listener buat box Notes, biar UI otomatis update kalo ada perubahan
          valueListenable: NoteManager.getAllNotes().listenable(),
          builder: (context, box, _) {
            List<Notes> allNotes = box.values
                .toList()
                .cast<Notes>(); // Ambil semua catetan dari box
            if (allNotes.isEmpty) {
              // Kalo enggak ada catetan, tampilkan pesan "Tidak ada data"
              return const Center(
                child: Text(
                  "Tidak ada data", // Pesan kalau data kosong
                  style: TextStyle(
                      fontWeight:
                          FontWeight.bold), // Teks bold biar lebih jelas
                ),
              );
            }
            return ListView.builder(
              // Buat tampilan daftar catetan
              itemCount: allNotes.length, // Jumlah item di list
              padding: const EdgeInsets.all(20), // Padding di seluruh list
              itemBuilder: (context, index) {
                Notes notes = allNotes[index]; // Ambil catetan sesuai index
                return ListTile(
                  onTap: () {
                    // Kalo di-tap, buka halaman edit catetan dengan argumen catetan yang dipilih
                    Get.toNamed(
                      Routes.EDIT_NOTE, // Rute ke halaman edit catetan
                      arguments: notes, // Kirim catetan ke halaman edit
                    );
                  },
                  leading: CircleAvatar(
                    // Avatar di sebelah kiri, tampilkan ID catetan
                    backgroundColor:
                        Colors.blue[600], // Warna background avatar
                    child: Text(
                      "${notes.id}", // ID catetan
                      style: const TextStyle(
                          color: Colors.white), // Teks putih biar kontras
                    ),
                  ),
                  title: Text("${notes.title}"), // Judul catetan
                  subtitle: Text("${notes.desc}"), // Deskripsi catetan
                  trailing: IconButton(
                    // Tombol hapus di sebelah kanan
                    onPressed: () async {
                      await notes.delete(); // Hapus catetan dari database
                    },
                    icon: Icon(
                      Icons.delete_forever_outlined, // Icon hapus catetan
                      color: Colors.blue[600], // Warna icon biru
                    ),
                  ),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[600], // Warna background tombol biru
        onPressed: () {
          // Kalo di-tap, buka halaman tambah catetan
          Get.toNamed(Routes.ADD_NOTE); // Rute ke halaman tambah catetan
        },
        child: const Icon(
          Icons.add, // Icon tambah catetan
          color: Colors.white, // Warna icon putih
        ),
      ),
    );
  }
}
