import 'package:dio/dio.dart';
import 'package:projetofelype/Domain/frase.dart';

class FrasesFakeApi {
  final dio = Dio();
  String baseurlFrases =
      "https://my-json-server.typicode.com/FelypeMonteiro/fake-api";

  Future<List<Frase>> findAll() async {
    List<Frase> listaFrases = [];

    final resposne = await dio.get("$baseurlFrases/frases");
    print(resposne);

    if (resposne.statusCode == 200) {
      var result = resposne.data;

      for (var json in result) {
        Frase frase = Frase.fromJson(json);
        listaFrases.add(frase);
      }
    }

    return listaFrases;
  }
}
