import 'package:flutter/material.dart'; // Paket Flutter untuk membangun UI.
import 'package:flutter_intermediate/app/data/models/note_model.dart'; // Mengimpor model Note untuk catatan.

import 'package:get/get.dart'; // Paket GetX untuk manajemen state dan routing.

import '../../home/controllers/home_controller.dart'; // Mengimpor HomeController untuk mengelola catatan.
import '../controllers/edit_note_controller.dart'; // Mengimpor EditNoteController untuk mengelola pengeditan catatan.

// Kelas EditNoteView untuk menampilkan UI pengeditan catatan
// ignore: must_be_immutable digunakan untuk mengabaikan peringatan jika variabel diubah setelah inisialisasi
class EditNoteView extends GetView<EditNoteController> {
  EditNoteView({super.key});

  // Variabel untuk menyimpan catatan yang akan diedit, diambil dari argument yang diteruskan oleh Get
  Note note = Get.arguments;

  // Mengambil instance HomeController untuk memperbarui daftar catatan setelah pengeditan
  final HomeController homeC = Get.find();

  @override
  Widget build(BuildContext context) {
    // Mengisi nilai awal dari TextField dengan data catatan yang ada (title dan desc)
    controller.titleC.text = note.title;
    controller.descC.text = note.desc;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Note', // Menampilkan judul 'Edit Note' di AppBar
          style: TextStyle(color: Colors.white), // Warna teks putih
        ),
        centerTitle: true, // Menjadikan judul berada di tengah
        backgroundColor: Colors.blue[600], // Warna latar belakang AppBar biru
        leading: const SizedBox(), // Menghilangkan tombol kembali default
      ),

      // Body utama dari UI yang berisi form pengeditan catatan
      body: ListView(
        padding: const EdgeInsets.all(20), // Memberikan padding pada ListView
        children: [
          // TextField untuk mengedit judul catatan
          TextField(
            controller: controller
                .titleC, // Menghubungkan dengan controller untuk mengelola input judul
            decoration: const InputDecoration(
              labelText: "Judul", // Label untuk input judul
              border: OutlineInputBorder(), // Gaya border outline
            ),
          ),
          const SizedBox(
            height: 20, // Jarak antar widget
          ),

          // TextField untuk mengedit deskripsi catatan
          TextField(
            controller: controller
                .descC, // Menghubungkan dengan controller untuk mengelola input deskripsi
            decoration: const InputDecoration(
              labelText: "Deskripsi", // Label untuk input deskripsi
              border: OutlineInputBorder(), // Gaya border outline
            ),
          ),
          const SizedBox(
            height: 50, // Jarak antar widget
          ),

          // Tombol untuk mengonfirmasi pengeditan catatan
          Obx(
            () {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[600], // Warna latar tombol
                ),
                onPressed: () async {
                  // Jika tidak sedang dalam status loading
                  if (controller.isLoading.isFalse) {
                    // Memanggil fungsi untuk mengedit catatan berdasarkan ID
                    controller.editNotes(note.id);

                    // Memperbarui daftar catatan setelah catatan diedit
                    await homeC.getAllNotes();

                    // Kembali ke halaman sebelumnya setelah pengeditan selesai
                    Get.back();
                  }
                },
                // Teks tombol, menampilkan "Mengubah Pesan" saat tidak loading dan "Tunggu.." saat loading
                child: Text(
                  controller.isLoading.isFalse ? "Mengubah Pesan" : "Tunggu..",
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
