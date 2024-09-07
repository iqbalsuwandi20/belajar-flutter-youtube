import 'package:moor_flutter/moor_flutter.dart';

part 'note_database.g.dart';

/// Tabel buat nyimpen catatan di database.
class NoteDatabase extends Table {
  /// Kolom integer yang auto-increment buat ID, ini jadi kunci utama bro.
  IntColumn get id => integer().autoIncrement().nullable()();

  /// Kolom teks buat judul catatan, panjangnya dibatasin biar nggak kepanjangan.
  TextColumn get title => text().withLength(min: 1, max: 255)();

  /// Kolom teks buat deskripsi catatan, sama juga ada batas panjang teksnya.
  TextColumn get desc => text().withLength(min: 1, max: 255)();
}

/// Ini manajer buat ngatur database Moor yang bakal ngurusin catatan lo.
@UseMoor(tables: [NoteDatabase])
class NoteManager extends _$NoteManager {
  /// Inisialisasi manajer ini, sambil set path database dan versi skemanya bro.
  NoteManager()
      : super(FlutterQueryExecutor.inDatabaseFolder(path: "notes.sqlite"));

  @override
  int get schemaVersion => 1;

  /// Ngambil semua catatan dari database dalam bentuk list. Gampang kan?
  Future<List<NoteDatabaseData>> fetchAllNotes() => select(noteDatabase).get();

  /// Dapet stream dari semua catatan yang ada, biar update terus secara real-time gitu.
  Stream<List<NoteDatabaseData>> streamAllNotes() =>
      select(noteDatabase).watch();

  /// Masukin catatan baru ke database, catatannya langsung ke-save bro.
  Future<int> insertNotes(NoteDatabaseData noteDatabaseData) =>
      into(noteDatabase).insert(noteDatabaseData);

  /// Buat update catatan yang udah ada di database, gampang gini doang.
  Future<bool> updateNotes(NoteDatabaseData noteDatabaseData) =>
      update(noteDatabase).replace(noteDatabaseData);

  /// Hapus catatan dari database, langsung ilang nih.
  Future<int> deleteNotes(NoteDatabaseData noteDatabaseData) =>
      delete(noteDatabase).delete(noteDatabaseData);
}
