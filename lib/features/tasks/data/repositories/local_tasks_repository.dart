import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:money_tracker/features/tasks/domain/entities/task_entity.dart';
import 'package:money_tracker/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: TasksRepository)
class LocalTasksRepository implements TasksRepository {
  static const _tasksKey = 'tasks';

  @override
  Future<List<TaskEntity>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_tasksKey);
    if (raw == null || raw.isEmpty) return const [];

    try {
      final decoded = jsonDecode(raw) as List<dynamic>;
      return decoded
          .map((e) => TaskEntity.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    } catch (_) {
      return const [];
    }
  }

  @override
  Future<void> saveTasks(List<TaskEntity> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(tasks.map((e) => e.toJson()).toList());
    await prefs.setString(_tasksKey, encoded);
  }
}
