import 'package:flutter/material.dart';

class ToDoModel extends ChangeNotifier {
  final List<String> _todos = [
    'Make Tutorial',
    'Finish Todo App',
  ];

  get todos => _todos;

  void addToDo(String newToDo) {
    _todos.add(newToDo);
    notifyListeners();
  }

  void deleteToDo(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }
}
