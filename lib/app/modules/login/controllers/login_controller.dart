import 'package:flutter/material.dart'; // Ini package buat bikin UI di Flutter
import 'package:get/get.dart'; // Import GetX buat state management yang canggih
import 'package:supabase_flutter/supabase_flutter.dart'; // Supabase buat handling authentication

class LoginController extends GetxController {
  // Controller buat handling login, nge-manage input email dan password

  TextEditingController emailC = TextEditingController(
      text:
          "iqbalsuwandi20@gmail.com"); // Controller buat input email, default diisi email lu bro
  TextEditingController passC = TextEditingController(
      text:
          "iqbalganteng20"); // Controller buat input password, ini diisi password ganteng

  RxBool isLoading = false
      .obs; // Observable bool buat nge-track state loading, biar tahu kapan mulai dan selesai
  RxBool isHidden = true
      .obs; // Observable bool buat sembunyiin atau tampilkan password (toggle eye icon gitu)

  SupabaseClient client = Supabase.instance.client;
  // Inisialisasi SupabaseClient buat akses ke API authentication Supabase

  Future<bool?> login() async {
    // Function login, hasilnya Future boolean atau null, dipake buat nge-auth user

    if (emailC.text.isNotEmpty && passC.text.isNotEmpty) {
      // Cek kalau inputan email dan password ga kosong, kalo kosong, kita kasih feedback error
      isLoading.value =
          true; // Pasang state loading jadi true waktu mulai proses login

      try {
        // Coba proses login pake method signInWithPassword dari Supabase
        final response = await client.auth.signInWithPassword(
          email: emailC.text, // Ambil input email dari controller emailC
          password: passC.text, // Ambil input password dari controller passC
        );
        isLoading.value =
            false; // Kalo proses udah selesai, matiin state loading jadi false

        // Ini buat nge-debug, nge-print respon dari server
        if (response.session != null) {
          print(
              'Session: ${response.session}'); // Print session kalo login sukses
          print(
              'User: ${response.user?.toJson()}'); // Print info user yang lagi login

          return true; // Return true kalo login berhasil
        } else {
          print('Error: ${response}'); // Kalo ada masalah, print error
          Get.snackbar("Terjadi Kesalahan", 'Unknown error');
          // Kasih snackbar feedback error di UI, biar user tau ada masalah
        }
      } on AuthException catch (e) {
        // Handle error dari Supabase kalo ada masalah saat login
        isLoading.value = false; // Matikan loading biar ga stuck
        Get.snackbar("Terjadi Kesalahan", e.message);
        // Kasih feedback error spesifik dari Supabase ke user
      } catch (e) {
        // Catch buat error yang ga ketangkep, jadi handle error yang lebih general
        isLoading.value = false; // Matikan loading kalo ada error
        Get.snackbar(
            "Terjadi Kesalahan", "Kesalahan tidak terduga: ${e.toString()}");
        // Kasih feedback error yang unexpected ke user
      }
    } else {
      // Kondisi kalo email atau password kosong
      Get.snackbar(
          "Terjadi Kesalahan", "Email dan Password tidak boleh kosong.");
      // Kasih snackbar feedback ke user kalo ada field yang kosong
    }
    return null; // Return null kalo ada masalah yang bikin login gagal
  }
}
