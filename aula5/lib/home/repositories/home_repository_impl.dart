import 'package:dio/dio.dart';

import 'home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<List<dynamic>> getTarefas() async {
    final response =
        await Dio().get("https://jsonplaceholder.typicode.com/posts");
    return response.data;
  }
}
