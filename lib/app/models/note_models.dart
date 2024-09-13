class NoteModels {
  int? id; // Id note, nullable bro jadi bisa null
  int? userId; // Id user yang punya note, nullable juga
  String? title; // Judul note, ini bisa null juga
  String? desc; // Deskripsi note, sama nih bisa null
  String? createdAt; // Waktu note dibuat, nullable juga buat fleksibel

  NoteModels(
      {this.id,
      this.userId,
      this.title,
      this.desc,
      this.createdAt}); // Constructor buat inisialisasi NoteModels, ya kalo ada datanya langsung assign aja

  NoteModels.fromJson(Map<String, dynamic> json) {
    // Constructor buat bikin objek dari JSON, biar gampang kalo ambil data dari API
    id = json["id"]; // Id diambil dari JSON
    userId = json["user_id"]; // Id user juga diambil dari JSON
    title = json["title"]; // Judul note dari JSON
    desc = json["desc"]; // Deskripsi note dari JSON
    createdAt = json["created_at"]; // Tanggal pembuatan note dari JSON
  }

  Map<String, dynamic> toJson() {
    // Method buat convert objek NoteModels ke JSON, biar bisa kirim data ke server atau API gitu
    final data = <String, dynamic>{}; // Bikin map kosong buat simpen datanya
    data["id"] = id; // Set id ke map
    data["user_id"] = userId; // Set id user ke map
    data["title"] = title; // Set judul ke map
    data["desc"] = desc; // Set deskripsi ke map
    data["created_at"] = createdAt; // Set waktu pembuatan ke map
    return data; // Return map yang udah diisi
  }

  static List<NoteModels> fromJsonList(List? data) {
    // Method static buat convert list JSON jadi list objek NoteModels
    if (data == null || data.isEmpty) {
      return []; // Kalo datanya null atau kosong, balikin list kosong aja
    }
    return data
        .map((e) => NoteModels.fromJson(e))
        .toList(); // Map tiap item di list JSON jadi NoteModels, trus di-convert ke list
  }
}
