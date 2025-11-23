import 'package:projetofelype/Domain/holiday.dart';
import 'package:dio/dio.dart';

class HolidaysApi {
  final dio = Dio();
  String baseUrl = 'https://brasilapi.com.br/api';

  Future<List<Holiday>> findByYear(String year) async {
    List<Holiday> listaHolidays = [];

    final response = await dio.get('$baseUrl/feriados/v1/$year');

    if(response.statusCode == 200) {
      var result = response.data;

      //ForEach
      for(var json in result) {
        Holiday holiday = Holiday.fromJson(json);
        listaHolidays.add(holiday);
      }
    }
    print(response);
    return listaHolidays;
  }
}