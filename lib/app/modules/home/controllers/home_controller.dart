import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  RxInt data = 0.obs; // Deklarasi variabel observasi untuk menyimpan nilai data

  // Fungsi untuk mengurangi nilai data
  void decrement() {
    data--; // Mengurangi nilai data
    simpanData(); // Memanggil fungsi untuk menyimpan data ke Shared Preferences
  }

  // Fungsi untuk menambah nilai data
  void increment() {
    data++; // Menambah nilai data
    simpanData(); // Memanggil fungsi untuk menyimpan data ke Shared Preferences
  }

  // Fungsi untuk menyimpan data ke Shared Preferences
  void simpanData() async {
    print("SIMPAN DATA"); // Debugging untuk mencetak log penyimpanan data
    final prefs = await SharedPreferences
        .getInstance(); // Mengakses instance SharedPreferences
    if (prefs.getInt("angkaTerakhir") != null) {
      await prefs.remove("angkaTerakhir"); // Menghapus data lama jika ada
    } else {
      await prefs.setInt(
          "angkaTerakhir", data.value); // Menyimpan nilai terbaru
    }
  }

  // Fungsi untuk membaca data dari Shared Preferences
  void bacaData() async {
    final prefs = await SharedPreferences
        .getInstance(); // Mengakses instance SharedPreferences
    if (prefs.getInt("angkaTerakhir") != null) {
      data.value = prefs.getInt(
          "angkaTerakhir")!; // Jika data ada, tetapkan nilai ke variabel `data`
    }
  }

  // Fungsi untuk mereset data ke nilai awal
  void resetData() async {
    final prefs = await SharedPreferences
        .getInstance(); // Mengakses instance SharedPreferences
    if (prefs.getInt("angkaTerakhir") != null) {
      await prefs
          .remove("angkaTerakhir"); // Menghapus data dari Shared Preferences
      data.value = 0; // Mengatur nilai data ke 0
    }
  }

  // Metode yang dipanggil saat controller diinisialisasi
  @override
  void onInit() {
    bacaData(); // Membaca data saat controller diinisialisasi
    super.onInit(); // Memanggil inisialisasi dari superclass
  }

  // Fungsi simpan dan baca data lain yang bisa digunakan (saat ini dikomentari)
  // void simpanData() async {
  //   print("SIMPAN DATA");
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('name', "INI ROGER"); // Menyimpan data string
  // }

  // void bacaData() async {
  //   print("BACA DATA");
  //   final prefs = await SharedPreferences.getInstance();
  //   if (prefs.getString("name") != null) {
  //     data.value = prefs.getString("name")!; // Membaca data string
  //   }
  // }
}
