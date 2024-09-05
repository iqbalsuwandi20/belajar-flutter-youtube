import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final box = GetStorage(); // Inisialisasi penyimpanan menggunakan GetStorage
  RxInt data = 0.obs; // Deklarasi variabel observasi untuk menyimpan nilai data

  // Fungsi untuk mengurangi nilai data
  void decrement() {
    data--; // Mengurangi nilai data
    simpanData(); // Memanggil fungsi untuk menyimpan data ke GetStorage
  }

  // Fungsi untuk menambah nilai data
  void increment() {
    data++; // Menambah nilai data
    simpanData(); // Memanggil fungsi untuk menyimpan data ke GetStorage
  }

  // Fungsi untuk menyimpan data ke GetStorage
  void simpanData() async {
    print("SIMPAN DATA"); // Debugging untuk mencetak log penyimpanan data

    if (box.read("angkaTerakhir") != null) {
      await box.remove("angkaTerakhir"); // Menghapus data lama jika ada
    } else {
      await box.write(
          "angkaTerakhir", data.value); // Menyimpan nilai terbaru ke GetStorage
    }
  }

  // Fungsi untuk membaca data dari GetStorage
  void bacaData() async {
    if (box.read("angkaTerakhir") != null) {
      data.value = box.read("angkaTerakhir")!
          as int; // Jika data ada, tetapkan nilai ke variabel `data`
    }
  }

  // Fungsi untuk mereset data ke nilai awal
  void resetData() async {
    if (box.read("angkaTerakhir") != null) {
      await box.remove("angkaTerakhir"); // Menghapus data dari GetStorage
      data.value = 0; // Mengatur nilai data ke 0
    }
  }

  // Metode yang dipanggil saat controller diinisialisasi
  @override
  void onInit() {
    bacaData(); // Membaca data saat controller diinisialisasi
    super.onInit(); // Memanggil inisialisasi dari superclass
  }
}
