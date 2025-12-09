import 'package:projetofelype/Domain/Local.dart';
import 'package:dio/dio.dart';

class LocaisApi {
  final dio = Dio();
  String baseUrl = 'https://my-json-server.typicode.com/tarsisms/fake-api';

  Future<List<Local>> findAll() async {

    List<Local> listaLocais = [];

    final response = await dio.get('$baseUrl/properties');
    print(response);

    if (response.statusCode == 200) {
      var result = response.data;

      for (var json in result) {
        Local local = Local.fromJson(json);
        listaLocais.add(local);
      }
    }
    return listaLocais;
  }
}