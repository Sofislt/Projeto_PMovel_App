import 'package:projetofelype/Domain/holiday.dart';
import 'package:dio/dio.dart';

class HolidaysApi {
  final dio = Dio();
  String baseUrl = 'https://brasilapi.com.br/api';

  Future<Holiday> findByYear(String year) async {
    final response = await dio.get('$baseUrl/feriados/v1/$year');

    Holiday listaHolidays = Holiday.fromJson(response.data);
    print(response);
    return listaHolidays;
  }
}