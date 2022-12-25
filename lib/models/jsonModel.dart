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