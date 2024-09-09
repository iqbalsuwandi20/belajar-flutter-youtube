import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/databases/database.dart';
import '../controllers/edit_note_controller.dart';

// Tampilan buat ngedit catetan
// ignore: must_be_immutable // Digunakan buat ngilangin warning dari Dart terkait parameter 'notes' yang bakal diubah
class EditNoteView extends GetView<EditNoteController> {
  EditNoteView({super.key}); // Konstruktor dengan key opsional

  // Ambil objek catetan yang mau diedit dari argumen yang dikirim
  Notes notes = Get.arguments;

  @override
  Widget build(BuildContext context) {
    // Set text controller dengan data dari catetan yang mau diedit
    controller.titleC.text = notes.title!;
    controller.descC.text = notes.desc!;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mengubah Catatan', // Judul di AppBar
          style: TextStyle(color: Colors.white), // Warna teks putih
        ),
        centerTitle: true, // Judul ditengah-tengah
        backgroundColor: Colors.blue[600], // Warna background AppBar biru gelap
        leading: const SizedBox(), // Kosongin icon leading di sebelah kiri
      ),
      body: ListView(
        padding: const EdgeInsets.all(20), // Padding di seluruh body
        children: [
          // Input field buat judul catetan
          TextField(
            controller:
                controller.titleC, // Controller yang ngatur inputan judul
            autocorrect: false, // Non-aktifkan autocorrect biar lebih kontrol
            textInputAction: TextInputAction
                .next, // Tombol action berikutnya di keyboard, pindah ke field berikutnya
            decoration: const InputDecoration(
                labelText: "Judul", // Label di atas inputan
                border:
                    OutlineInputBorder() // Border di inputan biar kelihatan jelas
                ),
          ),
          const SizedBox(
            height: 20, // Jarak antara input field judul dan deskripsi
          ),
          // Input field buat deskripsi catetan
          TextField(
            controller:
                controller.descC, // Controller yang ngatur inputan deskripsi
            autocorrect: false, // Non-aktifkan autocorrect
            textInputAction:
                TextInputAction.done, // Tombol action selesai di keyboard
            decoration: const InputDecoration(
                labelText: "Deskripsi", // Label di atas inputan
                border: OutlineInputBorder() // Border di inputan
                ),
          ),
          const SizedBox(
            height: 50, // Jarak sebelum tombol simpan
          ),
          // Tombol buat simpen perubahan catetan
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.blue[600]), // Warna background tombol biru gelap
            onPressed: () async {
              // Cek apakah lagi proses loading atau enggak
              if (controller.isLoading.isFalse) {
                await controller
                    .editNote(notes); // Panggil fungsi buat ngedit catetan
                Get.back(); // Kembali ke layar sebelumnya setelah catetan diubah
              }
            },
            child: Text(
              controller.isLoading.isFalse
                  ? "Mengubah Catatan" // Teks tombol kalo lagi enggak ada proses
                  : "Lagi Proses..", // Teks tombol kalo lagi proses
              style: const TextStyle(
                  color: Colors.white), // Warna teks tombol putih
            ),
          ),
        ],
      ),
    );
  }
}
