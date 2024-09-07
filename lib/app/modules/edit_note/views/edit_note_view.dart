import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/databases/note_database.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/edit_note_controller.dart';

/// Tampilan (View) buat ubah catatan yang udah ada.
// ignore: must_be_immutable
class EditNoteView extends GetView<EditNoteController> {
  /// Ngambil instance HomeController pake GetX.
  final HomeController homeC = Get.find();

  /// Ngambil data catatan yang mau diubah dari argumen yang dikirim.
  NoteDatabaseData noteDatabaseData = Get.arguments;

  /// Konstruktor buat EditNoteView.
  EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    /// Isi teks awal di TextField pake data catatan yang ada.
    controller.titleC.text = noteDatabaseData.title;
    controller.descC.text = noteDatabaseData.desc;

    return Scaffold(
      appBar: AppBar(
        /// Judul yang nongol di AppBar.
        title: const Text(
          'Ubah Catetan',
          style: TextStyle(color: Colors.white),
        ),

        /// Warna latar belakang AppBar, biar keren gitu.
        backgroundColor: Colors.blue[600],

        /// Ngehilangkan tombol kembali di AppBar.
        leading: const SizedBox(),

        /// Ngepasin judul di tengah AppBar biar keren.
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          /// Input buat judul catatan, pake TextField.
          TextField(
            controller: controller.titleC,
            decoration: const InputDecoration(
              labelText: "Judulnya",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),

          /// Input buat deskripsi catatan, juga pake TextField.
          TextField(
            controller: controller.descC,
            decoration: const InputDecoration(
              labelText: "Deskripsinya",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 30),

          /// Tombol buat nyimpen perubahan catatan, pake Obx buat
          /// ngeliat perubahan status loading.
          Obx(
            () {
              return ElevatedButton(

                  /// Set warna latar belakang tombol.
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[600]),

                  /// Fungsi yang jalan kalo tombolnya diklik.
                  onPressed: () async {
                    if (controller.isLoading.isFalse) {
                      /// Set status loading jadi true.
                      controller.isLoading.value = true;

                      /// Update catatan di database dengan data baru.
                      homeC.noteM.updateNotes(NoteDatabaseData(
                        id: noteDatabaseData.id,
                        title: controller.titleC.text,
                        desc: controller.descC.text,
                      ));

                      /// Set status loading jadi false setelah selesai.
                      controller.isLoading.value = false;

                      /// Balik ke halaman sebelumnya setelah catatan diubah.
                      Get.back();
                    }
                  },

                  /// Teks di tombol yang berubah sesuai status loading.
                  child: Text(
                    (controller.isLoading.isFalse)
                        ? "Ubah Catetan"
                        : "Lagi Proses..",
                    style: const TextStyle(color: Colors.white),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
