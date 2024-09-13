import 'package:flutter/material.dart'; // Import Flutter buat bikin tampilan
import 'package:get/get.dart'; // Import GetX buat manajemen state dan navigasi

import '../controllers/profile_controller.dart'; // Import controller buat handle logic profil

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
          // Judul halaman Profile, warnanya putih
        ),
        centerTitle: true, // Judul di tengah
        backgroundColor: Colors.blue[600],
        // Warna background AppBar
        leading: const SizedBox(), // Ngilangin tombol back default
        actions: [
          IconButton(
            onPressed: () => controller.logout(),
            // Kalo tombol logout di-click, panggil method logout
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.white, // Warna icon logout
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: controller.getProfile(),
        // Ambil data profil dari controller
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blue[600],
                // Indikator loading warna biru
              ),
            );
          }
          return ListView(
            padding: const EdgeInsets.all(20),
            // Padding di seluruh ListView
            children: [
              TextField(
                autocorrect: false,
                // Nonaktifkan autocorrect
                textInputAction: TextInputAction.next,
                // Arahkan input ke field berikutnya
                controller: controller.nameC,
                // Controller untuk field nama
                decoration: const InputDecoration(
                  labelText: "Nama",
                  // Label field nama
                  icon: Icon(
                    Icons.person_outline,
                    color: Colors.blue,
                    // Icon buat field nama
                  ),
                  border: OutlineInputBorder(),
                  // Border field input
                ),
              ),
              const SizedBox(height: 20),
              // Spasi antara field nama dan email
              TextField(
                readOnly: true,
                // Field email cuma bisa dibaca, ga bisa diedit
                autocorrect: false,
                textInputAction: TextInputAction.next,
                controller: controller.emailC,
                // Controller untuk field email
                decoration: const InputDecoration(
                  labelText: "Email",
                  // Label field email
                  icon: Icon(
                    Icons.email_outlined,
                    color: Colors.blue,
                    // Icon buat field email
                  ),
                  border: OutlineInputBorder(),
                  // Border field input
                ),
              ),
              const SizedBox(height: 20),
              // Spasi antara field email dan password
              Obx(() {
                return TextField(
                  autocorrect: false,
                  obscureText: controller.isHidden.value,
                  // Password di-hide atau engga sesuai state isHidden
                  textInputAction: TextInputAction.next,
                  controller: controller.passC,
                  // Controller untuk field password
                  decoration: InputDecoration(
                    labelText: "New Password",
                    // Label field password
                    icon: Icon(
                      Icons.password_outlined,
                      color: Colors.blue[600],
                      // Icon buat field password
                    ),
                    suffix: IconButton(
                      onPressed: () {
                        controller.isHidden.toggle();
                        // Toggle visibility password
                      },
                      icon: controller.isHidden.isTrue
                          ? const Icon(Icons.remove_red_eye_outlined)
                          // Icon buat show password
                          : const Icon(Icons.remove_red_eye),
                      // Icon buat hide password
                    ),
                    border: const OutlineInputBorder(),
                    // Border field input
                  ),
                );
              }),
              const SizedBox(height: 15),
              // Spasi sebelum info terakhir login
              const Text(
                "Terakhir Login",
                style: TextStyle(fontWeight: FontWeight.bold),
                // Label info terakhir login
              ),
              const SizedBox(height: 10),
              // Spasi sebelum tanggal terakhir login
              Obx(() {
                return Text(
                  "${controller.lastLogin}",
                  // Tanggal terakhir login
                  style: const TextStyle(fontSize: 15),
                  // Ukuran font buat tanggal terakhir login
                );
              }),
              const SizedBox(height: 50),
              // Spasi sebelum tombol update profile
              Obx(() {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[600],
                    // Warna background tombol
                  ),
                  onPressed: () async {
                    if (controller.isLoading.isFalse) {
                      await controller.updateProfile();
                      // Update profil user
                      if (controller.passC.text.isNotEmpty &&
                          controller.passC.text.length > 6) {
                        await controller.logout();
                        // Logout kalo password diubah
                      }
                    }
                  },
                  child: Text(
                    controller.isLoading.isFalse
                        ? "GANTI PROFILE"
                        // Text tombol kalo ga lagi loading
                        : "Lagi Proses..",
                    // Text tombol kalo lagi loading
                    style: const TextStyle(color: Colors.white),
                    // Warna text tombol
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
