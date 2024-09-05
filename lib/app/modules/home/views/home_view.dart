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
          'LocalDB-Get Storage', // Judul pada AppBar
          style: TextStyle(color: Colors.white), // Gaya teks judul
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller
                  .resetData(); // Memanggil metode resetData dari controller untuk mereset data
            },
            icon: const Icon(
              Icons.restore, // Ikon restore untuk mereset data
              color: Colors.white, // Warna ikon restore
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
                  '${controller.data}', // Menampilkan nilai data dari controller yang diobservasi
                  style: const TextStyle(fontSize: 50), // Ukuran dan gaya teks
                );
              },
            ),
            const SizedBox(
              height: 20, // Memberikan jarak antara elemen
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceEvenly, // Mengatur elemen secara merata di baris
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue[600], // Warna latar belakang tombol
                  ),
                  onPressed: () {
                    controller
                        .increment(); // Memanggil metode increment dari controller untuk menambah data
                  },
                  child: const Text(
                    "+", // Teks tombol untuk menambah nilai
                    style: TextStyle(color: Colors.white), // Gaya teks tombol
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue[600], // Warna latar belakang tombol
                  ),
                  onPressed: () {
                    controller
                        .decrement(); // Memanggil metode decrement dari controller untuk mengurangi data
                  },
                  child: const Text(
                    "-", // Teks tombol untuk mengurangi nilai
                    style: TextStyle(color: Colors.white), // Gaya teks tombol
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
