import 'dart:io'; // Digunakan untuk mengakses direktori file pada perangkat.
import 'package:path_provider/path_provider.dart'; // Digunakan untuk mendapatkan direktori aplikasi.
import 'package:sqflite/sqflite.dart'; // Paket untuk bekerja dengan database SQLite.
import 'package:path/path.dart'; // Digunakan untuk manipulasi path file.

// Kelas DbManager untuk mengelola koneksi dan operasi pada database SQLite
class DbManager {
  // Singleton untuk mencegah multiple instances
  DbManager._privateConstructor();
  static DbManager instance = DbManager._privateConstructor();

  // Variabel untuk menyimpan instance database
  Database? _db;

  // Getter untuk mendapatkan instance database
  // Jika database belum diinisialisasi, maka akan dipanggil _initDB()
  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDB();
      return _db!;
    } else {
      return _db!;
    }
  }

  // Inisialisasi dan pembukaan database
  Future _initDB() async {
    // Mendapatkan direktori penyimpanan dokumen aplikasi
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    // Menyusun path lengkap untuk file database
    String path = join(documentDirectory.path, "note.db");

    // Membuka atau membuat database
    return await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) async {
        // Membuat tabel "notes" dengan kolom id, title, dan desc
        return await database.execute(
          """
            CREATE TABLE notes (
              id INTEGER PRIMARY KEY, // Kolom id sebagai primary key
              title TEXT NOT NULL,    // Kolom title dengan tipe TEXT dan tidak boleh null
              desc TEXT NOT NULL      // Kolom desc dengan tipe TEXT dan tidak boleh null
            )
          """,
        );
      },
    );
  }

  // Menutup koneksi database
  Future closeDB() async {
    // Memastikan database telah diinisialisasi
    _db = await instance.db;

    // Menutup koneksi database
    _db!.close();
  }
}
