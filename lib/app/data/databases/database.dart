import 'package:hive/hive.dart';

part 'database.g.dart';

// Entiti Notes, digunakan buat nyimpen catetan
@HiveType(typeId: 0)
class Notes extends HiveObject {
  @HiveField(0)
  int? id; // ID unik buat tiap catetan

  @HiveField(1)
  String? title; // Judul catetan

  @HiveField(2)
  String? desc; // Deskripsi catetan
}

// Manajer buat ngatur Notes
class NoteManager {
  // Fungsi buat ngembaliin semua Notes yang ada di box "notes"
  static Box<Notes> getAllNotes() {
    // Ambil box Notes yang udah didefinisiin di Hive
    return Hive.box<Notes>("notes");
  }
}
