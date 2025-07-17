import 'package:flutter/material.dart';
import 'package:todo_flutter/app/domain/models/todo_model.dart';
import 'package:todo_flutter/app/interfaces/interface_todo_repositories.dart';

class TodoController extends ChangeNotifier {
  final InterfaceTodoRepositories repository;
  final String todoUrl;
  String isError = '';
  bool isLoading = false;
  List<TodoModel> state = <TodoModel>[];

  TodoController({required this.repository, required this.todoUrl});

  Future<void> getTodo() async {
    isLoading = true;
    notifyListeners();
    try {
      state = await repository.getData();
    } catch (e) {
      isError = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> update({required TodoModel todo}) async {
    isLoading = true;
    notifyListeners();
    try {
      await repository.updateData(data: todo.toMap());
      state = await repository.getData();
    } catch (e) {
      isError = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> create({required TodoModel todo}) async {
    isLoading = true;
    notifyListeners();
    try {
      await repository.createData(data: todo.toMap());
      state = await repository.getData();
    } catch (e) {
      isError = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> delete({required int todoId}) async {
    isLoading = true;
    notifyListeners();
    try {
      await repository.deleteData(id: todoId);
      state = await repository.getData();
    } catch (e) {
      isError = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
