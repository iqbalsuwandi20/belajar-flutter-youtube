import 'package:flutter/material.dart'; // Import Flutter buat tampilan UI
import 'package:get/get.dart'; // Import GetX buat manajemen state dan navigasi

import '../controllers/register_controller.dart'; // Import RegisterController

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[600], // Warna background app bar
        title: const Text(
          'Register', // Judul halaman
          style: TextStyle(color: Colors.white), // Warna teks judul
        ),
        centerTitle: true, // Judul di tengah
        leading: const SizedBox(), // Kosongkan icon leading (kiri)
      ),
      body: ListView(
        padding: const EdgeInsets.all(20), // Padding untuk konten
        children: [
          TextField(
            autocorrect: false, // Nonaktifkan autocorrect
            textInputAction:
                TextInputAction.next, // Action berikutnya setelah enter
            controller: controller.nameC, // Controller untuk input nama
            decoration: const InputDecoration(
              labelText: "Nama", // Label untuk input nama
              icon: Icon(
                Icons.person_outline, // Icon untuk input nama
                color: Colors.blue,
              ),
              border: OutlineInputBorder(), // Border untuk input
            ),
          ),
          const SizedBox(height: 20), // Jarak antar elemen
          TextField(
            autocorrect: false, // Nonaktifkan autocorrect
            textInputAction:
                TextInputAction.next, // Action berikutnya setelah enter
            controller: controller.emailC, // Controller untuk input email
            decoration: const InputDecoration(
              labelText: "Email", // Label untuk input email
              icon: Icon(
                Icons.email_outlined, // Icon untuk input email
                color: Colors.blue,
              ),
              border: OutlineInputBorder(), // Border untuk input
            ),
          ),
          const SizedBox(height: 20), // Jarak antar elemen
          Obx(() {
            return TextField(
              autocorrect: false, // Nonaktifkan autocorrect
              obscureText: controller.isHidden.value, // Hide/show password
              textInputAction:
                  TextInputAction.next, // Action berikutnya setelah enter
              controller: controller.passC, // Controller untuk input password
              decoration: InputDecoration(
                labelText: "Password", // Label untuk input password
                icon: Icon(
                  Icons.password_outlined, // Icon untuk input password
                  color: Colors.blue[600],
                ),
                suffix: IconButton(
                  onPressed: () {
                    controller.isHidden.toggle(); // Toggle visibility password
                  },
                  icon: controller.isHidden.isTrue
                      ? const Icon(
                          Icons.remove_red_eye_outlined) // Icon show password
                      : const Icon(Icons.remove_red_eye), // Icon hide password
                ),
                border: const OutlineInputBorder(), // Border untuk input
              ),
            );
          }),
          const SizedBox(height: 50), // Jarak antar elemen
          Obx(() {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[600], // Warna background button
              ),
              onPressed: () {
                if (controller.isLoading.isFalse) {
                  // Cek apakah sedang loading
                  controller.signUp(); // Panggil method signUp dari controller
                }
              },
              child: Text(
                controller.isLoading.isFalse
                    ? "REGISTER"
                    : "Lagi Proses..", // Teks button
                style:
                    const TextStyle(color: Colors.white), // Warna teks button
              ),
            );
          }),
        ],
      ),
    );
  }
}
