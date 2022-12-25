class MahasiswaIlkom {
 String? id_sms;
 String ? nm_lemb;
 String ? kode_prodi;
 String ? stat_prodi;
 String ? sks_lulus;
  // String? nomor_hp;
  // String? nomor_hp_darurat;

  MahasiswaIlkom({
    required this.id_sms,
    required this.nm_lemb,
    required this.kode_prodi,
    required this.sks_lulus,
    required List<MahasiswaIlkom> mahasiswas,

  });

  MahasiswaIlkom.fromJson(Map<String, dynamic> json) {
    id_sms = json['id_sms'];
    nm_lemb = json['nm_lemb'];
    kode_prodi = json['kode_prodi'];
    sks_lulus = json['sks_lulus'];

  }
}

class Diklat {
 String? id_diklat;
 String ? jenis_diklat;
 String ? nama_diklat;
 String ? penyelenggara;
 String ? tahun;


  Diklat({
    required this.id_diklat,
    required this.jenis_diklat,
    required this.penyelenggara,
    required this.tahun,
    required List<Diklat> diklat,
  });

  Diklat.fromJson(Map<String, dynamic> json) {
    id_diklat = json['id_diklat'];
    nama_diklat = json['nama_diklat'];
    penyelenggara = json['penyelenggara'];
    tahun = json['tahun'];
  }
}

class Penelitian {
 String? id;
 String ? judul_penelitian;
 String ? bidang_keilmuan;
 String ? waktu_data_ditambahkan;
 String ? tahun;


  Penelitian({
    required this.id,
    required this.judul_penelitian,
    required this.waktu_data_ditambahkan,
    required this.tahun,
    required List<Penelitian> penelitian
  });

  Penelitian.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul_penelitian = json['judul_penelitian'];
    waktu_data_ditambahkan = json['waktu_data_ditambahkan'];
    tahun = json['tahun'];
  }
}

class Gelar{
 String? id_gelar_akad;
 String ? singkat_gelar;
 String ? nm_gelar_akad;
 String ? waktu_data_ditambahkan;
 String ? terakhir_diubah;


  Gelar({
    required this.id_gelar_akad,
    required this.nm_gelar_akad,
    required this.waktu_data_ditambahkan,
    required this.terakhir_diubah,
    required this.singkat_gelar,
    required List<Penelitian> penelitian
  });

  Gelar.fromJson(Map<String, dynamic> json) {
    id_gelar_akad = json['id_gelar_akad'];
    nm_gelar_akad = json['nm_gelar_akad'];
    singkat_gelar = json['singkat_gelar'];
    waktu_data_ditambahkan = json['waktu_data_ditambahkan'];
    terakhir_diubah = json['terakhir_diubah'];
  }
}