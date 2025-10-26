import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:projetofelype/Domain/chart.dart';

class ChartApi {
  Future<Chart> get() async {
    final headers = {
      'Content-Type': 'application/json',
      'X-API-Key': 'APY0v17GfzPtm5fnnQmlYhVXeYM9cMp2Lg6Ffkp5CqjJsv7ut4XLd17wK4hfKllaLU7F',
    };

    final url = Uri.https(
      'api.apyhub.com',
      '/generate/charts/pie/url',
    );

    final payload = {
      "title": "Simple Pie Chart",
      "theme": "Light",
      "data": [
        {"value": 10, "label": "label a"},
        {"value": 20, "label": "label b"},
        {"value": 80, "label": "label c"},
        {"value": 50, "label": "label d"},
        {"value": 70, "label": "label e"},
        {"value": 25, "label": "label f"},
        {"value": 60, "label": "label g"},
      ]
    };
    final response = await http.post(url, headers: headers, body: jsonEncode(payload));
    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      return Chart.fromJson(jsonBody);
    } else {
      throw Exception('Erro ao carregar gráfico: ${response.statusCode} - ${response.body}');
    }
  }
}