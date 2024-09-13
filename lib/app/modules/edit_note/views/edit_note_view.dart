import 'package:flutter/material.dart'; // Import buat widget Flutter
import 'package:get/get.dart'; // Import GetX buat manajemen state

import '../../../models/note_models.dart'; // Import model note buat nge-handle data note
import '../../home/controllers/home_controller.dart'; // Import controller home buat refresh list note
import '../controllers/edit_note_controller.dart'; // Import controller buat edit note

// ignore: must_be_immutable
class EditNoteView extends GetView<EditNoteController> {
  // View buat nge-render halaman edit note
  EditNoteView({super.key}); // Constructor buat EditNoteView

  NoteModels noteModels = Get
      .arguments; // Ambil argument dari halaman sebelumnya (data note yang mau diedit)

  final homeC = Get.find<
      HomeController>(); // Ambil instance HomeController buat panggil fungsinya nanti

  @override
  Widget build(BuildContext context) {
    // Method build buat bikin UI halaman
    controller.titleC.text =
        noteModels.title!; // Set judul note yang udah ada ke TextField
    controller.descC.text =
        noteModels.desc!; // Set deskripsi note yang udah ada ke TextField

    return Scaffold(
      // Scaffold buat bikin struktur dasar halaman
      appBar: AppBar(
        // AppBar buat judul di bagian atas halaman
        title: const Text(
          // Teks di AppBar
          'Edit Note', // Judul halaman
          style: TextStyle(
              color: Colors.white), // Styling teks judul biar warnanya putih
        ),
        centerTitle: true, // Judul di tengah
        backgroundColor: Colors.blue[600], // Background warna biru buat AppBar
        leading: const SizedBox(), // Biar gak ada back button default di AppBar
      ),
      body: ListView(
        // ListView buat tampilan form edit note
        padding:
            const EdgeInsets.all(20), // Padding biar ada jarak dari pinggir
        children: [
          TextField(
            // TextField buat edit judul note
            controller: controller.titleC, // Controller buat input teks judul
            autocorrect:
                false, // Autocorrect dimatiin biar gak ngubah teks sendiri
            textInputAction: TextInputAction
                .next, // Action button keyboard lanjut ke input berikutnya
            decoration: InputDecoration(
              // Styling input field
              icon: Icon(
                // Icon di samping TextField
                Icons.title_outlined, // Icon title outline
                color: Colors.blue[600], // Warna icon biru
              ),
              labelText: "Judul", // Label TextField "Judul"
              border:
                  const OutlineInputBorder(), // Border di sekeliling TextField
            ),
          ),
          const SizedBox(
              height: 20), // Jarak antara TextField judul dan deskripsi
          TextField(
            // TextField buat edit deskripsi note
            controller:
                controller.descC, // Controller buat input teks deskripsi
            autocorrect:
                false, // Autocorrect dimatiin biar gak ngubah teks sendiri
            textInputAction: TextInputAction
                .next, // Action button keyboard lanjut ke input berikutnya
            decoration: const InputDecoration(
              // Styling input field deskripsi
              icon: Icon(Icons.description_outlined), // Icon deskripsi outline
              labelText: "Deskripsi", // Label TextField "Deskripsi"
              border: OutlineInputBorder(), // Border di sekeliling TextField
            ),
          ),
          const SizedBox(height: 50), // Jarak sebelum tombol edit
          Obx(
            // Obx buat dengerin perubahan isLoading
            () {
              return ElevatedButton(
                // Tombol buat submit edit note
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue[600]), // Styling tombol dengan warna biru
                onPressed: () async {
                  // Fungsi yang dijalankan saat tombol ditekan
                  if (controller.isLoading.isFalse) {
                    // Cek kalo gak lagi loading
                    bool response = await controller.editNote(noteModels
                        .id!); // Panggil fungsi edit note dari controller
                    if (response == true) {
                      // Kalo berhasil edit
                      await homeC
                          .getAllNotes(); // Panggil fungsi refresh note di home controller
                      Get.back(); // Balik ke halaman sebelumnya
                    } else {
                      // Kalo gagal
                      Get.snackbar(
                          // Munculin Snackbar buat error message
                          "Terjadi Kesalahan",
                          "Coba perhatikan baik baik"); // Pesan error
                    }
                  }
                },
                child: Text(
                  // Teks di tombol
                  controller.isLoading.isFalse
                      ? "EDIT NOTE"
                      : "LAGI PROSES", // Ubah teks tombol kalo lagi proses
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
