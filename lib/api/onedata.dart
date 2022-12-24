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
        print('mahasiswa gagal');
        return [];
      }
    } else {
      print('mahasiswa gagal 2');
      throw Exception('Failed to ANU');
    }
  }

  static Future<String> getTelephone(String id) async {
    String url =
        'http://onedata.unila.ac.id/api/live/0.1/mahasiswa/detail?id_peserta_didik=$id';
    String a = await token.getToken() as String;
    var headers = {"Authorization": "${a}"};
    final response = await http.get( Uri.parse(url),headers: headers);
    // print(response);
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      if (json['data'] != null) {
        var get_token_json = jsonDecode(response.body);
        String token_result =
            get_token_json['data'][0]['no_telepon'].toString();
        return token_result;
      } else {
        print('mahasiswa gagal');
        return '';
      }
    } else {
      print('mahasiswa gagal 2');
      throw Exception('Failed to ANU');
    }

    // if (response.statusCode == 200) {
    //   final Map<String, dynamic> json = jsonDecode(response.body);
    //   if (json['data'] != null) {
    //     // print(json['data']);
    //     final mhs = <MahasiswaIlkomDetail>[];
    //     json['data'].forEach((v) {
    //       mhs.add(MahasiswaIlkomDetail.fromJson(v));
    //     });
    //     return mhs;
    //   } else {
    //     print('mahasiswa gagal');
    //     return [];
    //   }
    // } else {
    //   print('mahasiswa gagal 2');
    //   throw Exception('Failed to ANU');
    // }
  }
}