import 'package:flutter/material.dart'; // Import Flutter buat tampilan UI
import 'package:get/get.dart'; // Import GetX buat manajemen state dan navigasi
import 'package:supabase_flutter/supabase_flutter.dart'; // Import Supabase untuk autentikasi dan database

import 'app/controllers/auth_controller.dart'; // Import AuthController
import 'app/routes/app_pages.dart'; // Import rute aplikasi

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Pastikan semua widget binding terinisialisasi

  Supabase supabase = await Supabase.initialize(
    url: "https://bsksabfmyrzjchdgzxxh.supabase.co", // URL Supabase
    anonKey: // Kunci anon untuk akses Supabase
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJza3NhYmZteXJ6amNoZGd6eHhoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjU5NTgwODEsImV4cCI6MjA0MTUzNDA4MX0.MX04-hvh-Em2BX9eQ8p4kWWBFHgyZ_mZh20UngwFJQ0',
  );

  Get.put(AuthController(),
      permanent:
          true); // Daftarin AuthController ke GetX dan bikin dia permanen

  runApp(
    GetMaterialApp(
      title: "Application", // Judul aplikasi
      debugShowCheckedModeBanner: false, // Hilangin banner debug
      initialRoute:
          supabase.client.auth.currentUser == null // Cek apakah user udah login
              ? AppPages.INITIAL // Kalau belum login, mulai dari halaman awal
              : Routes.HOME, // Kalau udah login, langsung ke halaman utama
      getPages: AppPages.routes, // Rute-rute aplikasi
    ),
  );
}
