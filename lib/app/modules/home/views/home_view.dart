import 'package:flutter/material.dart'; // Import buat widget di Flutter
import 'package:flutter_intermediate/app/models/note_models.dart'; // Import model Note biar gampang akses data
import 'package:get/get.dart'; // Import GetX buat state management

import '../../../routes/app_pages.dart'; // Import routes buat navigasi halaman
import '../controllers/home_controller.dart'; // Import controller home biar bisa akses logika bisnis

class HomeView extends GetView<HomeController> {
  // Ini adalah halaman Home
  const HomeView({super.key}); // Constructor dengan key optional

  @override
  Widget build(BuildContext context) {
    // Build method buat nge-render UI
    return Scaffold(
      // Ini parent widget buat struktur layout halaman
      appBar: AppBar(
        // Ini header di atas layar
        centerTitle: true, // Biar title di tengah
        backgroundColor: Colors.blue[600], // Warna background AppBar
        title: const Text(
          // Title dari AppBar
          'OnlineDB - Supabase', // Nama aplikasi
          style: TextStyle(
            color: Colors.white, // Warna teks title jadi putih
          ),
        ),
        actions: [
          // Ini buat icon button di sebelah kanan AppBar
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.PROFILE); // Arahkan user ke halaman profile
            },
            icon: const Icon(
              // Icon orang di kanan atas buat akses profil
              Icons.person_2_outlined,
              color: Colors.white, // Warna icon putih biar serasi sama title
            ),
          ),
        ],
      ),
      body: FutureBuilder(
          // Widget buat handle data yang di-load dari database
          future:
              controller.getAllNotes(), // Ambil semua catatan dari controller
          builder: (context, snap) {
            // Builder buat nentuin UI tergantung state data
            if (snap.connectionState == ConnectionState.waiting) {
              // Kalau data masih loading
              return Center(
                // Tampilkan loading spinner
                child: CircularProgressIndicator(
                  color: Colors.blue[600], // Spinner warna biru biar serasi
                ),
              );
            }
            return Obx(
              // Obx buat auto-refresh UI kalo data di controller berubah
              () {
                return controller.allNotes.isEmpty // Kalau list catatan kosong
                    ? const Center(
                        // Tampilkan teks "TIDAK ADA DATA"
                        child: Text(
                          "TIDAK ADA DATA", // Pesan kalo ga ada catatan yang bisa ditampilkan
                          style: TextStyle(
                              fontSize:
                                  20), // Ukuran teks agak gede biar keliatan
                        ),
                      )
                    : ListView.builder(
                        // Kalau ada data, tampilkan dalam bentuk ListView
                        padding: const EdgeInsets.all(20), // Padding biar rapi
                        itemCount: controller
                            .allNotes.length, // Jumlah item dalam list
                        itemBuilder: (context, index) {
                          // Buat tiap item di list
                          NoteModels noteModels = controller
                              .allNotes[index]; // Ambil data note per item
                          return ListTile(
                            // Bikin item list
                            onTap: () {
                              // Kalau di-tap, buka halaman edit note
                              Get.toNamed(
                                  Routes
                                      .EDIT_NOTE, // Arahkan ke halaman edit dengan data note yang dipilih
                                  arguments: noteModels);
                            },
                            leading: CircleAvatar(
                              // Bikin avatar lingkaran di kiri item list
                              backgroundColor: Colors
                                  .blue[600], // Warna background avatar biru
                              child: Text(
                                "${noteModels.id}", // Tampilkan ID note di avatar
                                style: const TextStyle(
                                    color: Colors
                                        .white), // Warna teks di avatar putih
                              ),
                            ),
                            title: Text(
                                "${noteModels.title}"), // Tampilkan title note
                            subtitle: Text(
                                "${noteModels.desc}"), // Tampilkan deskripsi note
                            trailing: IconButton(
                                // Icon button buat delete note di sebelah kanan
                                onPressed: () {
                                  // Kalau di-tap, hapus note
                                  controller.deleteNote(noteModels
                                      .id!); // Panggil fungsi delete note di controller
                                },
                                icon: Icon(
                                  Icons.delete_forever_outlined, // Icon delete
                                  color: Colors.blue[
                                      600], // Warna icon delete biru biar serasi
                                )),
                          );
                        },
                      );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        // Button buat tambah note baru
        backgroundColor: Colors.blue[600], // Warna button biru
        onPressed: () {
          Get.toNamed(Routes.ADD_NOTE); // Arahkan user ke halaman tambah note
        },
        child: const Icon(
          // Icon tambah di button
          Icons.add,
          color: Colors.white, // Warna icon tambah putih
        ),
      ),
    );
  }
}
