import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import paket GetX untuk manajemen state

import '../../../data/models/note_model.dart'; // Import model Note
import '../../../routes/app_pages.dart'; // Import rute aplikasi
import '../controllers/home_controller.dart'; // Import controller khusus

// View untuk halaman Home, menggunakan GetX untuk manajemen state
class HomeView extends GetView<HomeController> {
  // Konstruktor widget HomeView, menerima key opsional
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Membangun UI dari widget
    return Scaffold(
      // Struktur dasar layar menggunakan Scaffold
      appBar: AppBar(
        // AppBar untuk menampilkan header
        centerTitle: true, // Judul AppBar di tengah
        backgroundColor: Colors.blue[600], // Setel warna latar belakang AppBar
        title: const Text(
          'LocalDB-SQFLite', // Judul pada AppBar
          style: TextStyle(color: Colors.white), // Gaya teks judul
        ),
      ),
      body: FutureBuilder(
        // Menggunakan FutureBuilder untuk membangun UI berdasarkan status dari Future
        future: controller
            .getAllNotes(), // Future yang menunggu pengambilan semua catatan
        builder: (context, snap) {
          // Menangani status koneksi dari Future
          if (snap.connectionState == ConnectionState.waiting) {
            // Jika sedang menunggu data, tampilkan indikator loading
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // Jika data sudah tersedia, gunakan Obx untuk memantau perubahan pada list catatan
          return Obx(
            () => (controller.allNote.isEmpty)
                // Jika tidak ada data, tampilkan pesan "Tidak ada data"
                ? const Center(
                    child: Text("Tidak ada data"),
                  )
                // Jika ada data, gunakan ListView.builder untuk menampilkan daftar catatan
                : ListView.builder(
                    padding: const EdgeInsets.all(20), // Padding untuk ListView
                    itemCount: controller
                        .allNote.length, // Jumlah item yang akan ditampilkan
                    itemBuilder: (context, index) {
                      // Mengambil objek catatan berdasarkan indeks
                      Note note = controller.allNote[index];
                      return ListTile(
                        // Ketika item daftar diklik, navigasi ke halaman edit note
                        onTap: () {
                          Get.toNamed(
                            Routes.EDIT_NOTE, // Navigasi ke rute EDIT_NOTE
                            arguments:
                                note, // Mengirimkan catatan sebagai argumen
                          );
                        },
                        // Menampilkan avatar lingkaran dengan ID catatan
                        leading: CircleAvatar(
                          backgroundColor:
                              Colors.blue[600], // Warna latar belakang avatar
                          child: Text(
                            "${note.id}", // Menampilkan ID catatan dalam avatar
                            style: const TextStyle(
                                color: Colors.white), // Warna teks putih
                          ),
                        ),
                        // Menampilkan judul catatan sebagai judul tile
                        title: Text(note.title),
                        // Menampilkan deskripsi catatan sebagai subtitle tile
                        subtitle: Text(note.desc),
                        // Tombol untuk menghapus catatan, di sebelah kanan tile
                        trailing: IconButton(
                          onPressed: () {
                            // Ketika tombol hapus ditekan, panggil fungsi deleteNotes
                            controller.deleteNotes(note.id);
                          },
                          icon: Icon(
                            Icons.delete_forever_outlined, // Ikon hapus
                            color: Colors.blue[600], // Warna ikon biru
                          ),
                        ),
                      );
                    },
                  ),
          );
        },
      ),
      // FloatingActionButton untuk menambahkan catatan baru
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigasi ke halaman untuk menambahkan catatan baru
          Get.toNamed(Routes.ADD_NOTE);
        },
        backgroundColor: Colors.blue[600], // Warna latar belakang tombol
        child: const Icon(
          Icons.add, // Ikon tambah
          color: Colors.white, // Warna ikon putih
        ),
      ),
    );
  }
}
