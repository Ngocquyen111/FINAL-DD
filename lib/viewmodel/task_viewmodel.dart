import 'package:flutter/material.dart';
import '../database/task_database.dart';
import '../model/task.dart';

class TaskViewModel extends ChangeNotifier {
  final TaskDatabase _db = TaskDatabase.instance;

  List<Task> tasks = [];

  Future<void> loadTasks() async {
    tasks = await _db.getAllTasks();
    notifyListeners();
  }

  Future<void> addTask(String title, String description) async {
    if (title.trim().isEmpty) return;

    await _db.insertTask(
      Task(title: title, description: description),
    );

    await loadTasks(); // ❗ QUAN TRỌNG
  }
}
