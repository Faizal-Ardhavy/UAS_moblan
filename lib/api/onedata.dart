import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/jsonModel.dart';
import '../api/cobaAPI.dart';

class MahasiswaAPI {
  static Future<List<MahasiswaIlkom>> getAllMahasiswaIlkom(int halaman) async {
    // token.getToken();
    // print('dwadawda');
    String url =
        'http://onedata.unila.ac.id/api/live/0.1/lembaga/daftar_prodi/detail?page=${halaman}&limit=25&sort_by=DESC';
    print('aaaa1');
    String a = await token.getToken() as String;
    print(a);
    var headers = {"Authorization": "${a}"};
    final response = await http.get( Uri.parse(url), headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      if (json['data'] != null) {
        // print(json['data']);
        final mahasiswa = <MahasiswaIlkom>[];
        json['data'].forEach((v) {
          // print('AAAA = ' + v["NPM"]);
          // print('AAAA = ' + v["NPM"][1]);
          mahasiswa.add(MahasiswaIlkom.fromJson(v));
        });
        return mahasiswa;
      } else {
        print('jurusan gagal');
        return [];
      }
    } else {
      print('jurusan gagal 2');
      throw Exception('Failed to ANU');
    }
  }

}

class DiklatApi {
  static Future<List<Diklat>> getDiklat(int halaman) async {
    // token.getToken();
    // print('dwadawda');
    String url =
        'http://onedata.unila.ac.id/api/live/0.1/diklat/list?page=${halaman}&limit=25&sort_by=DESC';
    String a = await token.getToken() as String;
    var headers = {"Authorization": "${a}"};
    final response = await http.get( Uri.parse(url), headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      if (json['data'] != null) {
        // print(json['data']);
        final diklat = <Diklat>[];
        json['data'].forEach((v) {
          // print('AAAA = ' + v["NPM"]);
          // print('AAAA = ' + v["NPM"][1]);
          diklat.add(Diklat.fromJson(v));
        });
        return diklat;
      } else {
        print('diklat gagal');
        return [];
      }
    } else {
      print('diklat gagal 2');
      throw Exception('Failed to ANU');
    }
  }

}

class PenelitianApi {
  static Future<List<Penelitian>> getPenelitian(int halaman) async {
    // token.getToken();
    // print('dwadawda');
    String url =
        'http://onedata.unila.ac.id/api/live/0.1/penelitian/daftar?page=${halaman}&limit=10&sort_by=DESC';
    String a = await token.getToken() as String;
    var headers = {"Authorization": "${a}"};
    final response = await http.get( Uri.parse(url), headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      if (json['data'] != null) {
        // print(json['data']);
        final penelitian = <Penelitian>[];
        json['data'].forEach((v) {
          // print('AAAA = ' + v["NPM"]);
          // print('AAAA = ' + v["NPM"][1]);
          penelitian.add(Penelitian.fromJson(v));
        });
        return penelitian;
      } else {
        print('penelitian gagal');
        return [];
      }
    } else {
      print('penelitian gagal 2');
      throw Exception('Failed to ANU');
    }
  }
}

class GelarApi {
  static Future<List<Gelar>> getGelar(int halaman) async {
    // token.getToken();
    // print('dwadawda');
    String url = "http://onedata.unila.ac.id/api/live/0.1/referensi/gelar_akademik?page=${halaman}&limit=10";
    String a = await token.getToken() as String;
    var headers = {"Authorization": "${a}"};
    final response = await http.get( Uri.parse(url), headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      if (json['data'] != null) {
        // print(json['data']);
        final gelar = <Gelar>[];
        json['data'].forEach((v) {
          // print('AAAA = ' + v["NPM"]);
          // print('AAAA = ' + v["NPM"][1]);
          gelar.add(Gelar.fromJson(v));
        });
        return gelar;
      } else {
        print('gelar gagal');
        return [];
      }
    } else {
      print('gelar gagal 2');
      throw Exception('Failed to ANU');
    }
  }
}