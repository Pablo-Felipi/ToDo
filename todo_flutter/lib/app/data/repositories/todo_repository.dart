import 'dart:convert';

import 'package:todo_flutter/app/domain/models/todo_model.dart';
import 'package:todo_flutter/app/interfaces/interface_client_http.dart';
import 'package:todo_flutter/app/interfaces/interface_todo_repositories.dart';

class TodoRepository implements InterfaceTodoRepositories {
  final InterfaceClientHttp client;
  final String todoUrl;

  TodoRepository({required this.client, required this.todoUrl});

  @override
  Future<List<TodoModel>> getData() async {
    final apiResponse = await client.getData(url: todoUrl);
    List<TodoModel> toDoList = <TodoModel>[];

    if (apiResponse.statusCode != 200) {
      throw Exception('Error to connect');
    }

    final body = jsonDecode(apiResponse.body);

    body.map((todo) {
      final todoItem = TodoModel.fromMap(map: todo);
      return toDoList.add(todoItem);
    }).toList();

    return toDoList;
  }

  @override
  Future createData({required Map<String, dynamic> data}) async {
    final apiResponse = await client.createData(url: todoUrl, data: data);

    if (apiResponse.statusCode != 200) {
      throw Exception('Error to create');
    }
  }

  @override
  Future deleteData({required int id}) async {
    final apiResponse = await client.deleteData(id: id, url: todoUrl);

    if (apiResponse.statusCode != 200) {
      throw Exception('Error to delete');
    }
  }

  @override
  Future updateData({required Map<String, dynamic> data}) async {
    final apiResponse = await client.updateData(url: todoUrl, data: data);

    if (apiResponse.statusCode != 200) {
      throw Exception('Error to update');
    }
  }
}
