import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'tasks_event.dart';
import 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState(tasks: [])) {
    on<LoadTasks>(_onLoadTasks);
    on<AddTask>(_onAddTask);
    on<EditTask>(_onEditTask);
    on<ToggleTaskStatus>(_onToggleTaskStatus);
    on<DeleteTask>(_onDeleteTask);

    add(LoadTasks());
  }

  Future<void> _onLoadTasks(LoadTasks event, Emitter<TasksState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString('tasks');
    if (raw == null) return;

    final decoded = jsonDecode(raw) as List<dynamic>;
    var idSeed = DateTime.now().microsecondsSinceEpoch;
    var changed = false;
    final loaded = decoded.map((e) {
      final task = Map<String, dynamic>.from(e);
      final id = task["id"]?.toString();
      if (id == null || id.isEmpty) {
        task["id"] = (++idSeed).toString();
        changed = true;
      }
      return task;
    }).toList();

    emit(state.copyWith(tasks: loaded));
    if (changed) {
      await _persist(loaded);
    }
  }

  Future<void> _persist(List<Map<String, dynamic>> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('tasks', jsonEncode(tasks));
  }

  Future<void> _onAddTask(AddTask event, Emitter<TasksState> emit) async {
    final updated = List<Map<String, dynamic>>.from(state.tasks);
    updated.insert(0, {
      "id": DateTime.now().microsecondsSinceEpoch.toString(),
      "title": event.title,
      "status": "overdue",
    });
    emit(state.copyWith(tasks: updated));
    await _persist(updated);
  }

  Future<void> _onEditTask(EditTask event, Emitter<TasksState> emit) async {
    final updated = List<Map<String, dynamic>>.from(state.tasks);
    final task = Map<String, dynamic>.from(updated[event.index]);
    task["title"] = event.title;
    updated[event.index] = task;
    emit(state.copyWith(tasks: updated));
    await _persist(updated);
  }

  Future<void> _onToggleTaskStatus(
    ToggleTaskStatus event,
    Emitter<TasksState> emit,
  ) async {
    final updated = List<Map<String, dynamic>>.from(state.tasks);
    final task = Map<String, dynamic>.from(updated[event.index]);
    task["status"] = task["status"] == "overdue" ? "done" : "overdue";
    updated[event.index] = task;
    emit(state.copyWith(tasks: updated));
    await _persist(updated);
  }

  Future<void> _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) async {
    final updated = List<Map<String, dynamic>>.from(state.tasks);
    updated.removeWhere((t) => t["id"]?.toString() == event.id);
    emit(state.copyWith(tasks: updated));
    await _persist(updated);
  }
}
