import 'dart:async'; // Import modul untuk penggunaan Timer yang bisa di-cancel

import 'package:get/get.dart'; // Import modul GetX biar lebih mudah state management-nya
import 'package:supabase_flutter/supabase_flutter.dart'; // Import modul biar bisa konek ke Supabase

import '../routes/app_pages.dart'; // Import modul buat route aplikasi, biar bisa navigasi

class AuthController extends GetxController {
  // Controller buat manajemen autentikasi, mantap!

  Timer? authTimer; // Inisialisasi variabel untuk timer, buat auto-logout nanti

  SupabaseClient client =
      Supabase.instance.client; // Koneksi ke Supabase biar bisa nyambung!

  Future<void> authLogout() async {
    // Fungsi buat logout otomatis nih, jangan lupa cancel timer kalo udah logout
    if (authTimer != null) {
      // Kalo timer masih jalan, cancel dulu
      authTimer!.cancel();
    }

    authTimer = Timer(
      // Set timer, otomatis logout dalam 24 jam
      const Duration(seconds: 86400), // Durasi timer 24 jam (86400 detik)
      () async {
        // Lamunyan, pas timer abis, logout otomatis
        await client.auth.signOut(); // Proses logout dari Supabase
        Get.offAllNamed(Routes.LOGIN); // Pindah ke halaman login setelah logout
      },
    );

    print(
        "Auto Logout dijalankan"); // Cetak pesen di konsol, buat tau kalo auto-logout jalan
  }

  Future<void> reset() async {
    // Fungsi buat reset timer, kalo misalnya gak jadi auto-logout
    if (authTimer != null) {
      // Kalo timer masih jalan, cancel dulu
      authTimer!.cancel();
      authTimer = null; // Reset timer jadi null biar gak salah
    }
  }
}
