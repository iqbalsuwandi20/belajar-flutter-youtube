import 'package:flutter/material.dart'; // Import widget material buat desain UI
import 'package:get/get.dart'; // Import GetX biar gampang state management-nya

import '../../home/controllers/home_controller.dart'; // Import controller home, biar bisa akses fitur di home
import '../controllers/add_note_controller.dart'; // Import controller buat nambahin note

class AddNoteView extends GetView<AddNoteController> {
  // Ini view buat tambah note
  AddNoteView({super.key}); // Constructor buat AddNoteView

  final homeC = Get.find<
      HomeController>(); // Panggil home controller biar bisa akses fungsi di halaman home

  @override
  Widget build(BuildContext context) {
    // Build method buat ngebentuk UI dari view ini
    return Scaffold(
      // Pakai Scaffold biar dapet struktur dasar halaman
      appBar: AppBar(
        // Ini AppBar buat judul halaman
        title: const Text(
          // Teks judul di app bar
          'Add Note', // Judulnya 'Add Note'
          style: TextStyle(
              color: Colors.white), // Styling teks biar warnanya putih
        ),
        centerTitle: true, // Posisi judul di tengah
        backgroundColor: Colors.blue[600], // Background app bar warna biru
        leading: const SizedBox(), // Leading kosong biar gak ada back button
      ),
      body: ListView(
        // Pakai ListView buat tampilan form
        padding: const EdgeInsets.all(
            20), // Padding biar ada jarak sama pinggiran layar
        children: [
          TextField(
            // TextField buat input judul note
            controller:
                controller.titleC, // Controller buat ambil teks yang diinput
            autocorrect: false, // Autocorrect dimatiin biar teks ga diubah-ubah
            textInputAction: TextInputAction
                .next, // Kalo udah selesai, lanjut ke field berikutnya
            decoration: InputDecoration(
              // Styling buat input field
              icon: Icon(
                // Icon di sebelah kiri input
                Icons.title_outlined, // Iconnya berupa title outline
                color: Colors.blue[600], // Warnanya biru
              ),
              labelText: "Judul", // Label yang muncul di field
              border:
                  const OutlineInputBorder(), // Biar ada border di sekitar input field
            ),
          ),
          const SizedBox(
              height: 20), // Jarak vertikal antara TextField pertama dan kedua
          TextField(
            // TextField buat input deskripsi note
            controller: controller
                .descC, // Controller buat ambil teks deskripsi yang diinput
            autocorrect: false, // Autocorrect dimatiin juga
            textInputAction:
                TextInputAction.next, // Lanjut ke field berikutnya pas selesai
            decoration: const InputDecoration(
              // Styling input field deskripsi
              icon: Icon(Icons.description_outlined), // Icon deskripsi
              labelText: "Deskripsi", // Labelnya "Deskripsi"
              border:
                  OutlineInputBorder(), // Biar ada border di sekitar input field
            ),
          ),
          const SizedBox(height: 50), // Jarak vertikal sebelum button
          Obx(
            // Pakai Obx buat nge-react sama perubahan data observable di controller
            () {
              return ElevatedButton(
                // Button buat nambahin note
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue[600]), // Styling button dengan warna biru
                onPressed: () async {
                  // Fungsi yang dijalanin kalo button ditekan
                  if (controller.isLoading.isFalse) {
                    // Cek kalo gak lagi loading
                    bool response = await controller
                        .addNote(); // Tambah note pake controller
                    if (response == true) {
                      // Kalo berhasil
                      await homeC
                          .getAllNotes(); // Panggil fungsi di home controller buat refresh note
                      Get.back(); // Kembali ke halaman sebelumnya
                    } else {
                      // Kalo gagal
                      Get.snackbar(
                          // Munculin snackbar error
                          "Terjadi Kesalahan",
                          "Coba perhatikan baik baik"); // Pesan error
                    }
                  }
                },
                child: Text(
                  // Teks di button
                  controller.isLoading.isFalse
                      ? "ADD NOTE"
                      : "LAGI PROSES", // Teks berubah kalo lagi loading
                  style: const TextStyle(
                      color: Colors.white), // Warna teks di button putih
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
