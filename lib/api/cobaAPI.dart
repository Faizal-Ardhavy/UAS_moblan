import 'dart:convert';
import 'package:http/http.dart' as http;

class token {
  // static? String token;
  static Future<String> getToken() async {
    String url = 'http://onedata.unila.ac.id/api/live/0.1/auth/login';
    String username = 'mhs-testing';
    String idAplikasi = '948df317-78f7-4b92-a53f-0a56215e07de';
    String password = 'unilajaya';
    // print("LELE123");
    var APIToken = await http.post(Uri.parse(url), body: {
      'username': username,
      'id_aplikasi': idAplikasi,
      'password': password,
    });
    // print("LELE");
    var get_token_json = json.decode(APIToken.body);
    String token_result = get_token_json['data']['token_bearer'].toString();
    return token_result;
  }
}