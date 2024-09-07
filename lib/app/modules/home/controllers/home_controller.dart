import 'package:get/get.dart';
import '../../../data/databases/note_database.dart';

/// Controller utama buat manage catatan lo. Semua data di-handle di sini, bro.
class HomeController extends GetxController {
  /// Ini nih, objek buat manage database catatan. Lo bisa pakai ini buat
  /// insert, update, delete, sama fetch catatan lo, gitu kan.
  NoteManager noteM = NoteManager();
}
