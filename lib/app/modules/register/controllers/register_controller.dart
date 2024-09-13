import 'package:flutter/material.dart'; // Import Flutter buat tampilan
import 'package:get/get.dart'; // Import GetX buat manajemen state dan navigasi
import 'package:supabase_flutter/supabase_flutter.dart'; // Import Supabase buat autentikasi

import '../../../routes/app_pages.dart'; // Import routes buat navigasi

class RegisterController extends GetxController {
  TextEditingController nameC = TextEditingController(text: "Iqbal Suwandi");
  // Controller buat input nama, defaultnya "Iqbal Suwandi"
  TextEditingController emailC =
      TextEditingController(text: "iqbalsuwandi20@gmail.com");
  // Controller buat input email, defaultnya "iqbalsuwandi20@gmail.com"
  TextEditingController passC = TextEditingController(text: "iqbalganteng20");
  // Controller buat input password, defaultnya "iqbalganteng20"

  RxBool isLoading = false.obs; // Variabel observasi buat ngecek loading
  RxBool isHidden = true.obs; // Variabel observasi buat hide/show password

  SupabaseClient client = Supabase.instance.client;
  // Inisialisasi Supabase client buat akses autentikasi dan database

  void signUp() async {
    if (nameC.text.isNotEmpty &&
        emailC.text.isNotEmpty &&
        passC.text.isNotEmpty) {
      // Cek apakah semua field sudah diisi
      isLoading.value = true;
      // Set loading jadi true biar tampilan loading muncul

      // Sign up ke Supabase
      AuthResponse response = await client.auth.signUp(
        email: emailC.text,
        password: passC.text,
      );
      isLoading.value = false;
      // Set loading jadi false setelah proses selesai

      // Jika sign up berhasil
      if (response.user != null) {
        print("==================");
        print("User ID: ${response.user!.id}");
        // Print User ID buat debugging
        print("==================");
        print("Session: ${response.session}");
        // Print session buat debugging

        // Masukkan data user ke dalam tabel 'users'
        var insertResponse = await client.from("users").insert({
          "email": emailC.text,
          "name": nameC.text,
          "created_at": DateTime.now().toIso8601String(),
          "uid": response.user!.id
        });

        // Cek apakah terjadi error saat memasukkan data
        if (insertResponse.error != null) {
          print("Error inserting data: ${insertResponse.error!.message}");
          // Print error message buat debugging
          Get.snackbar("Terjadi Kesalahan",
              "Gagal menyimpan data ke database: ${insertResponse.error!.message}");
          // Tampilkan snackbar kalo gagal nyimpan data
        } else {
          print("Data berhasil disimpan: ${insertResponse.data}");
          // Print data yang berhasil disimpan buat debugging

          // Pindah ke halaman login setelah berhasil register
          Get.offAllNamed(Routes.LOGIN);
          // Navigasi ke halaman login
        }
      } else {
        Get.snackbar(
            "Terjadi Kesalahan", "Gagal registrasi. Silakan coba lagi.");
        // Tampilkan snackbar kalo registrasi gagal
      }
    } else {
      Get.snackbar("Terjadi Kesalahan", "Semua kolom harus diisi.");
      // Tampilkan snackbar kalo ada field yang kosong
    }
  }
}
