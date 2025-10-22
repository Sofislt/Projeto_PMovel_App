import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://fakestoreapi.com/products';

  Future<List<Map<String, dynamic>>> fetchAllProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Erro ao buscar produtos: ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> fetchProductById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Produto não encontrado');
    }
  }
}

