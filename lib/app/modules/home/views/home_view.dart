import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import paket GetX untuk manajemen state
import '../controllers/home_controller.dart'; // Import controller khusus

class HomeView extends GetView<HomeController> {
  const HomeView({super.key}); // Konstruktor untuk widget HomeView

  @override
  Widget build(BuildContext context) {
    // Metode build widget
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[600], // Setel warna latar belakang AppBar
        title: const Text(
          'LocalDB-Shared Preferences', // Judul pada AppBar
          style: TextStyle(color: Colors.white), // Gaya teks
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller
                  .resetData(); // Memanggil metode resetData dari controller
            },
            icon: const Icon(
              Icons.restore, // Ikon restore
              color: Colors.white, // Warna ikon
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Pusatkan elemen secara vertikal
          children: [
            Obx(
              () {
                return Text(
                  '${controller.data}', // Menampilkan data dari controller
                  style: const TextStyle(fontSize: 50), // Gaya teks
                );
              },
            ),
            const SizedBox(
              height: 20, // Spasi antara elemen
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceEvenly, // Elemen diatur merata di baris
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue[600], // Warna latar belakang tombol
                  ),
                  onPressed: () {
                    controller
                        .increment(); // Memanggil metode increment dari controller
                  },
                  child: const Text(
                    "+", // Teks pada tombol
                    style: TextStyle(color: Colors.white), // Gaya teks
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue[600], // Warna latar belakang tombol
                  ),
                  onPressed: () {
                    controller
                        .decrement(); // Memanggil metode decrement dari controller
                  },
                  child: const Text(
                    "-", // Teks pada tombol
                    style: TextStyle(color: Colors.white), // Gaya teks
                  ),
                ),
              ],
            ),
            // Kode di bawah ini bisa diaktifkan untuk menambahkan fungsionalitas:
            // const SizedBox(
            //   height: 20, // Spasi tambahan
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Mengatur posisi elemen merata di baris
            //   children: [
            //     ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: Colors.blue[600],
            //       ),
            //       onPressed: () {
            //         controller.simpanData(); // Contoh fungsi tambahan tombol
            //       },
            //       child: const Text(
            //         "Simpan data",
            //         style: TextStyle(color: Colors.white),
            //       ),
            //     ),
            //     ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: Colors.blue[600],
            //       ),
            //       onPressed: () {
            //         // Fungsi tambahan tombol
            //       },
            //       child: const Text(
            //         "Hapus data",
            //         style: TextStyle(color: Colors.white),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
