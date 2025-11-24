import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      'https://my-json-server.typicode.com/ri3ck/lojinha-avatar-api/produtos';

  Future<List<Map<String, dynamic>>> fetchAllProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Erro ao buscar produtos: ${response.statusCode}');
    }
  }
}