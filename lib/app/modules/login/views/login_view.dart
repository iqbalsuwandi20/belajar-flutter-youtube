import 'package:flutter/material.dart'; // Bawaan Flutter buat bikin UI kece
import 'package:get/get.dart'; // GetX buat manage state & navigasi

import '../../../controllers/auth_controller.dart'; // Import auth controller biar bisa kontrol login/logout
import '../../../routes/app_pages.dart'; // Import rute biar gampang navigasi
import '../controllers/login_controller.dart'; // Controller buat handling loginnya

class LoginView extends GetView<LoginController> {
  // Ini adalah widget buat nampilin halaman login, pake GetView biar auto connect ke LoginController
  LoginView({super.key}); // Constructor

  final authC = Get.find<AuthController>();
  // Ngehubungin authC ke AuthController biar bisa akses logout dan fungsi auth lainnya

  @override
  Widget build(BuildContext context) {
    // Build method buat ngerender UI di halaman login
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[600], // Background app bar biru gitu
        title: const Text(
          'Login', // Title app bar-nya
          style:
              TextStyle(color: Colors.white), // Font warna putih biar stand out
        ),
        centerTitle: true, // Center title biar rapih
      ),
      body: ListView(
        // Body pakai ListView biar bisa scroll
        padding: const EdgeInsets.all(20), // Padding biar ga mepet
        children: [
          TextField(
            // TextField buat input email
            autocorrect:
                false, // Disable auto-correct, soalnya ini field email bro
            textInputAction:
                TextInputAction.next, // Enter langsung ke field berikutnya
            controller: controller.emailC, // Hubungin ke controller email
            decoration: const InputDecoration(
              labelText: "email", // Label field-nya "email"
              icon: Icon(
                Icons.email_outlined, // Icon email buat hiasan di sebelah
                color: Colors.blue,
              ),
              border:
                  OutlineInputBorder(), // Border biar field-nya ada bingkainya gitu
            ),
          ),
          const SizedBox(
            height: 20, // Jarak biar ga dempet antar field
          ),
          Obx(
            () {
              // Obx buat listen ke perubahan state reactive (kayak isHidden)
              return TextField(
                // TextField buat input password
                autocorrect: false, // Disable auto-correct buat password juga
                obscureText: controller.isHidden.value,
                // Sembunyiin teks password kalau isHidden true
                textInputAction:
                    TextInputAction.next, // Enter pindah ke field berikutnya
                controller: controller.passC, // Hubungin ke controller password
                decoration: InputDecoration(
                  labelText: "password", // Label buat field password
                  icon: Icon(
                    Icons
                        .password_outlined, // Icon password biar kelihatan beda dari field email
                    color: Colors.blue[600],
                  ),
                  suffix: IconButton(
                      onPressed: () {
                        controller.isHidden.toggle();
                        // Button buat toggle hidden/unhidden password (icon mata)
                      },
                      icon: controller.isHidden.isTrue
                          ? const Icon(Icons
                              .remove_red_eye_outlined) // Kalau hidden, iconnya mata
                          : const Icon(Icons
                              .remove_red_eye)), // Kalau visible, iconnya mata dicoret
                  border: const OutlineInputBorder(), // Border buat field-nya
                ),
              );
            },
          ),
          const SizedBox(
            height: 50, // Jarak lagi biar UI-nya napas
          ),
          Obx(
            () {
              // Obx lagi buat handle state dari isLoading
              return ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.blue[600]),
                // Style button dengan warna background biru
                onPressed: () async {
                  // Async function buat login
                  if (controller.isLoading.isFalse) {
                    // Cek dulu kalo lagi ga loading
                    bool? check = await controller.login();
                    // Call function login, simpen hasilnya di check
                    if (check != null && check == true) {
                      // Kalau login berhasil
                      await authC
                          .authLogout(); // Logout user dari session sebelumnya
                      Get.offAllNamed(Routes.HOME); // Arahkan ke halaman HOME
                    }
                  }
                },
                child: Text(
                  // Teks di dalam button
                  controller.isLoading.isFalse ? "LOGIN" : "Lagi Proses..",
                  // Kalau lagi ga loading, button tulis "LOGIN", kalo loading tulis "Lagi Proses.."
                  style: const TextStyle(color: Colors.white),
                  // Font warna putih biar keliatan
                ),
              );
            },
          ),
          const SizedBox(
            height: 10, // Jarak lagi biar proporsional
          ),
          Row(
            // Baris buat nampilin teks register
            children: [
              const Text(
                  "Belum punya akun?"), // Teks info buat user yang belum punya akun
              TextButton(
                onPressed: () {
                  Get.toNamed(Routes.REGISTER);
                  // Kalo di-click, langsung diarahkan ke halaman register
                },
                child: Text(
                  "REGISTER", // Teks button buat daftar
                  style: TextStyle(
                    color: Colors.blue[
                        600], // Warna teksnya biru biar nyambung sama tema
                    fontWeight:
                        FontWeight.bold, // Bikin teks bold biar stand out
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
