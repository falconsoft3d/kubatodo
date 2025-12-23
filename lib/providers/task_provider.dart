import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];
  static const String _storageKey = 'tasks';

  List<Task> get tasks => _tasks;
  List<Task> get activeTasks => _tasks.where((task) => !task.isCompleted).toList();
  List<Task> get completedTasks => _tasks.where((task) => task.isCompleted).toList();

  TaskProvider() {
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = prefs.getString(_storageKey);
    
    if (tasksJson != null) {
      final List<dynamic> decoded = json.decode(tasksJson);
      _tasks = decoded.map((item) => Task.fromJson(item)).toList();
      notifyListeners();
    }
  }

  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = json.encode(_tasks.map((task) => task.toJson()).toList());
    await prefs.setString(_storageKey, tasksJson);
  }

  Future<void> addTask(String title, {String? description}) async {
    final task = Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      createdAt: DateTime.now(),
    );
    
    _tasks.insert(0, task);
    notifyListeners();
    await _saveTasks();
  }

  Future<void> toggleTask(String id) async {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      final task = _tasks[index];
      _tasks[index] = task.copyWith(
        isCompleted: !task.isCompleted,
        completedAt: !task.isCompleted ? DateTime.now() : null,
      );
      notifyListeners();
      await _saveTasks();
    }
  }

  Future<void> deleteTask(String id) async {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
    await _saveTasks();
  }

  Future<void> updateTask(String id, String title, {String? description}) async {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks[index] = _tasks[index].copyWith(
        title: title,
        description: description,
      );
      notifyListeners();
      await _saveTasks();
    }
  }
}
