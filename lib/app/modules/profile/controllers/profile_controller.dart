import 'package:flutter/material.dart'; // Bawaan Flutter buat bikin tampilan kece
import 'package:get/get.dart'; // GetX buat manajemen state dan navigasi
import 'package:intl/intl.dart'; // Buat format tanggal dan waktu
import 'package:supabase_flutter/supabase_flutter.dart'; // Buat interaksi sama Supabase

import '../../../controllers/auth_controller.dart'; // Controller buat handle autentikasi
import '../../../routes/app_pages.dart'; // Rute buat pindah-pindah halaman

class ProfileController extends GetxController {
  // Controller buat manage tampilan Profile

  TextEditingController nameC = TextEditingController();
  // Controller buat input nama
  TextEditingController emailC = TextEditingController();
  // Controller buat input email
  TextEditingController passC = TextEditingController();
  // Controller buat input password

  RxBool isLoading = false.obs;
  // Observable boolean buat ngecek loading state
  RxBool isHidden = true.obs;
  // Observable boolean buat toggle visibility password

  RxString lastLogin = "".obs;
  // Observable string buat nyimpen informasi last login

  SupabaseClient client = Supabase.instance.client;
  // Client Supabase buat handle koneksi ke database

  Future<void> getProfile() async {
    // Function buat nge-load profile user
    var response = await client.from("users").select().match({
      "uid": client.auth.currentUser!.id,
    });
    // Ambil data user dari tabel "users" berdasarkan user ID dari current session

    Map<String, dynamic> user =
        (response as List).first as Map<String, dynamic>;
    // Convert response ke Map biar gampang diakses

    nameC.text = user["name"];
    // Isi TextController nama pake data dari database
    emailC.text = user["email"];
    // Isi TextController email pake data dari database

    lastLogin.value = DateFormat.yMMMEd()
        .add_jms()
        .format(DateTime.parse(client.auth.currentUser!.lastSignInAt!));
    // Format last login jadi human readable date pake package intl

    // print(response); // Debugging print response-nya kalo mau liat data mentahnya
  }

  Future<void> logout() async {
    // Function buat logout dari app
    bool? confirm = await Get.dialog<bool>(
      // Dialog konfirmasi buat logout
      AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text('Yakin untuk logout?'),
        // Pesan dialog: "Yakin mau logout?"
        actions: <Widget>[
          TextButton(
            onPressed: () => Get.back(result: false),
            // Kalo milih "Batal", dialog ditutup dan result-nya false
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () async {
              Get.back(result: true);
              // Kalo milih "Logout", tutup dialog dan set result-nya true
              await _performLogout();
              // Lanjutin proses logout
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      // Kalo user konfirmasi logout
      await _performLogout();
      // Panggil function buat beneran logout
    }
  }

  Future<void> _performLogout() async {
    // Function private buat beneran nge-logout
    await client.auth.signOut();
    // Logout dari Supabase client

    final authC = Get.find<AuthController>();
    // Ambil instance AuthController
    await authC.reset();
    // Reset state di AuthController setelah logout

    Get.offAllNamed(Routes.LOGIN);
    // Redirect user ke halaman login setelah logout
  }

  Future<void> updateProfile() async {
    // Function buat update profil user
    if (nameC.text.isNotEmpty) {
      // Cek dulu kalo field nama ga kosong
      isLoading.value = true;
      // Set state loading jadi true biar user tau lagi proses

      await client.from("users").update({
        "name": nameC.text,
        // Update nama di database pake value dari TextController nameC
      }).match({
        "uid": client.auth.currentUser!.id,
        // Filter update-nya berdasarkan uid dari user yang lagi login
      });

      if (passC.text.isNotEmpty) {
        // Kalo password diisi
        if (passC.text.length > 6) {
          // Password harus lebih dari 6 karakter, kalo engga gagal
          try {
            await client.auth.updateUser(
              UserAttributes(password: passC.text),
            );
            // Update password user pake Supabase
          } catch (e) {
            Get.snackbar("Terjadi Kesalahan", "$e");
            // Kalo ada error, tampilin snackbar dengan pesan errornya
          }
        } else {
          Get.snackbar("Tidak dapat ganti Password",
              "Password harus lebih dari 6 karakter");
          // Kalo password kurang dari 6 karakter, kasih peringatan di snackbar
        }
      }
      isLoading.value = false;
      // Setelah selesai update, set loading jadi false lagi

      Get.back();
      // Tutup halaman setelah selesai update
    }
  }
}
