import 'package:projetofelype/Domain/task.dart';
import 'package:dio/dio.dart';

class TasksApi {
  final dio = Dio();
  String baseUrl = 'https://my-json-server.typicode.com/Sofislt/fake-api-task';

  Future<List<Task>> findAll() async {
    List<Task> listaTasks = [];

    final response = await dio.get('$baseUrl/tasks');

    if(response.statusCode == 200) {
      var result = response.data;

      //ForEach
      for(var json in result) {
        Task task = Task.fromJson(json);
        listaTasks.add(task);
      }
    }
    print(response);
    return listaTasks;
  }
}