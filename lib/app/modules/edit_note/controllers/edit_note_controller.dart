import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Controller buat ngatur editing catatan pake GetX.
class EditNoteController extends GetxController {
  /// Controller buat ngatur input teks di field judul.
  TextEditingController titleC = TextEditingController();

  /// Controller buat ngatur input teks di field deskripsi.
  TextEditingController descC = TextEditingController();

  /// Status loading yang bisa dipantau, dipake buat nampilin
  /// indikator loading kalo lagi proses editing catatan.
  RxBool isLoading = false.obs;
}
