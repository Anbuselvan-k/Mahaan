import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://chitsoft.in/wapp/api/m_api/';

  static Future<Map<String, dynamic>> signupUser({
    required String name,
    required String mobile,
    required String email,
    required String lnt,
    required String lng,
    required String device_id,

  }) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      body: {
        'cid':'47157172',

        'lt':lnt,
        'ln':lng,
        'device_id':device_id,

        'type':'1011',

        'email':email,
        'mobile':mobile,
        'name':name
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to sign up');
    }
  }
}

