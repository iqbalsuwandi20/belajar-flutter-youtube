import 'package:flutter/material.dart'; // Paket untuk membangun UI dengan Flutter.
import 'package:get/get.dart'; // Paket untuk manajemen state dan route dengan GetX.

import '../../home/controllers/home_controller.dart'; // Mengimpor HomeController untuk mengambil data catatan (notes).
import '../controllers/add_note_controller.dart'; // Mengimpor AddNoteController untuk menambah catatan.

// Kelas AddNoteView yang menampilkan UI untuk menambahkan catatan
class AddNoteView extends GetView<AddNoteController> {
  // Mengambil instance dari HomeController untuk mengelola catatan di halaman utama
  final HomeController homeC = Get.find();

  // Konstruktor AddNoteView
  AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar di bagian atas layar dengan judul dan pengaturan tampilan
      appBar: AppBar(
        title: const Text(
          'Add Note', // Judul halaman
          style: TextStyle(color: Colors.white), // Warna teks putih
        ),
        centerTitle: true, // Menjadikan judul di tengah AppBar
        backgroundColor: Colors.blue[600], // Warna latar AppBar
        leading: const SizedBox(), // Menghapus tombol kembali default
      ),

      // Body utama yang berisi form untuk menambahkan catatan
      body: ListView(
        padding: const EdgeInsets.all(20), // Memberikan padding pada ListView
        children: [
          // TextField untuk input judul catatan
          TextField(
            controller: controller
                .titleC, // Menghubungkan dengan controller untuk mengelola input judul
            decoration: const InputDecoration(
              labelText: "Judul", // Label untuk field input
              border: OutlineInputBorder(), // Gaya border outline
            ),
          ),
          const SizedBox(
            height: 20, // Jarak antar widget
          ),

          // TextField untuk input deskripsi catatan
          TextField(
            controller: controller
                .descC, // Menghubungkan dengan controller untuk mengelola input deskripsi
            decoration: const InputDecoration(
              labelText: "Deskripsi", // Label untuk field input
              border: OutlineInputBorder(), // Gaya border outline
            ),
          ),
          const SizedBox(
            height: 50, // Jarak antar widget
          ),

          // Obx digunakan untuk mengamati perubahan state pada controller.isLoading
          Obx(
            () {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[600], // Warna latar tombol
                ),
                onPressed: () async {
                  // Jika isLoading bernilai false, proses tambah catatan bisa dijalankan
                  if (controller.isLoading.isFalse) {
                    controller.addNote(); // Menambahkan catatan
                    await homeC
                        .getAllNotes(); // Memperbarui daftar catatan di HomeController

                    Get.back(); // Kembali ke halaman sebelumnya setelah catatan ditambahkan
                  }
                },
                // Menampilkan teks "Tambah Pesan" atau "Tunggu.." sesuai dengan status loading
                child: Text(
                  controller.isLoading.isFalse ? "Tambah Pesan" : "Tunggu..",
                  style:
                      const TextStyle(color: Colors.white), // Warna teks putih
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
