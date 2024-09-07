import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/databases/note_database.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
/// Ini nih, tampilan utama (HomeView) buat lo ngeliat semua catatan yang udah lo simpen.
class HomeView extends GetView<HomeController> {
  /// Konstruktor buat HomeView, bro.
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Biar judulnya di tengah, stylish banget kan?
        backgroundColor:
            Colors.blue[600], // Latar belakang AppBar warna biru, kece abis!
        title: const Text(
          'LocalDB - Moor', // Judul aplikasi di AppBar, biar lo tau ini app database lokal.
          style: TextStyle(
              color: Colors.white), // Teksnya putih biar kontras sama birunya.
        ),
      ),
      body: StreamBuilder<List<NoteDatabaseData>>(
          stream: controller.noteM
              .streamAllNotes(), // Ini nge-stream semua catatan dari database, real-time bro.
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              // Kalau lagi loading, tampilkan loading spinner.
              return const Center(
                child:
                    CircularProgressIndicator(), // Loading circle yang muter-muter.
              );
            }
            // Kalau gak ada data, kasih info kalau belum ada catatan.
            // ignore: prefer_is_empty
            if (snap.data?.length == 0 || snap.data == null) {
              return const Center(
                child: Text(
                    "Belum ada catatan, bro!"), // Pesan yang tampil kalau belum ada catatan.
              );
            }
            // Kalau udah ada data, kita bikin ListView buat nampilin semua catatan.
            return ListView.builder(
              itemCount: snap.data!.length, // Jumlah item sesuai data yang ada.
              padding: const EdgeInsets.all(
                  10), // Biar ada jarak dikit dari pinggir layar.
              itemBuilder: (context, index) {
                NoteDatabaseData noteDatabaseData =
                    snap.data![index]; // Ambil catatan sesuai index-nya.
                return ListTile(
                  // Kalo lo tap, lo bakal diarahkan buat ngedit catatan.
                  onTap: () {
                    Get.toNamed(
                      Routes.EDIT_NOTE, // Menuju ke halaman edit catatan.
                      arguments:
                          noteDatabaseData, // Bawa data catatan yang mau diedit.
                    );
                  },
                  // Avatar lingkaran dengan nomor ID catatan.
                  leading: CircleAvatar(
                    backgroundColor:
                        Colors.blue[600], // Biar matching warna birunya.
                    child: Text(
                      "${noteDatabaseData.id}", // Tampilkan ID catatan di sini.
                      style: const TextStyle(
                          color: Colors.white), // Teksnya putih biar stand out.
                    ),
                  ),
                  // Judul dan deskripsi catatan.
                  title: Text(noteDatabaseData.title),
                  subtitle: Text(noteDatabaseData.desc),
                  // Tombol delete buat hapus catatan.
                  trailing: IconButton(
                      onPressed: () {
                        controller.noteM.deleteNotes(
                            noteDatabaseData); // Hapus catatan dari database.
                      },
                      icon: Icon(
                        Icons.delete, // Ikon tong sampah buat hapus catatan.
                        color: Colors.blue[
                            600], // Warna biru biar tetap konsisten sama tema.
                      )),
                );
              },
            );
          }),
      // Tombol buat tambah catatan baru.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(
            Routes.ADD_NOTE, // Ke halaman tambah catatan baru.
          );
        },
        backgroundColor:
            Colors.blue[600], // Warna biru lagi biar senada sama tema.
        child: const Icon(
          Icons.add, // Ikon tambah (+) buat nambahin catatan.
          color: Colors.white, // Putih biar kontras sama background tombolnya.
        ),
      ),
    );
  }
}
