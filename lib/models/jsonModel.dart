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
    // required this.nomor_hp,
    // required this.nomor_hp_darurat
  });

  MahasiswaIlkom.fromJson(Map<String, dynamic> json) {
    id_sms = json['id_sms'];
    nm_lemb = json['nm_lemb'];
    kode_prodi = json['kode_prodi'];
    sks_lulus = json['sks_lulus'];
    // nomor_hp = json['nomor_hp'];
    // nomor_hp_darurat = json['nomor_hp_darurat'];
  }
}