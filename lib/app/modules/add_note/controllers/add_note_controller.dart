import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Controller buat ngatur proses nambah catatan pake GetX.
class AddNoteController extends GetxController {
  /// Controller buat ngatur input teks di field judul bro.
  TextEditingController titleC = TextEditingController();

  /// Controller buat ngatur input teks di field deskripsi nih.
  TextEditingController descC = TextEditingController();

  /// Status loading yang bisa dipantau, buat nampilin
  /// indikator loading kalo lagi ada proses jalan.
  RxBool isLoading = false.obs;
}
