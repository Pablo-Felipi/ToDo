import 'dart:convert';

class TodoModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  Map<String, dynamic> toMap() {
    return {'userId': userId, 'id': id, 'title': title, 'completed': completed};
  }

  String toJson() => jsonEncode(toMap());

  factory TodoModel.fromMap({required Map<String, dynamic> map}) {
    return TodoModel(
      userId: map['userId'],
      id: map['id'],
      title: map['title'],
      completed: map['completed'],
    );
  }

  factory TodoModel.fromJson({required String source}) =>
      TodoModel.fromMap(map: jsonDecode(source));

  factory TodoModel.empty() {
    return TodoModel(userId: 0, id: 0, title: '', completed: false);
  }
}
