import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<dynamic>> getMethod(String url) async {
    String _username = 'admin';
    String _password = '1234';
    String _basicAuth =
        'Basic ' + base64Encode(utf8.encode('$_username:$_password'));

    final response = await http.get(Uri.parse(url), headers: {
      'authorization': _basicAuth,
      "content-type": "application/json"
    });

    return json.decode(response.body);
  }
}
