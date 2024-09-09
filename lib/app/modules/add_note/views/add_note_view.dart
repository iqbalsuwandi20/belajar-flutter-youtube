import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_note_controller.dart';

// Tampilan buat nambah catetan
class AddNoteView extends GetView<AddNoteController> {
  const AddNoteView({super.key}); // Konstruktor, key opsional

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nambah Catatan', // Judul di AppBar
          style: TextStyle(color: Colors.white), // Warna teks putih
        ),
        centerTitle: true, // Judul ditengah-tengah
        backgroundColor: Colors.blue[600], // Warna background AppBar biru gelap
        leading:
            const SizedBox(), // Kosongin icon leading, biar gak ada apa-apa di sebelah kiri
      ),
      body: ListView(
        padding: const EdgeInsets.all(
            20), // Padding di seluruh body, biar gak mepet-mepet
        children: [
          // Input field buat judul catetan
          TextField(
            controller: controller
                .titleC, // Controller buat ngatur inputan judul catetan
            autocorrect: false, // Non-aktifkan autocorrect, biar gak ganggu
            textInputAction: TextInputAction
                .next, // Tombol action berikutnya di keyboard, biar langsung pindah ke field berikutnya
            decoration: const InputDecoration(
                labelText: "Judul", // Label di atas inputan
                border:
                    OutlineInputBorder() // Border biar inputannya kelihatan jelas
                ),
          ),
          const SizedBox(
            height: 20, // Jarak antara input field, biar ada spasi
          ),
          // Input field buat deskripsi catetan
          TextField(
            controller: controller
                .descC, // Controller buat ngatur inputan deskripsi catetan
            autocorrect: false, // Non-aktifkan autocorrect
            textInputAction:
                TextInputAction.done, // Tombol action selesai di keyboard
            decoration: const InputDecoration(
                labelText: "Deskripsi", // Label di atas inputan
                border: OutlineInputBorder() // Border di inputan
                ),
          ),
          const SizedBox(
            height: 50, // Jarak sebelum tombol, biar ada ruang yang cukup
          ),
          // Tombol buat nambah catetan
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.blue[600]), // Warna background tombol biru gelap
            onPressed: () async {
              // Cek status loading, biar gak ada double click
              if (controller.isLoading.isFalse) {
                await controller
                    .addNote(); // Panggil fungsi buat nambah catetan

                Get.back(); // Kembali ke layar sebelumnya setelah catetan ditambah
              }
            },
            child: Text(
              controller.isLoading.isFalse
                  ? "Nambah Catatan"
                  : "Lagi Proses..", // Teks tombol tergantung status loading
              style: const TextStyle(
                  color: Colors.white), // Warna teks tombol putih
            ),
          ),
        ],
      ),
    );
  }
}
